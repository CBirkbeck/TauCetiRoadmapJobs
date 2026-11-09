# Review of CountingBundlesAndHallAlgebrasOfCurves (pull request #1547 at e22a59e)

**Verdict:** accepted

This is an incremental re-review of the 8 lines (4 insertions, 4 deletions) changed in `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md` since b36567c. The changes are README:53, 55, 61 and 63, in the `From Mathlib` and `From Tau Ceti` supplier contracts. `Suggested.lean` is unchanged, and no file outside the folder changed.

No finding remains. The previous review's only finding (R01) is repaired, and the repair introduces no new problem.

## Previous findings

- R01 — repaired. The four changed lines no longer give library line numbers. They still name each declaration and its file. README:61 now reads: “`InvertibleSheaf.fixedRankOneEquiv` in `TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean` … by `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj` in the same file”.

## Verified sound

### The repair, checked at this head's pins

This head's `lake-manifest.json` still pins Tau Ceti a91d3aa and Mathlib 6b7abb3. Main still pins Tau Ceti 2fd255d and Mathlib 1b1ccf4. The README now gives a declaration name and a file, so each locator holds at both pins. The previous report found the eleven numbers right at main's pins and wrong at this head's.

- **No library line number remains.** A grep of the README for `.lean` followed by `line N`, for `(line N)`, for `.lean:N`, and for `line N` not preceded by a source id finds nothing. Every remaining “line N” is a source locator, such as `S16 line 615`.
- **Every cited library file exists at the pins.** There are 13 such files: 8 in Mathlib and 5 in Tau Ceti.
- **Every declaration named in the changed lines is in the stated file at a91d3aa / 6b7abb3.** There are 17; I opened each one:
  - Mathlib:
    - `Card.lean:120` `Matrix.card_GL_field`, which gives `Nat.card (GL (Fin n) 𝔽) = ∏ i : Fin n, (q^n − q^i)`.
    - `Artinian/Ring.lean:54` `IsArtinianRing.isNilpotent_jacobson_bot`, under `{R} [Ring R] [IsArtinianRing R]`. This matches the README's “associative ring and its Artinian condition”.
    - `Artinian/Module.lean:641` `IsArtinianRing.isSemisimpleRing_iff_jacobson`, under `[Ring R] [IsArtinianRing R]`.
    - `LittleWedderburn.lean:176` `Finite.isDomain_to_isField`, under `[Finite D] [Ring D] [IsDomain D]`.
    - `BinaryBiproducts.lean:1096` `Indecomposable`, defined as `¬IsZero X ∧ ∀ Y Z, (X ≅ Y ⊞ Z) → IsZero Y ∨ IsZero Z`. This matches the README's “excludes zero …”.
    - `Skeletal.lean:74` `Skeleton`.
    - `FullSubcategory.lean:39` `ObjectProperty.FullSubcategory`.
    - `YoungDiagram.lean:66, 186` `YoungDiagram` and `YoungDiagram.transpose`.
  - Tau Ceti:
    - `FixedRank.lean:69` `FiniteLocallyFreeSheaf.FixedRank`.
    - `FixedRank.lean:104` `FiniteLocallyFreeSheaf.FixedRank.pullback`. This is the newly spelled-out name, and it is pullback along any scheme morphism `f : X ⟶ Y`. README:262 and README:305 already used the same name.
    - `FixedRank.lean:185` `InvertibleSheaf.fixedRankOneEquiv`.
    - `FixedRank.lean:212` `InvertibleSheaf.fixedRankOneEquiv_inverse_obj_obj`. It is proved by `rfl` and is in the same file, as the README now says.
    - `EulerCharacteristic.lean:105` `Scheme.Modules.eulerCharBelow`, defined as `∑ i ∈ range n, (−1)^i · finrank`. It has no finiteness hypothesis.
    - `LineBundle/Basic.lean:131` `InvertibleSheaf.trivial`.
    - `LineBundle/Degree.lean:70` `InvertibleSheaf.eulerDegree`, defined as `χ₂(L) − χ₂(trivial X)`.
    - `HookLength/Basic.lean:136, 140` `YoungDiagram.armLength` and `YoungDiagram.legLength`. These are in the root `YoungDiagram` namespace and use ℕ subtraction.

