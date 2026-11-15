<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13795#issuecomment-6897464546 -->
Review (claude) of 059da88

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.2 reuses `Y` for two objects and leaves `X` without its hypothesis

   **Location:** `packages/NashBlowups/design/README.md:1377–1381` (§7.2): "for `Y` in the Setting, an open `U ⊆ Y`
   … Consequently, if `Y_m` contains an open subscheme `k`-isomorphic to `X` for some `m ≥ 1`, then `Y_{m+i}`
   contains …"; the same wording in `design/plan.json`, target 7.2, `statement`.

   **Claim:** The consequence is a statement about the iterates of a scheme named in the sentence.

   **Witness:** In the first sentence `Y` is an arbitrary scheme in the Setting; in the second, `Y_m` is the
   normalised iterate of `X` (§7.1), and `X` is not introduced. Read with `Y` the scheme of the first sentence,
   `Y_{m+i} ⊇ Y_i` has no meaning.

   **Repair:** Rename the scheme of the first sentence `W` ("for `W` in the Setting, an open `U ⊆ W` and a
   `k`-isomorphism `U ≅ Z`, the `i`-th Nash iterate of `W` …"), and begin the second: "Consequently, for `X` in the
   Setting with normalised iterates `Y_i` (§7.1), if `Y_m` contains …". Make the same change in the `statement` and
   `hypotheses` of target 7.2 in `plan.json`. Tested on the instance: `W = Y_m`, `Z = X` gives
   `Y_{m+i} ⊇` an open copy of `Y_i`; `i = (j−1)m` and induction give `Y_{jm} ⊇ X`, as §7.3 uses (cusp in
   characteristic 2, Nash iteration, `m = 1`: `X^{(j)} ≅ X` for all `j`).

2. **F02** (P3) a sentence of process narrative in "Downstream consumers"

   **Location:** `packages/NashBlowups/design/README.md:1431–1432`: "ResolutionOfSingularitiesCharacteristicZero is
   earlier in the merge order and is not a consumer."

   **Claim:** The sentence belongs to the roadmap text.

   **Witness:** House style: the README is timeless and carries no process narrative; "the merge order" is the
   project's scheduling, not mathematics. The roadmap cites nothing from that roadmap (no occurrence elsewhere in the
   README or `plan.json`).

   **Repair:** Delete the sentence. Tested: after deletion `grep -n 'merge order'` on the README returns nothing,
   and the "Downstream consumers" paragraph still lists three consumers with the sections each uses.

Two findings, both P3 (no P1, no P2); each carries a repair, so a fix round applies them. All three findings of
round 7 are repaired. No supplier gap is declared (`design/plan.json` has `gaps: []`; the README says "No gap is recorded"),
so nothing here is conditional on a gap. This review changed no design file and no manifest entry.

## Verified sound

**Round 7, finding by finding.**

- **F01 (P3), repaired.** README 1147–1152 (§5.3 step 3): "`F_*R_Q` is finite: `R_Q` is the localisation `A_P`
  of the finitely generated `k`-algebra `A` … the `p`-th power map of `A` is finite by Tau Ceti's
  `TauCeti.powRingHom_finite` (`k` is perfect)". The contract bullet is at 238–245; the
  DeformationAndDerivedPatchingAlgebra contract, its Scope sentence and its "How to read" clause are gone
  (searched README, `plan.json` and `sources.toml` for "DeformationAndDerived", "F-finite", "essentially of
  finite": no occurrence). `plan.json` target 5.3 has the prerequisite `tauceti:TauCeti.powRingHom_finite` and
  five suppliers remain. Pin opened: `TauCeti/Algebra/CharP/Frobenius/Finite.lean:62`
  (`[ExpChar R p] [PerfectRing R p] (h : (p : A) = 0) (f : R →+* A) (hf : f.FiniteType)`),
  `PowRingHom.lean:38, 49`.
- **F02 (P3), repaired.** README 246–256: "`Module.Grassmannian.scheme R M r` with `Module.Grassmannian.toSpec`
  … it is separated over `Spec R` for every `M` and proper for finite `M`. No sheaf on a non-affine base is
  assumed." Scope 38–41 and 68–70 name it. Pins opened: `Grassmannian/Basic.lean:161, 166` (`M : Type u` with
  `R : Type u`), `Points.lean:405`, `Proper.lean:137` (no finiteness variable), `:230` (`[Module.Finite R M]`).
