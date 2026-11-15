# NashBlowups package report

The package is `packages/NashBlowups/README.md` (1610 lines, eight layers, 38 numbered subsections, every layer
ending in Examples and Dependencies), `packages/NashBlowups/Suggested.lean` (94 lines: one predicate, two
theorems), `packages/NashBlowups/metadata.toml` (`topic = "math.AG"`, as the algebraic-geometry roadmaps on main)
and `packages/NashBlowups/sources.toml` (15 entries, unchanged keys). `design/plan.json` is unchanged: no supplier
gap is needed, so its `gaps` list stays empty.

The README is the accepted design written out in final form. Every target, Check and worked example of the
design is kept. The accepting review (`REV-DESIGN-NashBlowups~9`) had no finding; its one remark (the matrix of
§5.1 is unitriangular for the product order whether or not the `x_j` lie in `m`, and the identity modulo `m`
when they do) is applied in §5.1.

## Headline theorems

Listed before `Suggested.lean` was written (the list was saved in the job's scratch directory first).

| Headline | Status | Lean name, or what is missing |
|---|---|---|
| Triviality criterion (§2.5): for `X` in the Setting, `ν` is an isomorphism iff `Ω_{X/k}` has a locally free quotient of rank `d` | not statable at the pins | No carrier for `X*` or `ν`. The construction needs the Grassmannian `Gr_d(F) → X` of a quasi-coherent sheaf of finite type on a scheme that need not be affine, with universal quotient and classifying maps (AlgebraicModuliForArithmeticGeometry §1.3). Tau Ceti has `Module.Grassmannian.scheme` over an affine base only, and `CommMon.relativeProj` without the universal property that would classify `∧^d Ω` over the smooth locus. |
| Nobile's Theorem 1 (§§3.2–3.3): `X*` is locally a blowup; for a hypersurface it is the blowup of the Jacobian ideal | not statable | Same: no `X*`. |
| Nobile's theorem (§4.5): in characteristic zero `ν` is an isomorphism iff `X` is smooth | not statable in the form for `ν` (no `X*`) | Its differential form (§4.4) is stated: `TauCetiRoadmap.NashBlowups.smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_charZero`. |
| Duarte–Núñez-Betancourt (§5.4): for normal `X` over a perfect field of characteristic `p`, `ν` is an isomorphism iff `X` is smooth | not statable in the form for `ν` (no `X*`) | Its differential form (§5.4, first statement) is stated: `TauCetiRoadmap.NashBlowups.smooth_iff_hasLocallyFreeQuotientOfDifferentials_of_isNormalScheme`. |
| Criteria for the normalised Nash blowup (§6.4) | not statable | No `X*`, hence no `X̄*` (Mathlib's relative normalisation is there, but not its input). |
| Never-resolves principle (§7.3) | not statable | No iterates of `X*` or `X̄*`. |

The only definition in the file is the predicate `HasLocallyFreeQuotientOfDifferentials k X d` (README §0.7). It
has a real body on native carriers: there is an `E : FiniteLocallyFreeSheaf.FixedRank X d` (Tau Ceti) with an
epimorphism `X.relativeDifferentials k ⟶ E.obj.obj`. Both stated theorems are statements in their own right, not
stand-ins for the forms for `ν`. They are the deep parts of the two theorems: nashModificationNotes2024 Proposition
2.3 for the first, and the proof of duarteNunezBetancourt2020 Theorem 3.10 for the second. The docstring names
every headline that cannot be stated and what it lacks.

## What changed from the design, and why

- **§0.7 added** (Locally free quotients of the differentials). It defines the predicate of the two Lean
  headlines, with API covering restriction, smooth schemes, uniqueness, glueing and the stalk criterion. The stalk
  criterion goes through Tau Ceti's `Scheme.relativeDifferentialsStalkEquiv` and stacksAlgebra Lemmas 10.10.2
  (0583, line 905) and 10.40.5 (00L2, line 4466). §0.7 has four Checks. In the design the condition was only a
  phrase inside §§2.5, 4.4 and 5.4; the three statements now share one definition. The Conventions define the
  phrase. §2.5 states its criterion with the predicate.
- **§4.4 is an iff**, under the name it has in `Suggested.lean`. The design proved one direction (*smooth_of_kaehler_surjection_charZero*). The converse is
  one sentence (by §0.3, a smooth `X` that is pure of dimension `d` has `Ω` locally free of rank `d`). The iff is
  the criterion a reader names. The route now starts from the stalk of the quotient at a closed point (§0.7).
  Three Checks were added: `Spec ℚ[ε]/(ε²)` shows reducedness is needed, `𝔸² ⊔ 𝔸¹` shows pure dimension is
  needed, and a case with `d = 0`.
- **§5.4 gained its differential form** as a first statement, with the Lean name. The design's §5.4 already used
  this route (§2.5, then §5.3, then §0.5), but did not state the differential form separately. Three Checks were
  added: the quadric cone in characteristic `2`, the case `d = 0`, and `Spec 𝔽_2[ε]/(ε²)`.
- **§5.3 generalised** from "of finite type" to "locally of finite type". The route uses only an affine open
  around `x`. The differential form in §5.4 is local and needs this.
- **§5.1**: the review's remark is applied, and a Check computing the case `p = 3`, `d = 1` was added.
- **§3.3** names `J_f` as the image of the derivative ideal of `(f)` from ResolutionOfSingularitiesCharacteristicZero
  §2.15 (see duplication below).
- Supplier contracts, From Tau Ceti: new entries for `Scheme.relativeDifferentialsStalkEquiv` (with the
  `stalkBaseAlgebra` instance) and `FiniteLocallyFreeSheaf.FixedRank`. New subsection From
  TauCetiRoadmap.ResolutionOfSingularitiesCharacteristicZero (§2.15). "How to read the build" and the Layer 0, 3,
  4 and 5 Dependencies now mention these.
- Form: a code span in §6.3 that crossed a line break (the gate read it as TeX) now sits on one line. "Are not
  planned" became "lie outside this roadmap". The Conventions line on italics no longer says "proposed": italic
  names are suggested names for targets that `Suggested.lean` does not state.

Nothing in the README is left unsupported. No notion was moved down from a later roadmap. `design/plan.json`
may change only in its `gaps` list, so it does not record §0.7, the iff form of §4.4 or the first statement of
§5.4. Those three are README targets added in this package.

## Duplication sweep and ownership

Searched by object on main (1a19c9f) and at the heads of the 477 open roadmap pull requests (`roadmaps grep`).
Also searched: the board's package READMEs and design READMEs, and the pinned Mathlib and Tau Ceti.

| Object | Result |
|---|---|
| Nash blowup / modification / transform | no match anywhere |
| Comparison map `f*Ω_{Y/R} → Ω_{X/R}` of schemes, base change of `Ω` (01UV, 01UX, 01V0, 01UZ) | no owner. AdicSpacesPartIII §R3.6 (main) has the analogue for continuous differentials of adic spaces, another object; Scope says so in one clause. StableReduction (main) Layers 0–1 develop "Kähler differentials far enough to form `Sing(f)`" but state no comparison or base-change map. At the pins Tau Ceti has restriction to opens and stalks only, plus `singularLocus_eq_comap_of_isPullback`, which is about Fitting ideals, not this map. |
| Normality under separable base change (0C3M) | no owner (only uses of "geometrically normal" in proofs) |
| Seidenberg's lemma, derivation-stable ideals | no owner (Tarski–Seidenberg; enveloping-algebra ideals; DGA differential ideals: other objects) |
| Lie derivative on Kähler differentials | DiophantineApproximationAndTranscendence §5.6, cited as before (fields, characteristic zero); §4.2 says how it differs |
| `p`-bases, `p`-monomials, Frobenius pushforward | DerivedDeRhamCohomology §0.23, cited as before; PadicDifferentialEquationsAndRigidCohomology uses `p`-monomial bases of `k((t))`, another object |
| Jacobian ideal | ResolutionOfSingularitiesCharacteristicZero §2.15 (main) owns the **derivative ideal** of a polynomial ideal. §3.3 now cites it and does not define `J_f` again. LefschetzPencils (`T¹`), CanonicalModelsAndGonality (smooth plane curves) and AlgebraicTopologyPartII (Milnor numbers) use other objects. |
| Locally free quotient of the differentials of rank `d`; smooth locus of dimension `d` | no match |
| Gauss map | LefschetzPencilsAndVanishingCycles and SheafConvolutionOnAbelianVarieties: Gauss maps of hypersurfaces and abelian varieties, other objects |

**Removals: none.** The sweep found no target here that another roadmap already states. The one new citation
(ResolutionOfSingularitiesCharacteristicZero §2.15) replaces nothing: §3.3 never defined `J_f` as a target of its
own. The closest roadmaps named in the overlap file were read for scope against this roadmap's ownership: on main,
SchemeAndStackFoundations, AbhyankarLemma and ResolutionOfSingularitiesCharacteristicZero; open, PurityOfBranchLocus,
LogPluricanonicalForms and AdicCoefficientsAndComparisonsPartII. Nothing is shared besides the citations above. No
declaration of `Suggested.lean` takes the fully qualified name of another roadmap's declaration.

Every cited id was re-resolved this round. At the heads of the open pull requests that add AlgebraicModuliForArithmeticGeometry and
DerivedDeRhamCohomology: §§1.3 and 5.4 with their names, and §0.23 with `DerivedDeRham.IsPBasis` and
`DerivedDeRham.pBasis_kaehler_basis`. Both pull requests add new folders and are earlier in the merge order. On main:
SchemeAndStackFoundations §§0.7, 0.11, 0.17, 0.23, 0.30, 4.11, 4.13; EnhancedDerivedSheaves §E1.6;
DiophantineApproximationAndTranscendence §5.6; ResolutionOfSingularitiesCharacteristicZero §2.15; AdicSpacesPartIII
§R3.6. The open revisions keep every one of these ids: the one revision of SchemeAndStackFoundations, the two of
EnhancedDerivedSheaves and the one of AdicSpacesPartIII. No open revision of ResolutionOfSingularitiesCharacteristicZero
or DiophantineApproximationAndTranscendence exists. `roadmaps resolve` on the final README finds no unresolved
cross-roadmap citation and no unresolved roadmap Lean name.

## Supplier gaps

None. Every input is stated by its owner, and the README keeps "No gap is recorded".

## Library declarations at the pins

`roadmaps resolve` could not check library names on this host, so they were checked directly.

- A scratch file with `#check @…` for 72 Mathlib and Tau Ceti names cited in the README elaborated with no error.
- Nine names live in six Tau Ceti modules whose object files are not built: `IdealSheafData.blowup`, `blowupToBase`,
  `blowupLift`, `blowup_hom_ext`, `isIso_blowupToBase_iff`, `isProper_blowupToBase`,
  `Scheme.Hom.isIso_normalizationDesc_iff`, `KaehlerDifferential.kerCotangentToTensor_bijective_of_formallyEtale`
  and `TauCeti.powRingHom_finite`. These were read in the pinned source, under `TauCeti/` (and `TauCeti/AlgebraicGeometry/` for the first four files):
  - `Blowup/IdealSheaf.lean:120, 124, 191`
  - `Blowup/UniversalProperty.lean:297, 372`
  - `Blowup/ExceptionalDivisor.lean:203`
  - `Normalization/IsIso.lean:114`
  - `RingTheory/Kaehler/Conormal.lean:76`
  - `Algebra/CharP/Frobenius/Finite.lean:62`
- The new contract entries are at `AlgebraicGeometry/Modules/Differentials/Stalk.lean:288`,
  `AlgebraicGeometry/Scheme/BaseAlgebra.lean:119` and `AlgebraicGeometry/VectorBundle/FixedRank.lean:52, 71`.

## Adversarial pass

`C_p` is the cusp `y² = x³` in characteristic `p`. "L ↔ R" lists the truth values of the two sides of an iff.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.7 `HasLocallyFreeQuotientOfDifferentials` (definition) | `X = ∅`; `C_2`, `d = 1`; `C_0`, `d = 1`; `𝔸¹`, `d = 0, 1, 2`; `Spec k[ε]/(ε²)`, `d = 1`, char `≠ 2` and `2` | `E = 0` has constant rank `d` vacuously, true. `Ω = O dx ⊕ O dy/(x² dx)` and `(0, 1)` kills `x²dx`, true. `b = (3t/2)a` in `k[[t², t³]]`, false. T, T, F (fibre `κ·dx`). `Ω ≅ k`, killed by `ε`, false; `Ω = k[ε]dε` free, true | one example and one non-example each. The model "Ω itself locally free of rank `d`" is excluded by `C_2` (torsion `dx`, predicate true). | definition added; Checks 1–3 |
| §0.7 uniqueness | `𝔸²`, `d = 1` (`X_sm^{(1)} = ∅`); `C_2`, `d = 1` | kernels `O dy` and `O dx`, different; every quotient has `dx ↦ c` with `x²c = 0`, so `c = 0`, and kernel `O dx` | density of `X_sm^{(d)}` needed, stated | Check 4 added |
| §0.7 stalk criterion | node at the origin; `𝔸¹` | `ya + xb = 0` makes `a` vanish on `x = 0` and `b` on `y = 0`, so neither is a unit, false; identity, true | finite presentation of `Ω[A⁄k]` (`A` of finite type) used for 0583, stated | Layer 0 example added |
| §0.7 restriction, smooth bullets | `V = ∅ ⊆ X`; `X = 𝔸ⁿ`, `d = n` | `E|_∅ = 0`, holds; `Ω = O^n` of rank `n`, identity | sound | none |
| §4.4 smooth iff predicate, char 0 (Lean) | `X = ∅`; `C_0`; node over `ℚ`; `𝔸¹_ℚ`; `Spec ℚ(i)`, `d = 0` | T↔T; F↔F; F↔F; T↔T; T↔T (étale; zero quotient) | holds | statement becomes iff |
| §4.4 hypotheses | `Spec ℚ[ε]/(ε²)`, `d = 0` (not reduced); `𝔸² ⊔ 𝔸¹`, `d = 2` (not pure); `C_2` (char 2) | F↔T; T↔F; F↔T | each hypothesis needed for one direction | three Checks added |
| §4.4 route, step 4 | `P` minimal over `Ann(M)`, contraction to `k[X_1..X_d]` | `∂_i ∘ φ = φ ∘ ∂/∂X_i` (as `∂_i x_j = δ_ij`), so the contraction is stable, hence `0` in char 0; `trdeg κ(P) ≥ d` makes `closure(P)` a `d`-dimensional component, so `P` is minimal; `M_P ≠ 0` (00L2) against `T_P = 0` | sound | route now starts from the stalk (§0.7) |
| §4.4 Lean context | `#check @…` | binders `Field k`, `CharZero k`, `X.Over (Spec k)`, `IsReduced X`, `LocallyOfFiniteType`, `d`, `IsPureDimensional d X`, all in the signature | matches README | none |
| §5.4 differential form, char p (Lean) | cone `z² = xy`, char 2; `𝔸^d_k`; `d = 0` over perfect `k` | `Ω = O dz ⊕ (O dx ⊕ O dy)/(y dx + x dy)`; onto `O²` modulo `m`, `dx` or `dy` maps to a vector with a unit coordinate, so `y ∈ (x)` or `x ∈ (y)`, impossible (`O/(x) = k[y,z]/(z²)`): F↔F. T↔T. finite separable extensions, T↔T | holds | statement added; Checks added |
| §5.4 hypotheses | `Spec 𝔽_2[ε]/(ε²)`, `d = 0` (not normal); `x^p + y² + t` over `𝔽_p(t)` (imperfect); `C_2`, `C_3` (not normal) | F↔T; regular, normal, `Ω = (R dx ⊕ R dy)/(2y dy)` with quotient `(1, 0)`, F↔T; F↔T | each hypothesis needed | none beyond the Checks |
| §5.4 Lean context | `#check @…` | `p`, `Fact p.Prime`, `Field k`, `CharP k p`, `PerfectField k`, `IsNormalScheme X`, `LocallyOfFiniteType`, `d`, `IsPureDimensional d X`, all in the signature | matches README | none |
| §5.3 at "locally of finite type" | `X = ⊔_{n ∈ ℕ} 𝔸¹_k` (locally but not globally of finite type) | the route uses one affine open `Spec A ∋ x`, `A` finitely generated, `powRingHom_finite` for `A` | holds | generalised |
| §5.1 operators | `p = 2`, `d = 1`; `p = 3`, `d = 1` | `M = [[1, x], [0, 1]]`, `φ_0 = id − x∂`, `φ_1 = ∂`. `M = [[1, x, x²], [0, 1, 2x], [0, 0, 1]]`, `M⁻¹ = I − N + N² = [[1, −x, x²], [0, 1, −2x], [0, 0, 1]]`, `φ_0(x²) = x² − 2x² + x² = 0`, `φ_2(x²) = 1`; without `(α!)⁻¹` the diagonal entry is `2` | unitriangular for the product order, identity modulo `m` with `x_j ∈ m` | wording fixed; Check added |
| §2.5 with the predicate | `C_2`, `C_3`, `C_0` | quotient `(0, 1)` against relation `x²dx`; `(1, 0)` against `2y dy`; none: (ν iso, predicate) = (T, T), (T, T), (F, F) | consistent | statement cites §0.7 |
| §3.3, `J_f` as an image of the derivative ideal | `C_0`, `C_2`, `C_3`; `n = 1`, `f = x_1` | `(f) + (2y, 3x²)` modulo `f`: `(y, x²)`, `(x²)`, `(y)`; `(x_1) + (1) = (1)` | same `J_f` as before | citation added |
| Sign in §3.3 | `n = 2`, `j = 2`, `ω = dx_1` | `df ∧ dx_1 = ∂_2 f dx_2 ∧ dx_1 = −∂_2 f dx_1 ∧ dx_2`, so the factor is `(−1)^{2−1}` | as stated | none |
| Conventions: "locally free quotient of rank `d`" | `E` up to isomorphism; empty `X` | two isomorphic targets give the same predicate; vacuous rank on `∅` | sound | added |

Each Check on the edited sections was evaluated against the theorems of its section and against the other Checks on
the same object:
- The node is a non-example in §0.7 (Layer 0 example), in §4.4 and in §4.5.
- `C_2` is an example in §0.7 and §2.5 and a counterexample in §§4.4 and 4.5.
- The cone is a non-example in both characteristics in §5.4.

No Check refutes a theorem of the README. Natural-number subtraction is still confined to the guarded places the
review listed. The new text adds none.

## Elaboration

`lake env lean` on the absolute path of `packages/NashBlowups/Suggested.lean`, run from the content checkout: exit
0. Exactly **2** warnings, both `declaration uses 'sorry'`, at lines 71 and 87. There is no other message. All four
imported Tau Ceti modules had built object files, so nothing was built. The `#check @…` comparison (a scratch copy
with `#check @` for the three declarations, elaborated once) gave these signatures:
- `HasLocallyFreeQuotientOfDifferentials : (k : Type u) → [CommRing k] → (X : Scheme) → [X.Over (Spec k)] → ℕ → Prop`
- the two theorems with every binder listed in the table above.

Each matches its README statement, and nothing changed. There is no `variable` block, so no hypothesis can drop out.

The full gate ran on a throwaway clone of the content checkout with the folder added, against its base commit. It
printed: `gate NashBlowups: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0
private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0
dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0
metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`.

The first run against the checkout's `origin/main` found two kinds of problem. `outside-folder` was an artefact: the
local checkout is behind its `origin/main`. `tex=3` was real: the split code span in §6.3, now fixed.

## Dependency check

```
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. NashBlowups is in the merge order right after
AlgebraicModuliForArithmeticGeometry. Its suppliers are AlgebraicModuliForArithmeticGeometry and
DerivedDeRhamCohomology, both earlier in the order and both open new-roadmap pull requests. Its other suppliers are
on main: SchemeAndStackFoundations, EnhancedDerivedSheaves, DiophantineApproximationAndTranscendence and
ResolutionOfSingularitiesCharacteristicZero. None of the roadmaps barred as suppliers is cited.

## Sources

No source was fetched and no `needs-references.toml` was written: every text the README cites is in the manifest.
New locators were read in the cached texts:
- stacksAlgebra lines 905–909 (Lemma 10.10.2, 0583) and 4466–4468 (Lemma 10.40.5, 00L2);
- nashModificationNotes2024 lines 165–181;
- duarteNunezBetancourt2020 lines 150–156.

Their `cited_for` lists in `sources.toml` were extended for §§0.7 and 5.4. Nothing else in the manifest changed.
The five uncertified entries remain background citations by locator. No source passage was copied.

## Untrusted text

No fetched or read text asked for anything outside the job.