### Gate, dependency check and elaboration

- **Gate, my run at e22a59e:**
  ```text
  gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
  ```
  The worker's gate on this head also reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- **Dependency check, verbatim:**
  ```text
  depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
  ```
  It shows no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0, and its only warnings are the two `sorry` warnings, at lines 89 and 99.
- **Signatures.** I elaborated `#check @` on all five declarations in a scratch copy. The types are identical to those at b36567c. `bundleDegree`, `IsAbsolutelyIndecomposable` and `absIndecCount` keep `k [Field k] (X : Scheme) [X.Over (Spec k)]`. `nilpotent_matrix_count` keeps `[Field K] [Finite K] (n : ℕ)`. `absIndecCount_eq_of_degree` keeps `[Finite k] [IsProper] [SmoothOfRelativeDimension 1] [GeometricallyConnected] (r : ℕ) (d d' : ℤ)`. Nothing changed.
- **Scratch probe for the changed claims.** I wrote a copy of `Suggested.lean` with `TauCeti.AlgebraicGeometry.LineBundle.Degree` and `TauCeti.Combinatorics.Young.HookLength.Basic` added; I built both modules first. It elaborated with no errors:
  - **Rank-one degree (README:61 and §0.2).** For `E : FixedRank X 1`, `bundleDegree k X E = InvertibleSheaf.eulerDegree k ((fixedRankOneEquiv X).inverse.obj E)` closes by `simp [bundleDegree, InvertibleSheaf.eulerDegree]`.
  - **General-linear counts (README:53).** `Nat.card (GL (Fin n) (ZMod 2))` is 1, 1 and 6 for n = 0, 1, 2, by `rw [Matrix.card_GL_field]; simp`.
  - **Arm and leg lengths (README:63).** For λ = (2), cell (0,0) has arm 1 and leg 0. For λ = (1,1), cell (0,0) has arm 0 and leg 1. Each value was checked via `rowLen_eq_card` / `colLen_eq_card` and `decide`.
- **Padding.** `Suggested.lean` is unchanged, so the b36567c one-tactic probes stand: no headline closes in one tactic.

### Seeded sample, where it touches the change

Two sampled targets cite declarations named in the changed lines. I checked both against S16:

| Target | Locator checked | Result |
|---|---|---|
| 1.2 Krull–Schmidt for coherent sheaves (cites `isNilpotent_jacobson_bot`, `Finite.isDomain_to_isField`) | S16 Lemma 2.3(i)–(iii), printed p.309, S16 line 619 (page marker at S16 line 615) | Lemma 2.3 gives the Krull–Schmidt property and that k_M = End(M)/rad is a field, as the README states. The README's “unit or nilpotent” follows from the nilpotent radical of a finite-dimensional local algebra |
| 1.4 finite-field nilpotent matrix count (cites `Matrix.card_GL_field`) | S16 Cor 2.5 and its proof, p.309, S16 lines 639–645; S16 Appendix A, p.356, S16 lines 3259–3266 | Cor 2.5's proof uses \|N_{n,k}\| = \|k\|^{n(n−1)} from FH58 Thm 1. Appendix A uses the same count over the residue field k_x, so the README's “Fine–Herstein input” locator is right |

The other 13 sampled targets are in text this diff does not touch and nothing in them cites the changed lines: 1.9, 2.7, 3.2, 4.3, 4.6, 4.10, 5.3, 5.4, 5.6, 7.1, 10.2, 11.2 and 11.5. They are outside an incremental re-review. A grep finds no locator that the README flags as unverified.

### Adversarial table

The changed statements and the dependent targets are recomputed this round; the other rows are carried forward from the b36567c report.