- **F03 (P3), repaired.** README 1339–1341: "AlgebraicModuliForArithmeticGeometry §5.4;
  SchemeAndStackFoundations §0.30 (Tau Ceti `IsNormalScheme`); Mathlib relative normalisation,
  `isIso_of_isClosedImmersion_of_surjective` and `Algebra.IsTranscendentalSeparable`".

Pattern of each repair in the rest of the design: every roadmap supplier of a *Needs* line occurs in its
layer's Dependencies (Layers 0–7 compared line by line); no other statement cites an open roadmap for what the
pins hold (searched both pins by object for the converse of Kunz, a `p`-basis predicate, a Lie derivative on
Kähler differentials, geometric normality: none, as in round 7). No repair was marked not actionable; nothing
is re-raised. No maintainer notes were supplied.

**Adversarial pass.** All 37 targets were read and recomputed this round; the table shows the repaired
passages, the fifteen sampled targets, the headlines and the targets of the findings. `C_p` is the cusp
`y² = x³` in characteristic `p`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Contract `powRingHom_finite` (F01) | `A = k[s]`, `p = 2`; `A = 0`; `𝔽_p(t_1, t_2, …)` | generators `1, s`; zero ring finite; `[K : K^p] = ∞`, outside the hypotheses | bullet equals the pin |
| §5.3 step 3 localisation (F01) | `A = k[s]`, `P = (s)`, `p = 2`, `1/(1+s)` | `1·(1+s) = 1²·1 + 1²·s`, so `1/(1+s) = (1/(1+s))²·1 + (1/(1+s))²·s` | sound |
| Contract Grassmannian scheme (F02) | `R = k[x]`, `M = R ⊕ R/(x)`, `r = 1`; `r = 0`; `M = 0`, `r = 1` | fibre `ℙ¹` over `0`, one point elsewhere; `Spec R`; `∅` | agrees with §1.2 Check 2 |
| 0.3 smooth locus of dimension `d` | `𝔸² ⊔ 𝔸¹`; `Spec k[ε]/(ε²)`, char 2 and `≠ 2` | `(𝔸², 𝔸¹, ∅)` for `d = 2, 1, 0`; fibre of `Ω` is `k·dε`, rank 1, `X_sm = ∅` | sound |
| 0.4 Grassmannian along a surjection | `O² → O`, `(a, b) ↦ a`, `r = 1, 2`; `p = id` | section `[1 : 0]` = zero locus of second coordinate; `Gr_2(O) = ∅ ⊂ Gr_2(O²) = S`; identity | sound, quotient convention |
| 0.5 smooth iff regular at closed points | cusp; `Spec 𝔽_p(t)(t^{1/p})`; non-smooth `X` | `dim m/m² = 2 > 1`; regular, `Ω ≠ 0`, not smooth; closed nonempty complement of `X_sm` has a closed point (Jacobson) | perfect needed, stated |
| 1.1 setting | `Spec 𝔽_p(t)[y]/(y^p − t)`; `𝔸² ⊔ 𝔸¹`; char 0 | reduced, `X_sm = ∅`, base change `k'[u]/(u^p)`; `X_sm ≠ X_sm^{(2)}`; perfect closure is `k`, route trivial | iff sound both ways |
| 1.2 Nash modification | `O ⊕ O/(x)` on `𝔸¹`; ideal of `0 ∈ 𝔸²`; `r = 0`; `U' ⊂ U` dense | `N = 𝔸¹`, fibre of `Gr_1` is `ℙ¹`; `N = Bl₀𝔸²`; `Gr_0 = X = N`; equal images (reduced `U`) | sound |
| 1.5 locality, flat base change | `V ⊆ U`; `g = U ⊆ X`; `{0} → 𝔸²` | `V`; `U`; fibre product `ℙ¹` against `N = ∅` | flat needed, stated |
| 2.3 setting preserved | `C_0`; `C_2`; `𝔸² ⊔ 𝔸¹`, `d = 2` | `𝔸¹`; cusp; `X* = 𝔸²`, `ν` not surjective | pure dimension needed |
| 2.4 `isIso_lift_iff` | `π` surjective, classifying map closed; one line of `𝔸¹ ⊔ 𝔸¹` | image closed, contains the one-point fibres over `X_sm`, so all of `X*`; closed immersion, lift not surjective | surjectivity needed, stated |
| 2.5 headline | `C_2`, `C_3`, `C_0`; `d = 0` | relation `x² dx`, quotient `(0, 1)`; `2y dy`, `(1, 0)`; `b = (3t/2)a` forces `a`, `b` non-units in `k[[t², t³]]`; `Ω = 0`, rank-0 quotient | iso: T, T, F, T |
| 2.6 locality, field base change | `C_0` over `ℚ`, `ℚ(i)`; `V = X_sm`; `Spec k[y]/(y^p − t)` | both `𝔸¹`; `V`; base change not reduced | Setting needed |
| 3.2 / 3.3 blowup | `C_0`, `I = t³(1, t)`; `I = 0`; `x^p − y^q`; `n = 0` | `k[t², t³][t] = k[t]`; `∅ ≠ X*`; `J = (q y^{q−1})` principal; `J = 0`, `Bl = ∅ ≠ Spec k` | sound; `n ≥ 1` stated |
| 4.1 coordinates | `k[x, y]_{(x,y)}`, `q = id`; `C_3`; `d = 0`; `𝔽_p(t)[x]_{(x^p − t)}` | `∂_i = ∂/∂x_i`; `q(dx) = 1`, `ker q = R·dy/(y dy)`; none; `d(a(x^p − t)) = (x^p − t)·da`, no unit in `q(dm)` | separability needed for `x_j ∈ m` |
| 4.2 Lie derivative | `k[x]`, `d/dx`; `x·d/dx`; `k[x]/(x²)`, `∂x = x` | `L(x dx) = dx`; `L(dx) = dx ≠ 0`; `L(x dx) = 2x dx = 0` | determines `L_∂`; coefficient-only model excluded |
| 4.3 Seidenberg | `ℚ[x]`; `ℚ[x, y]`, `(y²)`; `𝔽_p[x]`, `(x^p)` | stable ideals `0`, `(1)`; `(y)` stable; `(x)` not stable | `ℚ ⊆ R` needed |
| 4.4 / 4.5 headline | stable prime contracted to `k[X_1..X_d]`; `d = 0`; `C_0`, node, `C_2` | least-degree element has a nonzero derivative of lower degree, contraction 0, `trdeg κ(P) ≥ d`; `Ω = 0`; (smooth, iso) = (F, F), (F, F), (F, T) | char 0 needed, stated |
| 5.1 operators | `p = 2`, `d = 1`; `C_3` | matrix `(1, x; 0, 1)`, `φ_0 = id − x∂`, `φ_1 = ∂`; orders `3a`, `3a + 2`, `3a + 4`, `a ∈ {0, 2, 3, …}`, never 3 | sound; `∂_i` need not commute |
| 5.2 generic Frobenius basis | `k(t)`; `d = 0`; `t^p ∈ k(t)` | `1, …, t^{p−1}`; `K = K^p`; `d(t^p) = 0`, not a basis | sound |
| 5.3 freeness | `k[s]_{(s)}`; `C_3`; `d = 0`; `𝔽_p(t)[s]_{(s)}` | basis `s^i`; `t³ ∉` image; `F_*k = k`; rank `p²` against `p` | perfect and normal needed |
| 5.3 steps 3–4 | DVR `R_Q`; height `≥ 2` | `ρ_Q ∘ ψ_Q(e_α) = σ(φ_α(x^α)) e_α = e_α`, surjection of free modules of rank `p^d`; `depth ≥ 2`, `Ass(F_*R) = {0}` | hypotheses of `bijective_of_depth` (`Bijectivity.lean:120`) met |
| 5.4 headline | cone `z² = xy`, `p ≠ 2`; `C_2`; `x^p + y² + t` over `𝔽_p(t)` | `J = (x, y, z)`; not normal; relation `2y dy`, quotient `(1, 0)`, regular, not smooth | false over imperfect fields, stated |
| 6.1 definition | `C_2`; node; `y² = x²z`, char `≠ 2` and 2 | `X̄* = 𝔸¹ ≠ X*`; `η = id`; three charts of `Bl_J X` are `k[u, a]`, `k[x, b]`, `k[x, u, u⁻¹]`, normal, fibre `ℙ¹`; `J = (x²)`, `X* = X` | normalise `X*`, not `X` |
| 6.3 base change | `C_0`, `ℚ(i)`, `ℚ(u)`; `x^p + y² + t`, `k(t^{1/p})` | `𝔸¹` on both sides; `(−s²)^p + (s^p)² = 0`, bijective, not an isomorphism | separability needed |
| 6.4 headline | `C_2`; line; `x^p + y² + t` | (normal, `ν` iso, `ν̄` iso) = (F, T, F), (T, T, T), (T, T, T) | iff sound |
| 7.2 propagation (R01) | `U = Y`; `U = Y_sm`; `W = Y_m`, `Z = X` | identity; `U`; `Y_{(j+1)m} ⊇ Y_{jm} ⊇ X` | sound; notation, R01 |
| 7.3 headline | `C_2`, `m = 1`, Nash; `C_0`, `m = 0`; `X = ∅` | no smooth iterate; `Y_1` smooth; not singular | `m ≥ 1` needed, stated |

