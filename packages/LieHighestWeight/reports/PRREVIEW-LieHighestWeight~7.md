# Review of LieHighestWeight (pull request #1220 at a02f4b2)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`

**Verdict:** accepted

Four findings, none blocking (all P3). This head repairs every finding of the previous review (the audit table is below): the compact Frobenius–Schur gap is replaced by the native declarations with their hypotheses, the four companion files with admitted data and padding are gone, the supplier gaps are split into eight single-need contracts with witnesses, the seven undeclared Layer 8 names are prose, the stale layer references, subsection numbers and the missing §5.2 Checks are fixed, the Scope section names the native declaration behind each removed layer, and the type-A tensor rule carries the weak inequality with a boundary Check. The full review was then repeated on the whole folder: the README (2,983 lines) and `Suggested.lean` (282 lines), the gate, the dependency check, the elaborated signatures, the one-tactic padding probe, the seeded sources and the ownership searches. Paths below are relative to the folder above; library paths are relative to the pinned package roots.

## R01 (P3) — Five backticked names of this roadmap's own have no declaration

**Location:** README.md:1483, “construct `harishChandraLinearIso : Z(U(L)) ≃ₐ[K] S(H)^W`”; also :1451 (`centralCharacter base λ`), :1481 (`hcProjectionLinear`), :1516 (`coadjointRepresentation := …`), :1721 (`centerPBWGradedInvariantIso n`).

**Claim:** a backticked name of this roadmap's own is a claim that `Suggested.lean` declares it.

**Witness:** none of the five occurs in `Suggested.lean` at this head or in the pinned Mathlib or Tau Ceti (a script over every backticked identifier of the README; the other identifiers resolve). All five are declared in main's `LieHighestWeight/Suggested.lean` (6, 16, 11, 5 and 7 occurrences), which this pull request deletes, so the gate's `readme-ids` check and the citation resolver still see them there.

**Repair:** write the five as prose targets without backticks, as the Layer 8 names already are (the sentences state each map), or declare them. The TangentialBordism naming note of R02 applies to `TauCeti.DivisionOctonionReal` and `TauCeti.CayleyDickson` (:2017–2018, :2100, :2128): they are intended library names the pin lacks, and TangentialBordism consumes the first by that name, so they may stay if the README says they are proposed names.

## R02 (P3) — A cited TangentialBordism anchor does not exist at its head

