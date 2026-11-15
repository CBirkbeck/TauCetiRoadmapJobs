# Review of CyclicHomologyLieHomologyAndQuasiFreeAlgebras (pull request #2037 at 1a9242b)

**Verdict:** accepted

No findings. The folder is byte-identical to `90d8ff4`; the head differs from it only by the merge of main. The title and description agree with this head.

## Previous findings

- none: the review of `90d8ff4` raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.6 and the supplier contract ↔ AlgebraicKTheory §3.4 (on main since the merge) | `J = εℤ` (zero product); unital `A`; `i = 0, 1` | `J⁺ ≅ ℤ[ε]/(ε²)`, reduced `K₀ = 0` (nilpotent kernel), as 5.6's Check; `J⁺ ≅ ℤ × A` gives `K₀(A)`; §3.4 covers `i = 0, 1`, as line 89 says | holds | — |
| Scope lines 98–102 and 1015–1016 ↔ NoncommutativeGeometry N1.Cyclic (rewritten on main) | `R = ℂ`; `R = ℂ[x]`, `n = 1` | `R̄ = 0`, so `Ω^(≥1) = 0` in 4.3 and in N1; `Ω¹ = ℂ[x] ⊗ ℂ[x]/ℂ` in both; N1 Conventions assume no H-unitality; "excision" occurs 0 times | holds | — |
| Scope lines 54–58 and 5.4 ↔ SR.1.3 (on main since the merge) | `H = ⊕_ℕ ℤ`, `M = H/⊕_(n≥1) ℤ` | `e₀ m̄ = m̄`, `HM = M`; `H ⊗_H M → M` bijective, inverse `m ↦ e₀ ⊗ m`: SR's case of 5.4's local-units bullet; SR cites nothing here | holds | — |
| Description: 4.2 non-examples `ℤ/2` over `ℤ`, `ℚ⟦x⟧` | `ℤ/4 → ℤ/2`; closed point of `ℚ⟦x⟧` | `ℤ/2 ⊗_ℤ ℤ/2 = ℤ/2`; kernel `{0, 2}`, `2·2 = 0`; a lift has `g(1 + 1) = 2 ≠ 0`; `m/m² = ℚ`, rank 1 against generic rank `2^ℵ₀` | holds, as README 4.2 | — |
| Description: 4.1 `isQuasiFree_iff_hasProjectiveDimensionLE_one` | `A = 0`, `K`, `K[ε]` | `A = 0`: `S = 0`, `1·1 ∈ ker` forces `R = 0`, both sides true; `K`: pd 0, separable; `K[ε]`: `(t + ct²)² = t² ≠ 0`, pd `∞` | holds | — |
| Description: 2.2, commutant identified with the range | `r = p = 2`, swap, `x = E₁₂` | swap permutes the summands of `glAction x`; on `e₂ ⊗ e₂` both orders give `e₁ ⊗ e₂ + e₂ ⊗ e₁`; the headline gives the other inclusion | holds | — |
| Description: `H₂(𝔰𝔩(A)) ≅ HC₁(A)` over every field | `A = 𝔽_p[x]` | `d(Σ a_m xᵐ)` has `x^(p−1)dx`-coefficient `p a_p = 0`, so `[x^(p−1)dx] ≠ 0`; README 2.5 states `A` free over any `k` | holds; description narrower, not contradicted | — |

The rows for every other statement stand as in the previous review, of `90d8ff4`.

- Change: `git diff 90d8ff4 HEAD` on the folder is empty, as is `git diff --stat origin/main...HEAD` outside it. The other files listed in `changes.md` come from the merge of main. `lake-manifest.json` is unchanged, so the pins are the same. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- Gate: the worker's gate passes every check, `build=0`. My run has every scanner at 0 and one line against the public order, `depcheck: NOT IN ORDER: CyclicHomologyLieHomologyAndQuasiFreeAlgebras (insert it after its last supplier)`, which is not a finding. The candidate order lists the roadmap at line 340, after RefinedTraceMethods at 339. Depcheck (`--movable`, candidate order, `--pr 2037`): `depcheck: 246 roadmaps, 2245 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives no error and five `declaration uses 'sorry'` warnings, at lines 80, 106, 119, 130 and 135. The seven elaborated types in `signatures.md` match README 2.2, 4.1 and 4.2. Its eighth entry, `on`, is the scanner reading "structure on" in the docstring (line 42), not a declaration.
- Citations re-resolved after the merge (17 ids):
  - On main: AlgebraicKTheory §3.4 (line 431); NoncommutativeGeometry N1.Cyclic (lines 582–615) and its Conventions (158–159); SmoothRepresentationsOfLocalGroups SR.1.3 (lines 1299–1312) and its scope (78–84); TopologicalKTheory T3 item 2.
  - Open heads: RefinedTraceMethods §§1.1, 1.2, 1.4, 1.6, 4.9 and 4.18; KTheoryFiniteLocalFields §4.0; GeneralAlgebraicKTheory §§8.3 and 8.10; ArithmeticLocallySymmetricSpaces ALS.F.5.
  - Also resolved: PerfectoidSpaces P0.4 and LieGroupoidsPoisson §G1.3.
  - Each says what the README attributes to it. The one lead in `citations.md` is declared at `Suggested.lean` line 106.
- Pull-request text: 41 claims checked against this head:
  - the title; the three files, and that nothing outside the folder changes; the summary of each of the five layers;
  - the six deferrals and six neighbours of the Scope; the five headlines, the two definitions and the import;
  - 8 Loday–Quillen locators; Connes Theorems 10–11; Quillen 1996 Theorem (2), p. 197; Wodzicki (2)–(4) and Corollary 4.5; Getzler Theorem 2.4 (2); González-Férez–Marín 2010 Definition 1 and Theorem 3; Böhm–Vercruysse 1.10, 1.12 and 1.13; Cortiñas Corollary 0.2; Kassel–Loday Corollaire 1.9; the seven review questions.
  - All agree.
- Overlap check: read RefinedTraceMethods, K2SymbolsBrauer and GeneralAlgebraicKTheory (open, closest in vocabulary) and NoncommutativeGeometry (main); the results-based list is empty.
  - Shared objects: `Λ`, `HC` and `HP` (owners RefinedTraceMethods §§1.1–1.4 and KTheoryFiniteLocalFields §4.0, cited); nonunital K-theory and absolute excision (owner GeneralAlgebraicKTheory §§8.3 and 8.10, cited); normalised forms of a unital complex algebra (owner NoncommutativeGeometry N1.Cyclic; 4.3 is the characteristic-zero variant and states the difference).
  - K2SymbolsBrauer shares nothing. A search of every roadmap for quasi-free algebras, H-unitality, the X-complex, the Fedosov product, Wodzicki excision, Loday–Quillen, firm modules, Morita contexts and `K₀′` finds no other owner.
- Source independence: changed passages only. 0 passages changed and none compared. Largest share: Loday–Quillen 1984, 15 of 68 locators. Contents were not compared again: no layer was added, removed or reordered.
- Remark on untouched text: 2.4 cites Milnor–Moore 1965 for the structure theorem without a theorem number.

## Not verifiable

- Marín 1998 and González-Férez–Marín 2007: paywalled (DOI prefix 10.1016) and no open copy found. The README names them only in Out of scope, with no locator.

## Source issues

- none

## For the human reviewers

- SmoothRepresentationsOfLocalGroups on main (README lines 81–83) assigns left xst rings and the abelian category of their firm modules to this roadmap's 5.4. This README's Out of scope (lines 112–116) excludes them. SR cites no section here.