Natural subtraction occurs only in `n − 1` (`n ≥ 1`), `β − α` (`α ≤ β`), `r − 1` (`r ≥ 2`) and `q − 1` (`q ≥ 2`). No statement is
quantified over data unrelated to the construction; each of the five headlines names the Nash blowup.

**Sources: the seeded sample**, read at the locators in the cached texts. The author flags no locator as
unverified.

| Target | Locator read | Supports |
|---|---|---|
| 0.3 | stacksAlgebra lines 17618–17624 (00TT) | smooth at `q` iff fibre of `Ω` has dimension `dim_x X` |
| 0.4 | alperModuli lines 2985–3007, 2283, 1202 | relation-vanishing argument, Noetherian there, as the README says |
| 0.5 | stacksVarieties lines 2130–2133 (0B8X) | smooth locus equals regular locus, perfect `k`, reduced `X` |
| 1.1 | stacksVarieties lines 2112–2114 (056V), 2084 (056T), 303–304 (04KS (3)) | the equivalence and both steps of the route |
| 1.2 | nashModificationNotes2024 lines 216–225; gonzalezSprinberg1982 lines 85–90 | closure of the section in the Grassmannian of quotients |
| 1.5 | stacksNormalization lines 421–426 (01R8 (3)), 2198–2202 (081I) | image and opens; image and flat base change |
| 2.3 | nashModificationNotes2024 lines 109–112 | variety, proper, birational, isomorphism over the regular locus |
| 2.6 | nobile1975 lines 42–44 | independence of the embedding, globalisation |
| 4.1 | nashModificationNotes2024 lines 194–197, 484–501; duarteNunezBetancourt2020 lines 263–268 | coordinates and dual derivations |
| 4.2 | stacksAlgebra lines 15590–15592 (00RW); hamann2003 lines 61–64 | `Ω ≅ J/J²`; the annihilator computation |
| 5.2 | duarteNunezBetancourt2020 lines 301–302; nashModificationNotes2024 lines 421–422 | rank `p^d` |
| 5.3 | duarteNunezBetancourt2020 lines 284–305; nashModificationNotes2024 lines 408–439 | `ψ`, `ρ_Q`, height one, `(S_2)`, Kunz |
| 5.4 | duarteNunezBetancourt2020 lines 256–257; nashModificationNotes2024 lines 362–364; stacksAlgebra lines 17720–17726 | Theorem 3.10; Theorem 5.1 with the misprint the README names; Example 00TY |
| 7.2 | castilloDuarteLeytonLiendo2026 lines 58–67 | items (i)–(iii); propagation not stated there |
| 7.3 | castilloDuarteLeytonLiendo2026 lines 66–67 | the consequence |