| Statement | Instances | Values on each side | Result; change |
|---|---|---|---|
| README:53 `card_GL_field` (changed line) | 𝔽₂, n = 0, 1, 2 | ∏ over the empty set = 1; 2−1 = 1; (4−1)(4−2) = 6. The Lean probe also gives 1, 1, 6. These equal the GL counts in the §1.4 Check | agrees; none |
| README:53 Artinian radical facts (changed line) | 𝔽₂[t]/t²; M₂(𝔽₂) | J = (t) with J² = 0, so J is nilpotent and the ring is not semisimple. J(M₂(𝔽₂)) = ⊥, so M₂(𝔽₂) is semisimple. M₂(𝔽₂) is noncommutative, and the pinned `[Ring R]` hypothesis admits it, as the endomorphism algebras of §1.3 need | agrees; none |
| README:55 `Indecomposable` (changed line) | 0; O; O ⊕ O on P¹/𝔽₂ | 0 fails, because `IsZero` holds. O holds, because End = 𝔽₂ is local. O ⊕ O fails: O ⊕ O ≅ O ⊞ O and neither summand is zero | agrees; none |
| README:55 skeleton count (changed line) | `absIndecCount` on P¹, r = 1, every d | One class, O(d), so the count is 1. Counting objects instead of isomorphism classes would not give a finite value | agrees; none |
| README:61 rank-one degree (changed line) | Lean probe; O(1) on P¹ | `simp` closes `bundleDegree = eulerDegree ∘ inverse`. O(1): 2 − 1·1 = 1 = 2 − 1 | agrees; none |
| README:63 arm and leg (changed line) | λ = (2) and (1,1) at cell (0,0); out-of-diagram cell (0,2) in (2) | Arm and leg are 1, 0 and 0, 1, as in the Lean probe. At (0,2): arm 2−2−1 = 0 and leg 0−0−1 = 0, both junk ℕ values, which is why the README requires membership | agrees; none |
| §1.2 (depends on README:53) | 0, L, L², and length-two torsion N = k[t]/t² at a rational point of P¹/𝔽₂ | Summand counts 0, 1, 2. End(L)/rad = 𝔽₂. End(L²) = M₂(𝔽₂) is not local, since diag(1,0) is a nontrivial idempotent. End(N) = {0, 1, t, 1+t}: 1 and 1+t are units, 0 and t are nilpotent | agrees; none |
| §1.4 and `nilpotent_matrix_count` (depends on README:53) | 𝔽₂ with n = 0, 1, 2; 𝔽₃ with n = 2 | 1, 1, 4, 9 against 2⁰, 2⁰, 2², 3². For 𝔽₂, n = 2: trace 0 and a² = bc gives 3 + 1 = 4. For 𝔽₃, n = 2: bc = −a² gives 5 + 2 + 2 = 9. At n = 0, ℕ subtraction gives 0·0 = 0, so the count is 1, the empty matrix | agrees; none |
| §1.7 orbit count (b36567c report) | one e = 2 orbit over 𝔽₂ | l = 1: 0. l = 2: 2 | agrees; none |
| §2.6 grading functor (b36567c report) | Jordan block θe₂ = e₁ | H₁ = 0, H₂ = H, α = (0,1) | agrees; none |
| §2.7 fibre mass (b36567c report) | α = (0,[O]); one-step [O] over 𝔽₃ | 2^{g−1}. Homotopy fibre gives 1; S16's literal fibre gives 1/2 | README right; source issue recorded at b36567c |
| §4.1 factorization (b36567c report) | O ⊕ κ(x) on P¹/𝔽₂ | Both sides z; without the substitution, vz | agrees; none |
| §4.2 Hecke (b36567c report) | r = 0, 1, 2 at q = 2 | 1; ζ(2^{−1/2}z/w); ζ(z/2w)ζ(z/w) | agrees; none |
| §4.9 counts (b36567c report) | P¹/𝔽₂, class (1,1) | [Tz](N/N₀) = 1 = P(1)/(q−1) | agrees; none |
| §4.10 density (b36567c report) | g = 0: q − 3 on 3^m | 0, 2/3, 8/9 → 1 | agrees; none |
| §5.4 separation (b36567c report) | 1/(1−z) at 0 and at ∞ | Each expansion times (1−z) is 1. The converse fails (δ(z)); the README states one direction only | agrees; none |
| §5.6 block residues (b36567c report) | r = (1); r = (2), g = 2 | a = 0; a(2) = −1/2 | agrees; none |
| §5.8 arm product (b36567c report) | λ = (2), (1,1), (2,1), (3), (2,2) | Exponents q⁻¹z; 0; q⁻²z; q⁻¹(z+z²); q⁻²(q+1)z, matching the ζ-products | agrees; none |
| §6.4 rank two (b36567c report) | (−1,−2) at q = 2; (1/2, 6) at q = 3 | Bracket 1, count 6; bracket 1, count −5/2 | agrees; none |
| §6.5 origin (b36567c report) | §6.4 at α = q = 0 | A_{g,2,d}(0) = g | agrees; none |
| §6.6 table (b36567c report) | g = 1, 2, 3, r ≤ 4 | 1,1,1,1; 1,2,6,22; 1,3,15,95 | README right; source issue recorded at b36567c |
| §§8.2–8.3 (b36567c report) | y² + y = x³ over 𝔽₂ | Ω(1,d) = 6 = 2·3. Log gives 6 = q·A_E(2,0) | agrees; none |
| §§10.1 and 10.4 Mellit kernel (b36567c report) | g = 1, 2 at q = 2, 3 | H_{1,r}(1) = 6 for r = 1, 2, 3; H_{2,2}(1) = −64 = §6.4 | agrees; none |
| §10.3 integrality (b36567c report) | M18 Cor 7.2 at n = 0 | Z[z,q,α^±] ⊂ the README's ring | agrees; none |
| §11.6(ii) (b36567c report) | g = 2, r = 2, d = 1 | A W-invariant monic of degree 10 is impossible | README right; source issue recorded at b36567c |
| `absIndecCount_eq_of_degree` (b36567c report) | r = 0; P¹ with r = 1, 2; E/𝔽₂ with r = 1, 2 | 0 = 0; 1 = 1 and 0 = 0; 3 = 3 and 3 = 3 | agrees; none |
| `bundleDegree` (b36567c report) | O(1) on P¹; O² in genus 2; O(1) ⊕ O(−1) | 1; 0 (the unweighted formula gives −1); 0 | agrees; none |