**Location:** README.md:52–53, “[TangentialBordism, B3](../../TangentialBordism/README.md#b3-low-groups-and-specified-geometric-examples) owns the compact Albert idempotent geometry”; also :2122 and :2172.

**Claim:** TangentialBordism has a section B3 at that anchor owning the trace-one-idempotent Cayley plane and the automorphism transitivity.

**Witness:** TangentialBordism at its open head (rev/942) has no heading containing “low groups”; its headings are `## Layer k` with `### k.n … (Bx.y)` labels. The Cayley-plane ownership is `### 9.1 Idempotent Cayley plane (B3.6)` (`README.md:2053`) and `### 9.2 Compact automorphisms and Spin isotropy (B3.7)` (`:2112`), and its supplier table (`:150`) consumes this roadmap's Layer 8 by the old names `compactAlbertAlgebra`, `compactAlbertDerivation_complexification` and `compactAlbertDerivation_killing_negDef`. The citation is an ownership deferral, not a `*Needs:*` edge, so the dependency check is unaffected.

**Repair:** cite “TangentialBordism §§9.1–9.2 (B3.6–B3.7)” with the anchors `#91-idempotent-cayley-plane-b36` and `#92-compact-automorphisms-and-spin-isotropy-b37`. The same kind of slip, lower: “CharacteristicClasses, C5.1” (:50, :1518, :1759, :2499) points at the `## C5.` heading, and “C5.1” is not a heading on main (it is a label other roadmaps also use); “C5” suffices.

## R03 (P3) — The family index still describes the old layer structure

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:36–40`, “sl₂ as the engine case, the root-space decomposition, weights, Verma modules and `L(λ)`, the highest-weight classification, Weyl's complete reducibility, the Weyl character and dimension formulas, …”.

**Claim:** this is what the LieHighestWeight roadmap builds.

**Witness:** at this head those items are supplier contracts (README.md:12–32 lists the native declarations for each), and the roadmap's own content is the tensor comparisons, Chevalley restriction and Harish-Chandra, the Serre presentation, the exceptional models, the reductive centres and the affine Weyl geometry (README.md:3–8). The index files are the pull request's own (the brief), and the pull request leaves them unchanged. `STATUS.md` carries a `tauceti-status:v1` header and is tool-generated, so it is not the author's to edit.

**Repair:** rewrite the index entry to the restructured scope (one or two lines: what is consumed natively, what the roadmap owns).

## R04 (P3) — Gap bookkeeping: a shared slug with different needs, and no registration

**Location:** README.md:473–480, “What SchurWeyl must provide (gap:skew-lr-tableaux, the contract that TensorProductCombinatorics also consumes under this name)”; :482–485 (`gap:lr-product-rule`); :70–81.

**Claim:** `gap:skew-lr-tableaux` is one contract shared with TensorProductCombinatorics, and `gap:lr-product-rule` is a separate need.

**Witness:** TensorProductCombinatorics at its head (rev/1107, `README.md:289–313`) declares `gap:skew-lr-tableaux` against SchurWeyl with a far larger `needs` (jeu de taquin, rectification, Knuth equivalence, skew Schur polynomials, the LR tableaux, their count, the tableau-product bijection, and the rule `s_μ s_ν = Σ c s_κ` over every commutative semiring, with symmetry and the vertical Pieri case). This roadmap's `needs` under the same slug is the finite LR-tableau set and its count only, and its `gap:lr-product-rule` asks for a statement TensorProductCombinatorics already asks for under the shared slug. The intake announces each gap by slug on SchurWeyl's job, so one slug would carry two different sentences. None of the eight gaps is registered in a `plan.json` `gaps` list: the board package for this folder holds only review reports (`packages/LieHighestWeight/reports/`), and the brief records “none declared (no readable design/plan.json)”. Registration is the intake's to do for an on-main roadmap amended by pull request and is not a finding here; the eight contracts were checked and are each a single need with a witness, named supplier and consuming section, and none asks for what Mathlib, Tau Ceti, LieGroups Layers 6–7 or ClassicalGroups Layer 3 already provide (details under Verified sound).

**Repair:** either adopt TensorProductCombinatorics' wording for `gap:skew-lr-tableaux` (so that the shared slug has one `needs`) and drop `gap:lr-product-rule` as covered by it, or give this roadmap's narrower contract its own slug (for example `gap:lr-tableau-count`) and keep `gap:lr-product-rule`. Optionally split `gap:unitary-regular-functoriality` (:445–450: full faithfulness, sums, tensor products, duals) and `gap:torus-character-lattice` (:464–471: the lattice identification, the pairing formula, roots as characters) into one sentence each; they are single contracts in substance and this is not re-raised as blocking.

## Previous findings: repair audit

| Previous finding | Passage at this head | Result |
| --- | --- | --- |
| R01 (P2): `gap:compact-frobenius-schur` already provided | README.md:340–359, “`ContRepresentation.frobeniusSchurIndicator`, in `TauCeti/RepresentationTheory/Compact/FrobeniusSchur/Basic.lean`, is the Haar-probability integral of the character over squares”; :914–917; :943–951; no `gap:compact-frobenius-schur` remains | **Repaired.** The four native declarations are cited with their hypotheses (compact topological group, continuous unitary irreducible representation on a finite-dimensional complex inner-product space), `exists_isUnitary_congr` supplies `IsUnitary`, `finrank_invariants_squares_le_one` the uniqueness; all six names opened at the pin (table below). The three §5.1 Checks (−1, 1, 0 and the χ(g) wrong model) are kept. |
| R02 (P2): admitted tensor data in `Sl2TensorOrthogonalityTargets.lean` | file deleted; README.md:517, “The monomial normalization is stated by `exists_polynomialSymmetric`; the coefficient formulas and Checks below specify the rest” | **Repaired.** The statable headline `exists_polynomialSymmetric` stays in `Suggested.lean:64` with its d = 2 control; the string identities are README API and Checks, recomputed below. |
| R03 (P2): three gaps compound and unregistered | README.md:422–485, eight `What … must provide (gap:…)` paragraphs, one need and one witness each | **Repaired** to the granularity the previous review asked for (one slug per theorem). The registration remains the intake's; see R04 for the slug shared with TensorProductCombinatorics. |
| R04 (P3): companion files' form | `AffinePBWFirstOrderTargets.lean`, `ReductiveCenterTargets.lean`, `Sl2TensorOrthogonalityTargets.lean`, `TypeAHaarTargets.lean` deleted; the folder is README.md and Suggested.lean | **Repaired.** |
| R05 (P3): padding in the companions | files deleted | **Repaired.** |
| R06 (P3): seven undeclared Layer 8 names | README.md:2099, “construct the compact Albert algebra, written J below”; :2144–2166 prose | **Repaired** for the seven; five other names of the same kind remain (current R01). |
| R07 (P3): stale layer references, numbering, §5.2 Checks | README.md:862–863, “the native highest-weight contracts (From Tau Ceti)”; :1442–1443; :2815–2816; :2829; :2835–2836; headings 7.1/7.2, 9.1–9.3, 10.1–10.2; §5.2 `**Checks.**` at :1040, :1074, :1169 | **Repaired.** |
| R08 (P3): removed anchors | README.md:12–32, each deferred layer named with its native declaration | **Repaired** as far as this folder can. |
| R09 (P3): strict inequality in the type-A tensor rule | README.md:1153, “`λᵢ−λ_(i+1)≥μ₁−μₙ` for every adjacent pair”; :1159–1165 the corrected argument; :1171–1179 the three Checks | **Repaired.** The argument and the three Checks were recomputed (table below). |

No repair report marks a finding “not actionable in this package”.

## Verified sound

**Scope and principles.** All 2,983 README lines and all 282 lines of `Suggested.lean` were read. No `set_option`, no `lemma`, no sorry'd data, no computational algorithm, no copied passage, no pull-request number, no local path and no process narrative in the folder (a scan for process words found only “lemma” inside source citations). The family index files are unchanged by the pull request (`git diff --stat origin/main...HEAD` lists only the three files of the folder); the outside-folder diff prescribed by the brief is empty. The pull request rewrites an existing roadmap on main but does not re-plan it: main's layers that Tau Ceti now has become supplier contracts naming the native declarations (all opened at the pin, table below), and the retained statements are headlines of the same programme. LieHighestWeightPartII (board design, merge-order position 226) consumes this roadmap and owns nothing stated here; its two citations of the removed `#layer-1-…` anchor are the design's to repoint (R08 of the previous review).

**Gate and dependency check.** The gate was rerun on this head, including the targeted build:

```text
gate LieHighestWeight: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency check returned exactly

```text
depcheck: 203 roadmaps, 1652 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. Every `*Needs:*` line and supplier citation was read. The supplier edges are Mathlib, Tau Ceti, RootSystems Layers 1–6 and 4, ClassicalGroups Layers 2–4, SchurWeyl Layer 7, CompactGroups Layers 0–6, LieGroups Layers 2–4 and 6–7, ReductiveGroups Layers 2 and 5P, ReflectionInvariantTheory §2, all on main with those headings (`RootSystems/README.md:218–356`, `ClassicalGroups/README.md:175–310`, `SchurWeyl/README.md:323`, `CompactGroups/README.md:205–369`, `LieGroups/README.md:233–427`, `ReductiveGroups/README.md:227` and `:460` (`#### Layer 5P`), `ReflectionInvariantTheory/README.md:19`). Ownership deferrals only (no supply): CharacteristicClasses C5 (`:1060`), GroebnerGeometry G4 (`:252`), ReductiveGroups 10C (`:1823`), PseudodifferentialOperators §3.1 (`:692`), LieGroupoidsPoisson G4.6A/B (rev/1050 `:18`, `:71`, `:78`), TensorProductCombinatorics §§1.5–1.6 and 2.6 (rev/1107 `:599`, `:694`, `:1191`), SpinRepresentations Layer 9 (rev/1207 `:1439`), TangentialBordism (R02). The LieGroupoidsPoisson G4.6A bracket convention is the positive one `{ℓ_ξ,ℓ_η} = ℓ_[ξ,η]` of §3.1 (its `:157` minus sign is for algebroid duals). The other direction was checked too: SpinRepresentations (rev/1207 `:1208`) and CharacteristicClasses on main (`:118`) cite the Layer 7 anchor, which this head keeps; FormalConnectionsOpers (rev/1056 `:75`, `:1455`), CharacteristicClasses (`:119`), ReflectionInvariantTheory (`:132`) and NilpotentOrbits on main (`:62`) all name this roadmap's Layer 7 as the owner of Lie Chevalley restriction and Harish-Chandra, agreeing with Scope. AutomorphicFormsOnReductiveGroups' `gap:reductive-enveloping-centers` against Layer 9 is answered by §9.2 (the composed product equivalence, centre restriction, reductive raw/dot and translated HC isomorphisms with ρ extended by zero, both filtration directions, central-character evaluations).

**Gap contracts.** Each of the eight gaps was tested for precision, minimality and provision. LieGroups Layer 7 on main (`README.md:407–427`) states holomorphic extension only, Layer 6 (`:383–406`) maximal tori, conjugacy and Weyl integration with `T = lieExp 𝔱` surjective but no kernel lattice; ClassicalGroups Layer 3 (`:237–272`) classifies rational `GLₙ`-representations without a statement about `U(n)`; CompactGroups Layer 1 is unitarisability; the pinned Tau Ceti has no exponential kernel lattice, cocharacter lattice or regular extension of unitary representations (searched for “cocharacter”, “period lattice”, “kernel of the exponential”, “Zariski” with “unitary”); SchurWeyl Layer 7 (`:323–360`) has Schur polynomials and RSK, no LR tableaux. The witnesses recompute: `t ↦ t⁻¹` has value 1/2 at 2 and `t ↦ t̄` has value 2; `SU(2)` has `Λ = 2πℤ·diag(i,−i)`, root differential `2i`, pairing 2; `SO(3)` pairing 1; `s_(1)² = s_(2) + s_(1,1)` with coefficients 1, 1; for empty λ the count is 1 iff ν = μ.

**Build and signatures.** `lake env lean` on `Suggested.lean` from the pull-request worktree (Tau Ceti pin `a91d3aa`, Mathlib `6b7abb3c`) finished with exactly 15 `declaration uses sorry` warnings and nothing else. A scratch copy with one `#check @name` for each of the 20 declarations elaborated; each printed type was compared with its README statement. The headlines keep `[IsAlgClosed K]` (Pieri, Tits sign, Chevalley, Harish-Chandra, dot orbits, `gl` Pieri), the Serre theorem keeps `[CharZero K]`, `[IsSimple K L]` and `[IsTriangularizable K H L]` without algebraic closure, the product-centre theorem keeps only `[Field K]` and `[IsLieAbelian Z]`, the monic-relations adapter only `[Field K]`, and the four definitions carry only the variables their types mention (`lieCartanRestriction` without `CharZero`, as README.md:1925–1929 states; `symmetricDegreeLE` over any field, as :1873). No lost binder was found. The one-tactic probe (`simp`, `rfl`, `infer_instance`, each required to close) on a scratch copy left all 15 admissions (15 errors, one per theorem): no headline is padding. The import list names 15 `TauCeti.*` modules, each present at the pin; the resolver's one lead (`DotOrbit`) is the module `TauCeti.Algebra.Lie.HighestWeight.CentralCharacter.DotOrbit`, which exists.

**Headline coverage.** The fifteen statements are the normalised polynomial/symmetric-power dictionary, finiteness over a central subalgebra from monic relations, PBW symmetrisation with its three laws, the minuscule Pieri rule, the Tits sign of the invariant form, Chevalley restriction with the actual Killing-orthogonal map, filtered Harish-Chandra onto dot invariants, equality of central characters iff dot-conjugate, injectivity of the normalised Serre lift over split fields, the split `G₂` and `F₄` identifications, the `E₈` and `E₆`/`E₇` dimensions, the `glₙ` dual-standard Pieri rule and the product-centre equivalence. The docstring names what is not statable (compact real forms, Vinberg and Freudenthal models, closed alcoves and the compact centre, LR tableaux, the Rees fibre and first-order Poisson comparison, category O) and assigns the type-A Schur-character identity to ClassicalGroups Layer 4 (`ClassicalGroups/Suggested.lean:215`, `character_irreducible_eq_detTwist`). Every Lean name appears in the README; every backticked own name resolves except the five of R01.

**Seeded sources.** Every sampled locator was opened in a cached legal text; printed pages were read off the page footers (18.755 notes: printed = PDF − 1; Etingof arXiv: printed = PDF; Garnier: printed = PDF − 4).

| Sample | Text and locator | What it supports |
| --- | --- | --- |
| §0.1 | `etingof755` lines 2447–2521 (§11.4, Thm 11.16, printed pp. 65–67), 2540–2548 (Thm 11.18, p. 68) | `e = x∂_y`, `f = y∂_x`, `h = x∂_x − y∂_y`, `e v_pq = q v_(p+1,q−1)`, `f v_pq = p v_(p−1,q+1)`, hence `E e_i = i e_(i−1)`, `F e_i = (d−i) e_(i+1)`; Clebsch–Gordan `V_m ⊗ V_n = ⊕ V_(|m−n|+2i)`. The norms and orthogonality are the README's adapters, recomputed below. |
| §3.1, §3.2 | `gutt` lines 899–922 (Lecture 1, slide 14/28) | `P_ξ(X,Y) = ⟨ξ,[X,Y]⟩` and `σ(X₁…X_k) = (1/k!) Σ_ρ X_ρ(1)…X_ρ(k)`; the arbitrary-ring Rees statements are the README's own, as it says. Humphreys §20.3: uncertified. |
| §5.1 | `etingof755` lines 6640–6658 (Example 32.13, Prop. 32.14, pp. 176–177); `etingof` lines 3469–3472 (§17.2, p. 81) | principal `sl₂` with `h = Σ cᵢhᵢ = 2ρ∨`, `cᵢ` from `Σ cᵢ aᵢⱼ = 2`; real type iff `(2ρ∨,λ)` even by the multiplicity-one top string; the split-field extension is the README's and is argued. |
| §5.2 | `woit` lines 94–132 (§2, Thm 1, pp. 3–4), 192–242 (§3, Thm 2, p. 5) | Weyl integration `(1/|W|)∫_T f |δ|²` with `J = δδ̄`; the norm-one argument `Σ n_β² = 1` and coefficient 1 of the top alternant. |
| §6.1 | `etingof755` lines 5898–5926 (Prop. 30.4, p. 159), 5930–5934 (Cor. 30.5, p. 160), 5945–5974 (Cor. 30.7 and proof, p. 160) | orbit characterisation of minuscule, orbit-sum character, the Pieri proof by wall cancellation `(λ+γ+ρ, αᵢ∨) = 0`; the source uses the symmetric denominator, the README the integral one, as its adapter says. |
| §6.2 | `etingof755` lines 5127–5140 (Prop. 26.3, Thm 26.4, pp. 139–140) | anti-invariance of `Δ` and the character formula; the fixed-point rational sum is the README's adapter. |
| §7.1, §7.2, §9.2 | `etingof` lines 2153–2244 (Thm 10.1, Remark 10.2, Example 10.3, pp. 51–53), 2987–3000 (Thm 13.5, p. 69), 3041–3082 (Thm 14.1 (i)–(v), Remark 14.2, pp. 70–71); `etingof755` lines 4763–4830 (§24.2, Thm 24.2, Lemma 24.3, pp. 130–132); `stacks` (algebra chapter) lines 13996–14006 (Lemma 122.11, tag 02ML) | restriction, trace-power surjectivity by orbit-sum unitriangularity and Zariski density of `P₊`, Kostant's graded statement, the filtered HC map with `gr(HC) = Res`, the reductive extension, the `glₙ` elementary/power-sum/complete generators; Serre's theorem with the free-algebra lemma and the root-support step in (iii); the localised finiteness input. |
| §9.1, §9.3 | Goodman–Wallach; Dixmier §1.6 | not readable (Springer, AMS); the native maps and small instances were checked instead. |
| §10.1, §10.2 | `garnier` lines 231–237 (Thm 1.3.2, p. 5), 276–278 (Thm 1.3.5, p. 5), 389–396 (Prop.-Def. 2.2.1, pp. 7–8), 642–646 (Cor. 2.2.7, p. 10), 1161–1173 (Prop. 2.3.1, pp. 16–17); `etingof755` lines 8808–8847 (Thm 43.4, Cors 43.5–43.6, pp. 231–232) | `W_a ≃ Q∨ ⋊ W`, the closed alcove as fundamental domain and simple transitivity on open alcoves, the `Ω` representatives `t_ϖ∨ᵢ wᵢ` over the special nodes, `Aut(D̂) ≃ Ω ⋊ Aut(D)`, the lattice correspondence with `|Ω_Λ| = [Λ:Q∨]` and `W_Λ ≃ W_a ⋊ Ω_Λ`; `π₁(G_ad) = P∨/Q∨`, the centre of `G_sc`, the reductive finite central covering. |
| Layer 8 | `baez` (arXiv math/0105155) lines 340–362 (§2.2, eqs (2)–(3), pp. 8–9), 1469–1481 (§3.4, p. 32) | Cayley–Dickson `(a,b)(c,d) = (ac − d b*, a* d + c b)`, `(a,b)* = (a*,−b)`; the Albert determinant and its trace-power form. |

**Pinned declarations opened.** Every library name in the supplier contracts and in `Suggested.lean` was located at the pin (a script over the backticked identifiers, then by hand for the ones below); the ones material to the review:

| Pin, file and line | Declaration | What it supplies and what it does not |
| --- | --- | --- |
| Tau Ceti `RepresentationTheory/Compact/FrobeniusSchur/Trichotomy.lean:109` | `frobeniusSchurIndicator_trichotomy` | values 1, 0, −1 for `IsUnitary π` and irreducible `π.toRepresentation`, under `[Group G] [TopologicalSpace G] [IsTopologicalGroup G]`, compact with Borel σ-algebra, `π : ContRepresentation ℂ G V` continuous, `V` finite-dimensional inner-product (file variables `:78–82`). |
| Tau Ceti `…/FrobeniusSchur/InvariantForm.lean:135`, `:148`, `:167` | `frobeniusSchurIndicator_eq_one_iff`, `_eq_neg_one_iff`, `_eq_zero_iff` | existence of a nondegenerate invariant symmetric form; alternating form; `Representation.invariantForms π.toRepresentation = ⊥`. Exactly as README.md:345–351 says; no real/quaternionic structure maps (those are `StructureMap.lean`). |
| Tau Ceti `RepresentationTheory/Compact/UnitaryModel.lean:92`; `Continuous/Square/Invariants.lean:240` | `exists_isUnitary_congr`; `finrank_invariants_squares_le_one` | a `V ≃L[𝕜] V` making `congr e π` unitary; `finrank (Sym²π).invariants + finrank (⋀²π).invariants ≤ 1` for unitary irreducible π. |
| Tau Ceti `RepresentationTheory/InvariantForm.lean:176` | `Representation.invariantForms` (with `invariantFormsEquivIntertwiningMapDual`) | the submodule of invariant bilinear forms and its identification with intertwiners to the dual. |
| Tau Ceti `Algebra/Lie/HighestWeight/Minuscule.lean:197` | `IsMinuscule` | dominant integral with every weight of `L(μ)` Weyl-conjugate to μ. |
| Tau Ceti `Algebra/Lie/HighestWeight/Tensor.lean:90` | `tensorMultiplicity` | `isotypicMultiplicity` of `L(ν)` in `L(λ) ⊗ L(μ)`. |
| Tau Ceti `Algebra/Lie/Weights/WeightLattice.lean:100` | `coweightPairing` | `invFun Int.cast (λ(α∨))`, an integer under integrality; junk otherwise, excluded by `IsDominantIntegral` in the Tits-sign headline. |
| Tau Ceti `Algebra/Lie/HighestWeight/CentralCharacter/{Basic,HarishChandra,DotOrbit}.lean` | `vermaCentralCharacter`, `representation_eq_vermaCentralCharacter_smul`, `vermaCentralCharacter_casimirElement`, `hcProjection`, `cartanProjection`, `lift_hcProjection`, `dotInvariants`, `hcProjection_mem_dotInvariants`, `vermaCentralCharacter_dotAction`, `dotAction` | the raw projection and dot invariants; neither surjectivity nor the orbit iff. |
| Tau Ceti `Algebra/Lie/Presentation/Serre.lean:411`, `Serre/Killing.lean` | `serreLift`, `exists_isSerreSystem_of_base`, `exists_surjective_serreLift_of_base`, `serreLift_surjective` | the lift and its surjectivity; injectivity is the headline. |
| Tau Ceti `Algebra/Lie/GeneralLinear/{Carrier,Casimir}.lean` | `glIrreducible`, `IsGlDominantIntegral`, `isGlHighestWeightVector_glIrreducibleGenerator`, `nonempty_lieModuleEquiv_glIrreducible`, `finrank_glIrreducible_le`, `isIrreducible_glIrreducible_restrict_sl`, `glCasimir`, `glCasimir_smul_of_…` | the carrier, uniqueness, dimension bound, restriction, trace-form Casimir. |
| Tau Ceti `Algebra/Lie/UniversalEnveloping/{Prod,Abelian,Functoriality}.lean`, `PBW/Finite.lean` | `prodEquivTensor`, `symmetricAlgebraEquiv`, `mapEquiv`, `span_range_bounded_orderedPowerProducts_eq_top`, `moduleFinite_of_isIntegral_of_span_eq_top` | the two maps composed by `productEnveloping`; the finiteness inputs of the monic adapter. |
| Mathlib `Algebra/Algebra/Subalgebra/Centralizer.lean:104`, `:145` | `centralizer_…_includeRight_eq_center_tensorProduct` | centralizer of `1 ⊗ B` is `A ⊗ C(B)` for `A` free, as §9.2 uses over a field. |
| Tau Ceti `Algebra/AlbertAlgebra/Basic.lean:104–109`, `:365` | `AlbertAlgebra`, `finrank_eq_twentySeven`, `finrank_traceZero` | `offDiag i` at `(i+1, i+2)`, conjugate at `(i+2, i+1)`; dimensions 27, 26. |
| Tau Ceti `Algebra/Octonion/{Basic,Derivation}.lean`, `Algebra/Lie/Derivation/Basic.lean` | `Octonion`, `Octonion.finrank_derivationLieAlgebra`, `derivationLieAlgebra`, `derivationLieAlgebraCongr` | the split Zorn carrier, dimension 14, the derivation carrier and its transport. |
| Tau Ceti `RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59`, `SU2/SymmetricPower.lean:97` | `symPowerRep`, `SU2.symPower` | the `GL₂`/`SU(2)` symmetric powers §0.1 consumes. |
| Tau Ceti `Algebra/Lie/Sl2/ClebschGordan.lean`; `Sl2/{Spectrum,WeightString}.lean`; `Weights/{Integrable,Diagonalizable,Central,WeightLattice}.lean`; `Reductive.lean`; `HighestWeight/{Existence,CompleteReducibility,Decomposition,Freudenthal,KostantMultiplicity,Weyl/*,Dual,Casimir,Separation,Weight/Verma}.lean`; `Multiplicity.lean`; `Isotypic.lean`; `UniversalEnveloping/{Module,Multiplicity,Casimir}.lean`; `LinearAlgebra/RootSystem/{Opposition,Weyl/DotAction,RootLength}.lean`; `LinearAlgebra/SymmetricAlgebra/{AdjointAction,Grading,Derivation/OfEnd,Functoriality}.lean`; `Algebra/Lie/{InnerAutomorphism,Sl2/Weyl/Automorphism}.lean`; `RingTheory/MvPolynomial/Symmetric/Schur/Bialternant.lean`; `Algebra/Lie/E7/Minuscule/*` | the other 60-odd names of the From Tau Ceti contract | all present at the pin with the stated roles. |
| Mathlib `Algebra/Lie/{Sl2,Classical,CartanSubalgebra,CartanExists,Weights/*,SerreConstruction,Rank,TensorProduct,DirectSum,Matrix}.lean`, `LinearAlgebra/RootSystem/{Defs,BaseChange,BaseExists,OfBilinear}.lean`, `Analysis/Fourier/AddCircleMulti.lean`, `GroupTheory/GroupAction/{Defs,Quotient}.lean` | the From Mathlib contract | present; `RootDatum` is `abbrev RootDatum … := RootPairing ι ℤ X₁ X₂` (`Defs.lean:111`); `mFourierCoeff` integrates against the negative-frequency character, as §6.2 says. |

**Ownership.** Object searches over main and the open heads (Chevalley restriction, Harish-Chandra isomorphism, affine Weyl group and alcoves, Littlewood–Richardson, Albert algebra, Cayley–Dickson, Serre presentation, Rees algebras, PBW symmetrisation, Clebsch–Gordan, minuscule, Frobenius–Schur indicator, Vinberg, Pieri rules): the other owners found are consumers of this roadmap (FormalConnectionsOpers, CharacteristicClasses, ReflectionInvariantTheory, NilpotentOrbits, SpinRepresentations, ExceptionalThetaCorrespondencesForG2 for Layer 8, TangentialBordism for the compact real track) or different objects (LanglandsParameterStacks' integral Chevalley restriction for Levi groups, KacMoody's Serre relations for Kac–Moody algebras, ReductiveGroupsPartII's Bruhat–Tits alcoves, TensorProductCombinatorics' hives beyond SchurWeyl's gap, ScatteringDiagrams' primitives). No second owner of a headline, and no two `Suggested.lean` files declare the same fully qualified name. Ownership against open pull requests without supplied files was not checked beyond the roadmap search service.

**Adversarial computations.** Exact rational arithmetic in scratch (Python, fractions, no numerics except the one Haar integral): all string vectors `F_tot^k v_r` for `0 ≤ m, n ≤ 4` were built from the README's operators and the form `⟨e_i,e_j⟩ = δ_ij/binom(d,i)` and checked against every identity of §0.1 (225 vectors: annihilation by `E_tot`, the binomial expansion, the ladder `E F^k v = k(N−k+1) F^(k−1) v`, `F^(N+1) v = 0`, both norm formulas; 946 cross-string pairs, 0 non-orthogonal; `E† = F` on all monomial pairs; `Σ_r (N_r+1) = (m+1)(n+1)`).

| Statement or object | Instance | Left side | Right side | Result |
| --- | --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d = 2, i = 1; rescaled map 2e | xy, norm² 1/2; averaged tensor norm² 2·(1/2)² = 1/2 | pure tensor with coefficient 1; 2e gives norm² 2 | keep; the rescaling is excluded |
| `module_finite_of_central_monic_relations` | L = K·x, R = K[x²], relation x² − a; κ empty | U = R·1 + R·x; U = K = R | finite of rank 2; 1 | keep |
| `exists_pbwSymmetrization` | l = [e,f] in sl₂; l = [] | (ef + fe)/2 = fe + h/2; 1 | average of 2 words; empty product 1 | keep |
| `minuscule_pieri` | sl₂, λ = 0, μ = 1, ν = 1, 0; λ = μ = 1, ν = 2, 0 | mult 1, 0; 1, 1 | weight ν − λ of L(1) present, absent; present, present | keep; μ = 0 gives [ν = λ] |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(n), n = 1..4, form solved from invariance | (alt, sym, alt, sym) | (−1)^n = −1, 1, −1, 1 | keep; Etingof 32.14 agrees |
| `exists_lieChevalleyRestrictionIso` | sl₂, q = h² + 4ef | e·q = −4eh + 4eh = 0, f·q = 4fh − 4hf = 0; restriction h² | h² W-invariant; h not | keep |
| `exists_harishChandraIso` | Ω = h² + 2h + 4fe | raw t² + 2t: values 3, 3 at t = 1, −3 | dot reflection t ↦ −t − 2 | keep; τ₋ρ gives t² − 1, τ_ρ gives t² + 4t + 3 |
| `centralCharacter_eq_iff_dotOrbit` | λ = 2, μ = −4; μ = 1 | χ(Ω) = 8, 8; 3 | dot orbit {2, −4}; 1 outside | both directions |
| `serreLift_injective_of_base` | B₃, α₂ = ε₂ − ε₃, α₃ = ε₃ | A₂₃ = −2, A₃₂ = −1; ⁅h₂,e₃⁆ = −e₃, ⁅h₃,e₂⁆ = −2e₂ | `CM = Aᵀ`: ad(e₂)²e₃ = 0, ad(e₃)³e₂ = 0 | transpose required, as README.md:1856–1859 says |
| `derivationOctonion_equiv_g2`, `derivationAlbert_equiv_f4` | dimensions | 14 = 12 + 2; 52 = 48 + 4 | native 14; 27 − 1 = 26 | consistency only |
| `finrank_e8`, `finrank_e6_e7` | root counts | 240 + 8; 72 + 6; 126 + 7 | 248; 78; 133; Vinberg 80 + 84 + 84 | keep |
| `gl_dual_standard_pieri` | μ = (3/2, 1/2); (2,1,0) | n·dim = 2·2 = 4; 3·8 = 24 | 1 + 3; 3 + 6 + 15 | keep; non-integral centre allowed |
| `exists_productCenterEquiv` | Z = K, S = sl₂; Z = S = 0 | K[t] ⊗ K[Ω]; K | centre of U(K × sl₂); K ⊗ K | keep |
| §0.1 item 5 | n = 2, 3, 4 | F²w₁ = (2, 4n, n(n−1)), Fw₂ = (1, n−2, −(n−1)), w₃ = (1, −2, 1); Gram diag (1, 1/(2n), 2/(n(n−1))) = (1,1/4,1), (1,1/6,1/3), (1,1/8,1/6) | cross products 0, 0, 0 | keep |
| §0.1 norms | (m,n,r,k) all with m,n ≤ 4 | Σ_j binom(r,j)²/[binom(m,j)binom(n,r−j)] | r!(m−r)!(n−r)!(m+n−r+1)!/[m!n!(m+n−2r+1)!]; k!N!/(N−k)! factor | identical on all 225 vectors |
| §3.2 ordered product | p,q = x,y; y,x; a=0,b=1,c=1,d=0 | B_ord = y; 0; x⋆y = yx + ħy | from `X^bY^c = Y^c(X+cħ)^b` | keep |
| §3.2 symmetric splitting | 300 random pairs; (x,y) | B_sym = (1/2){p,q}; y/2 and −y/2 | D(xy) = y/2; difference y | keep |
| §3.2 mean interchanges | (b,a) = (1,1), (2,1), (2,2), (3,2) | mean XY inversions 1/2, 1, 2, 3 | ab/2 | `T = Id + ħD` with D = (1/2)y∂_x∂_y |
| §3.1 derivative identity | [x,y] = y at (2,3) | {x,y} = 3, {y,x} = −3, {x²,y} = 12 | ξ([·,·]) values 3, −3, 12 | agrees with LieGroupoidsPoisson G4.6A |
| §5.2 score identity | 500 random (n ≤ 5, integer x and λ) | x·λ | (S/n)Σx + Σ_j [Σ_(i≤j)xᵢ − (j/n)Σx] dⱼ | identical; x = (3,2,1): both tie weights score 3 |
| §5.2 bound | n = 2, S = 0, x = (2,1), B = 1 | dominant (k,−k), score k | (0,0), (1,−1) | keep |
| §5.2 Haar norm | λ = (1,0), (1,1); (2,1,0), (1,1,0) | torus sum 2, 2; 6, 6 | (1/n!)·sum = 1 each | keep |
| §5.2 polynomiality | n = 2, λ = (1,0); (1,1); (0,−1) | D·P = t₁ − t₂²/t₁; t₁t₂ − t₂²; P = t₁⁻¹ + t₂⁻¹ | N_λ; N_λ; dual standard | keep; C_λ = (t₁² − t₂²)/(t₁ − t₂) = t₁ + t₂ |
| §5.2 virtual character | U(2) | χ_(2,0)|_T = t₁² + t₁t₂ + t₂², χ_(1,1)|_T = t₁t₂ | t₁² + t₂² = χ_(2,0) − χ_(1,1) | keep |
| §5.2 tensor rule | GL₂ λ = μ = (1,0); (2,0),(1,0); (0,0),(1,0) | actual (2,0) ⊕ (1,1); (3,0) ⊕ (2,1); (1,0) | formula translates (2,0),(1,1); (3,0),(2,1); (1,0),(0,1) with (0,1) not dominant | gap 1 ≥ 1 and 2 ≥ 1 allowed, 0 < 1 excluded: weak inequality right |
| §5.2 branching | λ = (2,1,0) | interlacing rows (1,0),(1,1),(2,0),(2,1), dims 2,1,3,2 | sum 8 = dim | keep |
| §6.1 orbit sum and root order | A₁: λ = 0, 1, 2; μ = 0, 1, 4 below 2 | orbits {0}, {±1}, {±2}; 2 − μ = 2, 1, −2 | sizes 1, 2, 2; membership true, false, false | keep |
| §6.2 fixed-point sum | GL₂ λ = (1,0) at (2,3) | −4 + 9 | t₁ + t₂ = 5 | keep; δ − ρ = (1/2,1/2) |
| §6.2 Fourier sign and Kostant | χ₁ = z + z⁻¹; monomial z; A₂ | coefficients 1,1; 1,0; P(0,0), P(1,0), P(1,1) = 1, 1, 2 | `mFourierCoeff` negative frequency; adjoint value 8 at the identity | keep |
| Layer 7 Int(L) | exp(ad e) on h, f (exact nilpotent series) | h − 2e, f + h − e; [h−2e, f+h−e] = −2(f+h−e) | bracket preserved | keep |
| Layer 7 Killing transport | κ(h,h), κ(e,f); φ = κ(h,·), g = exp(ad e) | 8, 4; κ(h−2e, f) = −8 | κ(h, exp(−ad e)f) = κ(h, f−h−e) = −8 | keep |
| Layer 7 trace powers | standard at th; adjoint | 2t² ↦ h²/32; 8t² ↦ h²/8 | Killing-dual coordinate λ(h) = 8t | keep |
| Layer 7 separation | A₁ invariant (h²−1)/3; dot orbits {0,−2}, {1,−3} | 0, 1 on {±1}, {±2}; q(λ) = p(λ+1): 0, 0; 1, 1 | translation by −1 gives 8/3 at −2 | keep |
| Layer 8 division double | (ij)ℓ, i(jℓ); (yx)x, y(xx); 200 random pairs | (0,k), (0,−k); (−j,0) both; alternative laws and N(xy) = N(x)N(y) hold | README product vs Baez (2)–(3) under (a,b) ↦ (a, b̄): equal on all 200 | keep |
| Layer 8 Albert cubic | native layout, 100 random complex-entry matrices; diag(1,2,3); (3,1,1) with x₁ = 1; E₀₀; unit | README cubic = ordinary determinant; 6 and (216−252+72)/6 = 6; 2; 0; 1 | formula | keep |
| Layer 8 Baez cross term | x = z = i, y = 1, zero diagonal | determinant 2 | 2Re(xyz) = −2, 2Re(xyz*) = 2 | source error, not inherited (the README uses the native layout) |
| Layer 8 derivations | A = E₀₀, B = E₀₁+E₁₀, C = E₁₂+E₂₁, D = [L_A,L_B], D₁₂ = [L_E₁₁, L_C] | D(A) = −B/4; [D,D₁₂](A) = −(E₀₂+E₂₀)/16; B∘C = (E₀₂+E₂₀)/2; B² = E₀₀+E₁₁ | README.md:2245–2248, 2266–2270 | keep |
| Layer 8 trace of L_A | compact Albert carrier (27 real coordinates), A = diag(1,0,0), diag(1,2,3) | tr L_A = 9, 54 | 9·tr A = 9, 54 | keep; trace(A∘A) = 13 for (3,1,1), x₁ = 1 |
| Layer 9 gl₂ Casimir | μ = (3/2, 1/2) | 15/4 − 1/4 | 7/2 | keep |
| Layer 9 staircase | N = 2, 3, 4 | lowered Casimirs (1/2, 9/2), (27/4, 43/4, 59/4), (22, 26, 30, 34) | differences 4 | keep |
| CAR example | N = 1, 2, 3 | (N + N(N−1))/2 = 1/2, 2, 9/2 | N²/2 = Σνᵢ; dim L(ν) = 1, 2, 8; multiplicity 2, 8, 64 | keep |
| Weyl dimension | A₂ (a,b) list; G₂ ω₁, ω₂ | 3, 3, 8, 6, 10, 27; 7, 14 | formula | keep |
| Opposition | D₄; A₂ | −Id = four sign changes ∈ W(D₄); −Id ∉ S₃ | w₀ = −Id with Aut = S₃; dual-standard | keep |
| Compact Frobenius–Schur | SU(2) standard (Weyl integral of 2cos2θ against (2/π)sin²θ); Q₈ standard; S₃ standard; circle z; trivial | −1.0000; (4 − 12)/8 = −1; (2 + 6 − 2)/6 = 1; 0; 1 | native trichotomy values | keep |
| Affine A₁ | x = 2/3 | W_aff orbit ∩ [0,1] = {2/3}; stabilisers 2 at 0, 1 at 1/3 | extended x ↦ 1 − x sends 2/3 to 1/3 | keep |
| Compact centre | SU(2); SO(3) | P∨/Y of order 2; 1 | Y/Q∨ of order 1; 2 | distinct quotients kept |
| Period calibration | SU(2) | exp(t·diag(i,−i)) period 2π; root z ↦ z² differential 2i | coroot ↦ 2π·diag(i,−i); diag(i,−i) alone has exp ≠ 1 | keep |

**Other claims checked by hand.** The §7.1 polynomial-differential lemma (a polynomial vanishing on the image of a polynomial map with surjective differential at one point is zero, characteristic zero) by the chain rule on successive derivatives and Taylor coefficients; the root-exponential differential `dφ_(0,h)(t,k) = k − Σ_α α(h) t_α e_α` with the sl₂ value `φ(t,0,h) = h − 2te`; the §5.1 principal-triple eigenvalue gap `μ(2ρ∨) < λ(2ρ∨)` for every other weight; the §9.2 centre of `Sym(Z) ⊗ U(S)` over a field; the finiteness of the §5.2 dominance ideals from the positive bracket coefficients; the opposition table of README.md:894–896.

## Not verifiable

- **Dixmier, Enveloping Algebras, §1.6** (§9.3): no legal readable text (AMS GSM 11); the native maps and the small instances were checked instead.
- **Humphreys 1972, §20.3** (§3.2 Verma presentation) and the chapter locators in References; **Goodman–Wallach** (Layer 9): Springer; uncertified. The cached scan of Humphreys from a course site was not used.
- **Fulton–Harris, Serre 1987, Humphreys 2008, Bourbaki, Jantzen, Jacobson, Schafer, Molev, Landsberg–Manivel** (background references): no sampled target rests on them alone; Landsberg–Manivel (arXiv math/9908039) is cached but was not needed.
- The eight supplier gaps' registration in a `plan.json` `gaps` list: no readable plan exists for this folder (R04).

## Source issues

- **Misprint** in etingof755 at §11.4, proof of Theorem 11.16 (iii), printed p. 67 (`etingof755` line 2500): the source says the m-th lowered vector corresponds to the monomial with exponents m on x and n−m on y; it should be n−m on x and m on y, since the highest vector is xⁿ; affects the proof.
- **Misprint** in woit at §3, proof of Theorem 2, printed p. 5 (`woit` line 241): the source says the alternant indexed by λ+δ occurs with coefficient 1; it should be λ+ρ, δ being the denominator function; affects the proof.
- **Gap** in garnier at proof of Proposition 2.3.1, printed p. 17 (`garnier` line 1191): the source says the lattice is countable, hence discrete; discreteness follows from containment in the coweight lattice, not from countability; affects the proof.
- **Error** in baez at §3.4, determinant display, printed p. 32 (`baez` lines 1475–1479): the source says the cubic cross term is 2Re(xyz) for the displayed layout; it should be 2Re(xyz*), as the zero-diagonal instance x = z = i, y = 1 gives determinant 2 against −2; affects a stated result.