Also read: stacksVarieties lines 1049–1050 (0C3M), 1063–1065, 2256–2260 (0C3N); stacksAlgebra lines 4671–4674,
17647–17650, 21510–21517; stacksNormalization lines 2900, 2918–2930, 2953, 6332–6334, 6498, 6521, 6561–6572,
6636–6638; nashModificationNotes2024 lines 143–181, 226–230; hamann2003 lines 56–64. The manifest has fifteen
entries, one key each, no local path; five stay `uncertified`. No source was fetched; no
`needs-references.toml` was written.

**Supplier-order audit.** Gate output:

```
candidate: NashBlowups is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Citations resolved in this run:

- AlgebraicModuliForArithmeticGeometry (open new-roadmap pull request, earlier in the order): §1.3 at
  `README.md:610`, `coherentGrassmannian` `:612` (arbitrary `S`, classifying maps, base change, `Gr_1 = P(E)`,
  affine points), properness `:626`, `plucker` `:663`; §5.4 `:8675`, `DMNormalization.stack` `:8677` (lifting,
  isomorphism for normal `X`, agreement with `Scheme.Hom.normalization`), `.finite` `:8701`,
  `DMSchematicClosure.stack` `:8711` (flat base change).
- SchemeAndStackFoundations (main): §0.7 `:1049`, `field_extension_descent` `:1372` (smooth in the list), §0.17
  `:1669`, §0.23 `:2163`, §0.30 `:2681`, `IsModification.Witness` `:6839`, *regularLocus_eq_smoothLocus* `:6987`.
- EnhancedDerivedSheaves (main) §E1.6 `:689`, `isRegular_of_frobenius_flat` `:800`.
  DiophantineApproximationAndTranscendence (main) §5.6 `:3555`, `lieDerivativeOneForm` `:3692`.
- DerivedDeRhamCohomology (open, earlier in the order) §0.23 `README.md:451`, two-way statement `:461`,
  `DerivedDeRham.IsPBasis`, `DerivedDeRham.pBasis_kaehler_basis` `:472` and its `Suggested.lean:52, 63`. The two
  leads of the citation tool are these names: they are that roadmap's, not library names, and resolve.

None of the roadmaps that may never be cited as suppliers is cited.

**Pins** (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`, equal to the plan's baseline). All 78 library names of the two
contracts and of the plan's prerequisites were located at the pins. Opened this round, beyond those under F01
and F02: `TauCeti/RingTheory/Depth/Bijectivity.lean:120` (Noetherian `R`, arbitrary `M`, `N`; bijective
localisation or `depth M_p ≥ 2` and `p ∉ Ass N`), `RingTheory/Kaehler/Conormal.lean:76` (surjective
`P → S`, `S` formally étale; no finiteness), `Scheme/Regular/Scheme.lean:175`, `Scheme/Normal.lean:84, 153, 203`,
`Scheme/LocalDimension.lean:76, 105, 168`, `Morphisms/Smooth/Locus.lean:46, 53`, `Blowup/IdealSheaf.lean:120, 124,
191`, `Blowup/UniversalProperty.lean:297, 372`, `Sheaf/ExteriorPower/Basic.lean:66`; Mathlib
`RingTheory/Etale/Field.lean:98`, `IdealSheaf/Subscheme.lean:658, 661`, `IdealSheaf/Basic.lean:691`,
`Morphisms/ClosedImmersion.lean:206, 409`, `Morphisms/Smooth.lean:291, 300, 320, 333, 361`,
`Normalization.lean:371, 576`, `FieldTheory/TranscendentalSeparable.lean:72, 76`, `Modules/Sheaf.lean:183`.