### Headline theorems

The changed lines do not affect the headline list.
- Stated in `Suggested.lean`: the Fine–Herstein count (§1.4, `nilpotent_matrix_count`) and degree independence (§10.4, `absIndecCount_eq_of_degree`).
- Named in the module docstring as not statable, each with its missing carrier: the partition residue formula, the coprime Higgs count, Higgs purity and the Poincaré polynomial, the nilpotent-cone formula, Mellit integrality, and the parabolic, slope-cut and constructible-Hall theorems.

The rank-one identification in README:61 is now also checked mechanically (the probe above).

### Citations, ownership and overlaps

- **Citations.** The changed lines cite only Mathlib and Tau Ceti declarations; no cross-roadmap section is added or changed. `roadmaps resolve` against main 9110a01 and the 466 open heads finds no unresolved citation and no unresolved Lean name.
- **Overlaps.** `scratch/overlaps.md`, computed at main 9110a01, lists no open pull request changing this roadmap, no dropped id and no id defined only in a revision.
- **Ownership.** The changed text claims no new object.

### Remark on untouched text (no change requested)

- §1.4's two locators cover different points. S16 Appendix A, p.356, is where the nilpotent count is used over residue fields. S16 Cor 2.5, p.309, is where it is attributed to FH58. Both are accurate.

## Not verifiable

- **FH58** (Theorem 1, p.499) is settled as uncertified and cited by locator. S16 Cor 2.5 (S16 line 645) restates the count, and the small cases are recomputed above.
- **M20 and HES81** are settled as uncertified, as recorded at b36567c. No changed passage cites them.
- No new text was needed, and `needs-references.toml` was not created.

## Source issues

- none
