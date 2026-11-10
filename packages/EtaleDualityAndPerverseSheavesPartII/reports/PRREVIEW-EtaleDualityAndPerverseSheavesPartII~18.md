# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 975ac17)

**Verdict:** needs changes

This is an incremental re-review of the 10 lines that changed since c8b9b83. All of them are in `README.md`: the Mathlib contract for §8.3 (`:64`), the ArcTopologyAndDescent contract (`:138`), and the §8.3 proof route, *Needs* line and one new Check (`:1570–1578`). `Suggested.lean` is unchanged.

R02 of the previous review is repaired, and the repair introduces no new problem. One finding remains: R01, carried forward. Its repair is in PurityForFlatCohomology, whose head has not moved.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is R01 of the previous review, carried forward. No repair report marks it as not actionable.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements."
- `README.md:1648` (this was `:1644`; the two lines inserted at `:64–65` moved it): "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** this roadmap is the only owner of four statements:
- §7.1, affine Lefschetz on principal punctured opens;
- §6.11, the normalised dualizing complex;
- §6.12, local duality;
- §7.3, local Lefschetz.

**Witness:** PurityForFlatCohomology (#1840) is still at d3f15fd9, and in its `README.md`:
- §1.4 (`:1107`) states (a) = our §7.1, (b) = our §6.11 and (c) = our §6.12.
- §1.5 (`:1160`) states our §7.3.
- Lines `:206–207` and `:3471–3472` name this roadmap as the importer.
- The *Needs* line at `:1201` cites its own §1.5.

**Repair** (in PurityForFlatCohomology; nothing in this folder changes):
- Delete §§1.4–1.5 and the importer bullets at `:206–207` and `:3471–3472`.
- Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
- At `:1195`, replace "(§1.5:" by "(EtaleDualityAndPerverseSheavesPartII §7.3:".
- At `:1201`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

The owner should be this roadmap. PurityForFlatCohomology §1.4(a) is a special case of §5.7 here, and its route has no proof of Gabber's theorem.

**Test:** the previous review ran the dependency check on a scratch copy at d3f15fd9 with the `:1201` edit made.
- With `--movable` it printed `moved: PurityForFlatCohomology … right after its last supplier EtaleDualityAndPerverseSheavesPartII` and `0 problem(s)`. A `moved:` line is not a defect.
- That head is unchanged, so the test stands.
- The merge order lists PurityForFlatCohomology at #220 and this roadmap at #390.

## Previous findings

- R01 — not repaired: `README.md:23` still says PurityForFlatCohomology "owns none of these statements". At d3f15fd9, PurityForFlatCohomology still states §1.4 (`:1107`) and §1.5 (`:1160`) and cites its own §1.5 at `:1201`.
- R02 — repaired: `README.md:1570` now reads "Since A is ϖ-henselian with bounded ϖ^∞-torsion and D(ϖ) ⊆ U, ArcTopologyAndDescent §8.9 in degree 0 with F = ℤ/2 makes pullback H⁰(U, ℤ/2) → H⁰(U ×_A Â, ℤ/2) bijective". `:138` adds "Section 8.9 states no comparison of idempotents".

## Verified sound

### Gate, dependency check, build (run on this head)

- **Gate:** `tauceti-roadmap gate … --base origin/main` prints `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's `gate.md` adds `build=0`.
- **Dependency check** (`--movable`), output in full: `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder:** `git diff --stat origin/main...HEAD` lists no paths.
- **Build:** `lake env lean` on `Suggested.lean` exits 0 in 18 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332, the same as at c8b9b83.
- **Carried checks:** `git diff --stat c8b9b83 HEAD` lists only `README.md`. So the previous review's padding probe (all 8 theorems resist one tactic), its binder comparison (0 dropped binders; `scratch/signatures.md` agrees) and its headline audit still apply.

### The changed passages

**`README.md:64` (Mathlib contract).** I opened both declarations at the pin and ran `#check` on them in a scratch file:
- `PrimeSpectrum.isIdempotentElemEquivClopens`, at `Mathlib/RingTheory/Spectrum/Prime/Topology.lean:1402`, has type `{R} [CommRing R] → {e // IsIdempotentElem e} ≃o Clopens (PrimeSpectrum R)`.
  - By `coe_isIdempotentElemEquivClopens_apply` (`:1410`, `rfl`), it sends e to `basicOpen e` = D(e).
- `PrimeSpectrum.isIdempotentElemEquivClopens_mul` (`:1416`) sends the product to `⊓`.
- The README's "order isomorphism … sending e to D(e)" and "product … to the intersection" are accurate.
- "Stated for affine schemes only" is also accurate. `grep` for `IsIdempotentElem`, `Clopens` or `IsClopen` in the pinned `Mathlib/AlgebraicGeometry` finds no scheme-level equivalence. The pinned Tau Ceti has none either. So glueing along an affine cover is needed, not a restatement of library content.

**`README.md:138` (ArcTopologyAndDescent contract).** I checked it against ArcTopologyAndDescent (#1755 at dfd2dd1c), §8.9 at `README.md:1151–1161`.
- Hypotheses there: a-henselian A with bounded a-power torsion, an open U with D(a) ⊂ U ⊂ Spec A, and a torsion abelian étale sheaf F on U.
- Conclusion: RΓ(U, F) ≃ RΓ(U ×_A Â_a, F).
- It has no idempotent clause, as `:138` now says.
- The hypotheses are exactly the setting of §8.1 (`README.md:1512`: ϖ-henselian, bounded ϖ^∞-torsion, Spec A[1/ϖ] ⊆ U). F = ℤ/2 is torsion.

**§8.3 route (`:1570`).** Each step is correct:
- (i) On Spec B, an idempotent e has D(e) equal to the locus where e is 1, by the Mathlib equivalence.
- (ii) Idempotents (sections of O_U) and clopens (a local condition) both glue, and D(e|_V) = D(e) ∩ V.
- (iii) Clopens of U are the locally constant maps U → ℤ/2. These are the sections of the constant étale sheaf, which is represented by U ⊔ U → U.
- (iv) The identification is natural in U: D(f^♯e) = f^{-1}D(e). Pullback is a ring map on H⁰(−, ℤ/2), so orthogonality is kept.
- This is a valid replacement for CS24's own completion step. That step cites BČ22 Theorems 2.3.1 and 2.3.4 (CS24 lines 837–838).
- ϖ = 0 in characteristic p: Â = A and D(0) = ∅, so the step is the identity.
- The fact that sections of a constant étale sheaf are locally constant functions is elementary. ArcTopologyAndDescent §8.9 is stated for étale sheaves, and the Layer 8 Dependencies list EtaleCohomologyFoundations §0.7 and EnhancedDerivedSheaves §§0.1–0.4. I do not count it as an unowned input.

**§8.3 *Needs* (`:1572`).** It adds Mathlib `PrimeSpectrum.isIdempotentElemEquivClopens`, which resolves at the pin. ArcTopologyAndDescent §§8.6–8.9 was already listed.

**New Check (`:1578`).** I recomputed each claim:
- A = ℤ_(7)[t]/(t² − 2) is a domain, since √2 ∉ ℚ, so Idem(A) = {0, 1}.
- In ZMod 7, 3² = 2, (−3)² = 2 and 2·3 = 6 ≠ 0, all checked by `decide` in the scratch file. So the roots are simple, and Hensel plus CRT give ℤ_7[t]/(t² − 2) ≅ ℤ_7², with 4 idempotents.
- A is finite over ℤ_(7), so A ⊗ ℤ_7 is its 7-adic completion.
- A/7 ≅ 𝔽_7², with 4 idempotents, and idempotents lift along a henselian pair. So (A, 7) is not henselian.
- A is torsion-free. Also 7^p ∤ p for every prime p.
- So the Check isolates the henselian hypothesis of §8.9 (H⁰(ℤ/2): 2 elements vs 4), as it says. It does not contradict §8.3, whose hypotheses A fails.

### Seeded sample, where it falls in the changed passages

The changed §8.3 cites §8.1. §8.4 cites §8.3, and §8.6 depends on it through §8.5. I checked these three against CS24, whose arXiv v3 PDF pages equal the printed pages:

| Target | Locator checked | Hypotheses and statement against README |
| --- | --- | --- |
| §8.1 matched opens | CS24 lines 387–395, 416, 422 (§2.1.2, pp. 10–11); line 827 (Thm 2.2.7, p. 21) | ϖ^p ∣ p, ϖ-henselian, bounded ϖ^∞-torsion, perfectoid completion. Complements are matched via (2.1.2.2). The unpowered A^♭/ϖ^♭ ≅ A/ϖ follows from (2.1.2.2) and (2.1.2.3). All match. |
| §8.4 valuation products | CS24 lines 774–797 (Lemma 2.2.4, pp. 19–20); lines 863–872 (product case, p. 22) | Quasi-compact opens have no nonsplit étale covers. RΓ is concentrated in degree 0 as locally constant functions, matched via Idem compatibly with disjointness. All match. |
| §8.6 supports | CS24 lines 834–836 ((2.2.7.1), p. 21) | Closed Z ⊂ Spec A/ϖA, torsion G; the result follows from the open case and the supports triangle. Match. |

The other 12 sampled targets (§§0.3, 0.4, 1.3, 2.3, 3.4, 3.6, 4.2, 5.9, 6.1, 6.9, 6.11, 7.2) are in text this change does not touch. They were not re-read in this incremental review.

### Adversarial table

The new rows have values computed in this review. The carried rows repeat the values of the previous review (r17) for statements the diff leaves untouched.

| Statement | Instances tried | Values computed on each side | Result |
| --- | --- | --- | --- |
| §8.3 route, completion step (new) | ℤ_(7)[√2] with ϖ = 7, U = Spec A | H⁰(U, ℤ/2) has 2 elements vs H⁰(Spec Â, ℤ/2) = (ℤ/2)², 4 elements. A/7 has 4 idempotents. Not henselian, so §8.9 does not apply. | consistent; the Check witnesses the hypothesis |
| §8.3 route, henselian control (new) | 7-henselization A^h of ℤ_(7)[√2] | Idempotents lift from A/7 = 𝔽_7², so Idem(A^h) has 4 elements = Idem(ℤ_7²) | §8.9 bijection holds |
| §8.3 route, clopen/idempotent (new) | B = ℤ/6; wrong model e ↦ V(e) | Idempotents 0, 1, 3, 4. D(3) = {(2)}, D(4) = {(3)}, 3·4 = 0 ↔ D(3) ∩ D(4) = ∅. V(3·4) = V(0) = V(3) ∪ V(4), a union. | `_mul` (⊓ on D) excludes V |
| §8.3 route, ϖ = 0 (new) | A = 𝒪_C × 𝒪_C in char p, U = Spec 𝒪_C ⊔ Spec C | Â = A, D(0) = ∅ ⊆ U. Γ(U, O) = 𝒪_C × C has 4 idempotents = (ℤ/2)². | identity, holds |
| §8.3 statement (r17 row, recomputed) | 𝒪_C × 𝒪_C | 4 idempotents each side. Sending both primitive idempotents to (1,0) breaks (1,0)(0,1) = 0. H⁰(ℤ/2) = (ℤ/2)². | holds |
| §0.1 alt/S (r17) | S = 𝔸²_k, X = Bl₀; T = 𝔸¹_k over k; origin of 𝔸¹ | Diagonal closure and E × E, both of dim 2. k(t)/k infinite, so not in alt/S. The origin is not maximally dominant. | holds |
| §0.2 alt_ℓ′ (r17) | Spec ℤ[i] → Spec ℤ, ℓ = 3 and 2 | Degree 2 ∈ 3′: covering. 2 ∉ 2′: no odd-degree family contains ℚ(i). | holds |
| §0.6 reduction (r17) | k[x,y]/(xy) with Z = node; k × k; X = ∅ | 2, 2 and 0 members | holds |
| §0.8 h-topology (r17) | Bl₀𝔸² → 𝔸²; 𝔾_m ⊂ 𝔸¹; Spec ∏_ℕ 𝔽₂; x ↦ x² | Cover but not fppf; not a cover; not a cover; cover of degree 2 | holds |
| §1.1 `cohenGabber_equalCharacteristic` (r17) | cusp at p = 2, 3; k⟦x^p⟧; d = 0 | Separable degrees 3 and 2; purely inseparable of degree p, not étale; degree 1 | holds |
| §1.2 `cohenGabber_equivariant` (r17) | μ₂ on k⟦x⟧; S₃; char 2; G = 1 on k⟦x,y,z⟧/(xy,xz) | Degrees 2 and 6. `horder` fails. A/(t) ≅ k⟦x⟧/(x²). | holds |
| §1.4 `cohenGabber_mixedCharacteristic` (r17) | identity on ℤ_p⟦x⟧; μ_ℓ on V⟦x⟧; t ↦ x^p | Degree 1. Invariant degree 1 vs field degree ℓ. p x^(p−1) ∈ 𝔪, so `etaleAtPFibre` fails. | holds |
| §1.6 `partialAlgebraization_equalCharacteristic` (r17) | k⟦x,y⟧/(xy); a field | B = k, dim 0 = 1 − 1; a field is excluded by `hpos` | holds |
| §1.7 `partialAlgebraization_mixedCharacteristic` (r17) | ℤ_p⟦x⟧ with (x − p); p = 3, ℓ = 2 | 1 + 1 = 2. 2v₃(b₀) = 1, so there is no V-structure. | holds |
| §2.2 weak uniformization (r17) | cone xy = z², char 2 | Charts regular; the conic is smooth in char 2 | holds |
| §2.4 h-hypercover (r17) | constant Bl₀𝔸²_ℂ; Spec k → Spec k[ε] | E × E ⊄ the diagonal, so it is not a hypercover; the Čech nerve is | holds |
| §3.2 tube base change (r17) | strict trait, g = id | F vs RΓ(S_(s), F) = F_s̄ | equal |
| §4.2 finiteness (r17) | snc, r = 0, 1, 2; ℤ/p in char p | Ranks (1), (1,1), (1,2,1). H¹(𝔸¹, ℤ/p) is infinite. | holds; n invertible needed |
| §5.5 trait step (r17) | strict trait, U = η; Spec k | H¹ = ℤ/n(−1), H² = 0; d = 0 vanishes | holds |
| §5.7 `affineLefschetz_strictlyLocal` (r17) | trait n = 2; d = 0; punctured k⟦x,y⟧; non-noetherian V; n = 1 | H^{≥2} = 0. H³ excluded by affineness. H² excluded by `isNoetherianRing`. ZMod 1 = 0. | holds |
| §5.8 `cohomologicalDimension_le_of_strictlyLocal` (r17) | k⟦t⟧; punctured k⟦x,y⟧; Spec k | 1 < 2 sharp; 3 < 4 sharp; cd 0 > −1 needs `hd` | holds |
| §5.9 `cohomologicalDimension_fractionRing_eq` (r17) | ℤ_p; W(k̄)⟦x⟧; (ℝ[x,y]/(x²+y²))^h; ℝ⟦t⟧; 𝔽_p⟦t⟧; d = 0 | 2 = 1 + 1; 2 = 2 + 0; 1 vs ∞ excluded by `hreal`; ≤ 1 vs 2 excluded by `IsUnit`; c = 0 + c | holds |
| §6.6 potential dualizing (r17) | regular X, n = 5; strict trait | 4 automorphisms, pinned to 1; one iso to Λ(1)[2] | holds |
| §6.10 duality (r17) | Λ = ℤ/6, 𝔽₂ ⊕ 𝔽₃[1] | n₂ = (−2, 0), n₃ = (−3, −1); no common shift | holds |
| §6.11 normalised complex (r17) | d = 0, 1, 2; n = 6 | Λ; Λ(1)[2]; Λ(2)[4]; μ₆[2] = μ₂[2] ⊕ μ₃[2] | holds |
| §6.12 local duality (r17) | strict trait | H²_x(Λ) = Λ(−1), as Kummer gives | holds |
| §7.1 punctured opens (r17) | d = 1, f a uniformizer; f = 0 | H^{>1}(η) = 0; empty open | holds |
| §7.2 extension by zero (r17) | k⟦x,y⟧, f = x | H^i_𝔪(j_!) = 0, 0, 0, ℤ/ℓ(−1) for i = 0…3 | agree |
| §7.3 local Lefschetz (r17) | k⟦x,y⟧, i = 0, 1, 2; DVR; f = 0 | 0 → 0, 0 → 0; at i = d, 0 → ℤ/ℓ(−1) is not surjective; injective; identity | holds |

### Cross-roadmap citations and ownership for the change

- **ArcTopologyAndDescent §8.9** resolves at #1755 head dfd2dd1c (`README.md:1151`). Its locators are CS24 Lemma 3.1.2 and BČ22 Thm 2.3.4.
- **New citations:** the change adds no other roadmap citation. §8.1 and §8.2 are this roadmap's own sections.
- **Ownership:** the change introduces no new target. The idempotent/clopen fact is cited from Mathlib, not restated.
- **Overlaps:** `scratch/overlaps.md` lists no pull request changing this roadmap and no dropped or revision-only id. PurityForFlatCohomology, among the closest roadmaps in vocabulary, is R01.
- **Declared gaps:** the five `gap:` slugs in the README (`:82`, `:86`, `:98`, `:116`, `:132`) equal the five in `design/plan.json`, with the same suppliers and sections. The diff does not touch them.

### Remark on untouched text (no change requested)

- §8.4 assumes rank ≤ 1 for the V_i. CS24's product-case paragraph (lines 863–872) and Lemma 2.2.4 need no rank bound; the bound is only used for the base at line 873.

## Not verifiable

- **BČ22 Theorems 2.3.1 and 2.3.4**, which CS24 line 837 cites for its own completion step, were not opened. The README's route goes through ArcTopologyAndDescent §8.9 instead, and that section's locators belong to that roadmap's review.
- **Ill03, Epp73 and Ser65** are settled as uncertified. No changed passage uses them.

## Source issues

- none