**Duplication and ownership.** `roadmaps grep` over main and the open heads for: Nash
blowup/modification/transform (no match), Seidenberg (only Tarski–Seidenberg and a hyperplane-section
reference), Lie derivative (differential-geometric roadmaps and the cited §5.6), Jacobian ideal (Milnor-type
uses, not the blowup), 0C3M and geometric normality, Gauss map, 01V0, `p`-monomial (the cited §0.23),
derivation-stable ideals (enveloping algebras, another object), the pinned Grassmannian scheme (SchubertGeometry
cites the same pins). No other roadmap owns a Nash construction, the base change of `Ω_{X/R}` for schemes,
normality along separable extensions or Seidenberg's lemma. The overlap file lists no pull request changing
this roadmap, no dropped id and no revision-only id; the board-packages index has no other Nash package.

Overlap check: read SchemeAndStackFoundations, AbhyankarLemma, ResolutionOfSingularitiesCharacteristicZero (main) and PurityOfBranchLocus, AdicCoefficientsAndComparisonsPartII, LogPluricanonicalForms (open); nothing shared (modifications, regular and normal schemes and dimension theory are SchemeAndStackFoundations' and Tau Ceti's, cited here).

**Shape.** Summary, Scope and ownership, Conventions, supplier contracts, How to read the build, eight layers
each ending in Examples and Dependencies, consumers, references. `plan.json` parses: 37 targets (6 definitions,
2 constructions, 29 theorems), 118 tests, README headings equal plan ids, every `target:` prerequisite
resolves, every definition and construction has at least three Checks. Layers are named by their mathematics;
Layers 4 and 5 both start from §4.1, 6 needs 2, 4 and 5, 7 needs 2 and 6. No LaTeX delimiters, pull-request
numbers, dates or machine paths; one process sentence (R02).

**Headlines.** §2.5 triviality criterion, §4.5 Nobile, §5.4 Duarte–Núñez-Betancourt, §6.4 normalised criteria,
§7.3 never-resolves. There is no `Suggested.lean` at the design stage, so there is nothing for the padding
probe, the `#check` comparison or the import check.

**Copyright.** Compared with the sources at their locators: the fifteen sampled statements, and the routes of
§4.3 (hamann2003 lines 58–64), §4.4 (nashModificationNotes2024 lines 182–199: a different proof, without
completions), §5.3 steps 1–5 (duarteNunezBetancourt2020 lines 284–305; the finiteness and splitting arguments
are the roadmap's own), §0.4 (alperModuli lines 2993–3007) and §1.3. Shared runs are formulas and statements
of under a dozen words. Contents of nashModificationNotes2024 (Sections 1–7) against the layers: Layer 1 ↔ §3,
Layer 2 ↔ §§1–2, Layer 4 ↔ §2, Layer 5 ↔ §5; Layers 0, 3, 6, 7 have no counterpart and §§4, 6, 7 are not
planned: neither one to one nor in order. No table, figure or list is taken over.

Source independence: 20 passages compared with 10 sources, none shared; largest share nashModificationNotes2024, 20 of 103 source citations in the README; contents compared with nashModificationNotes2024: independent.

## Not verifiable

- Lean elaboration: not available (this lane does not elaborate). No Lean command was run; there is no
  `Suggested.lean` to elaborate.
- `hironaka1983`, `spivakovsky1990`, `semple1954`, `teissier1982`, `ega1`: settled uncertified background texts,
  not opened; no target rests on them.
- Locators outside the sample in nobile1975 (Theorem 1, Remark 2, Examples 1, 2 and 4) and
  gonzalezSprinberg1982 §§1.3–1.4 were not re-read this round; round 7 read them and its rows carry values.
- Ownership against open pull requests rests on the supplied index of open heads (2026-11-15).

## Source issues

- **Misprint** in nashModificationNotes2024 at Theorem 5.1, printed p. 10: the source says the Nash map of a normal variety is an isomorphism exactly when the variety is singular; it should be nonsingular; affects a stated result.
- **Gap** in nashModificationNotes2024 at Section 3, printed p. 6: the source says every morphism carrying a rank-d quotient factors through the closure; it should require a reduced source in which the preimage of the open is dense; affects a stated result.
- **Misprint** in nashModificationNotes2024 at Propositions 2.2 and 2.3, printed p. 5: the source says the same proposition and its introductory sentences twice under two numbers; it should be stated once; affects nothing.
- **Misprint** in nashModificationNotes2024 at Section 1.2, printed p. 3: the source says the closure of the graph is taken in the Grassmannian; it should be taken in the product of the variety with the Grassmannian; affects nothing.
- **Misprint** in duarteNunezBetancourt2020 at Theorem 3.10 proof, printed p. 6: the source says the second sum for δ_t(x_j) has coefficients indexed by k; it should be indexed by t; affects nothing.
- **Misprint** in castilloDuarteLeytonLiendo2026 at Introduction, printed p. 1: the source says the normalised Nash blowup is the pair with the composite written η∘ν; it should be ν∘η; affects nothing.

## For the human reviewers

- **Licence.** `alperModuli` is read from the author's university page (`sources.toml`, `licence_class = "author-page"`); it is an unpublished book draft dated 19 August 2024, cited only for the route of §0.4.
- **Scope.** `nashModificationNotes2024`, the source with the largest share of locators (20 of 103), is an arXiv survey with no journal reference in the manifest; the headline theorems are also cited to refereed articles (`nobile1975`, `duarteNunezBetancourt2020`, `castilloDuarteLeytonLiendo2026`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "059da88bcd437549b415e6702d137a71daa19296", "job": "REV-DESIGN-NashBlowups~8", "model": "fable", "worker": "chris-x26"} -->
