# Review of ThetaSeries (pull request #2725 at c969dbd)

**Verdict:** accepted

**Summary.** Accepted. This re-review covers the 114 lines changed since cf64845. The one earlier finding is repaired: §6.6 and the conductor docstring no longer claim that the level need not divide `D_L`. All five small corrections are repaired too, and I found no new defect. Dropping coprimality from reciprocity (§6.2, `gaussSum_eq_mul_dualGaussSum`) is correct: both sides agree at 40 non-coprime pairs on five even lattices. Two format notes remain and neither blocks: the locators are still coarse, and §6.2 has no Check at a non-coprime pair. For the humans, as before, none of the cited sources could be read legally, so wording and arrangement were not checked against any of them.

## N01 — Locators are still coarse or missing

Sections 1.2, 2.9, 7.1 and 7.6 still name no source. Every other locator is a whole chapter or appendix: Ebeling Ch. 3, Schoeneberg Ch. IX, Ogg Ch. VI, Iwaniec Ch. 10, Milnor–Husemoller App. 4. The exception is Turaev (1998), which §6.2 now cites at §1.3. A theorem or page number at each claim would let a reader check its hypotheses.

## N02 — §6.2 has no Check at a non-coprime pair, the case the new statement adds

All four Checks of §6.2 use coprime `a` and `c`. A Check like either of these would test the new case:

- `√2 ℤ²` at `a = c = 2`: `G = 4`, and the right side is `½ · i · (2 − 2i)² = 4`.
- `A₂` at `(3, 6)`: `G = −18 = 3² · G(1, 2)`, the `m^{2k}` scaling that reduces the general case to the coprime one.

## Previous findings

- R01 — repaired: §6.6 now reads "`|D_L|` need not divide `N` (for `D₄`, `|D_L| = 4` and `N = 2`), so `(D_L / ·)` is not a character modulo `N` until its conductor is known to divide `N`". The docstring of `conductor_kroneckerChar_dvd_level` is corrected the same way.
- C01 — repaired: *How to read the build* has a table mapping each lettered label `kX` to §k.n, and *Scope and ownership* gives each former Lean name its new place (`milgram` is §6.3, `discChar` is `nebentypus`, `thetaFormOfLevel` is §7.4).
- C02 — repaired: §1.2 now says "Poisson summation over `ℤⁿ` does not use them: Tau Ceti proves it in all dimensions at once … and no later layer of this roadmap rests on them."
- C03 — repaired: §6.2 reads "For positive integers `a` and `c`", and `gaussSum_eq_mul_dualGaussSum` no longer has the hypothesis `hac`. §6.5 keeps its coprimality hypothesis.
- C04 — repaired: the only target left in §5.3 is the product formula. The coefficient, nonvanishing and isometry facts are now described as Tau Ceti's statements read through `ZLattice.coe_thetaForm`.
- C05 — repaired: the description now says "eight individual Tau Ceti modules" and "the source at the claim wherever a source is cited".
- N01 — partly repaired: §6.2 now cites Turaev at §1.3. The other locators are unchanged (N01 above).

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §6.2 `gaussSum_eq_mul_dualGaussSum`, without coprimality | `√2ℤ²`, `A₂`, `[[2,1],[1,4]]`, `[[2,0],[0,6]]` at `(2,2),(2,4),(4,2),(3,6),(6,4),(4,6),(6,9)`; `D₄` at `(2,2),(2,4),(4,2),(3,3)` | `√2ℤ²(4,6)`: `−12 = −12`; `A₂(4,6)`: `−20.785i` both; `D₄(2,4)`: `−128 = −128`; all 40 pairs agree | true | N02 |
| §6.2 reduction to coprime pairs | `(ma, mc)` versus `(a, c)` | `√2ℤ²`: `G(2,2) = 4 = 2²·1`; `A₂`: `G(3,6) = −18 = 3²·(−2)` | true | none |
| §6.2 as a case of a tensor-product reciprocity (Turaev §1.3) | `ℤ` with form `(c)` tensored with `L` with form `a⟪·,·⟫` | dual of `ℤ` is `c⁻¹ℤ`, giving `L/cL`; dual of `L` is `a⁻¹L^∨`, giving `L^∨/aL`; the factors `c^{−n/2}` and `a^{−n/2}(det L)^{−1/2}` give `(c/a)^k` | consistent; locator unread | none |
| §6.6 remark that `|D_L|` need not divide `N` | `D₄`, `√2ℤ⁴`, `A₂`, `√2ℤ²` | `D₄`: `D = 4`, `N = 2`, `4 ∤ 2`; `√2ℤ⁴`: `16 ∤ 4`; `A₂`: `3 ∣ 3`; `√2ℤ²`: `4 ∣ 4` | true | none |
| §6.6 `conductor_kroneckerChar_dvd_level` (docstring changed) | `D₄`, `A₂`, `√2ℤ²` | `(4/·)` is principal mod 4, conductor `1 ∣ 2`; conductors `3 ∣ 3` and `4 ∣ 4` | true | none |
| §6.5, which cites §6.2 and keeps coprimality | `√2ℤ²` at `(1,4)`, `(3,4)`; at `(3,12)`, where `a` and `c` are not coprime | `8i = 8i`; `−8i = −8i`; `72i ≠ −24i` | true; hypothesis needed | none |
| §5.3 product formula | `E₈ ⊕ E₈`; constant terms | `q`-coefficient `240 + 240 = 480` = coefficient of `E₄²`; weight `4 + 4 = 8`; constant term `1·1 = r(0)` | true | none |
| §5.3 facts read through `coe_thetaForm` | the pinned declarations | coefficient `m` is `r_L(2m)` (`QExpansion.lean:152`); `thetaSeries_comap` for `e : F ≃ₗᵢ[ℝ] E`; `coe_thetaForm` holds by `rfl` | true | none |
| §1.2 commentary and Example | pin's route; `φ ⊗ ψ`; Gaussian | torus Fourier series, `PoissonSummation.lean` 35–47; `𝓕(φ⊗ψ)(m₁,m₂) = 𝓕φ(m₁)𝓕ψ(m₂)`; `exp(−π‖x‖²)` is self-dual | true | none |
| Lettered-label table | main's lettered items | 6, 8, 5, 4, 4, 6, 6, 5 per layer; 2C ↔ 2.3 covolume, 2H ↔ 2.8 Kronecker, 6D ↔ 6.4, 7C/7D ↔ 7.3/7.4 | true | none |
| Former Lean names | 18 names in main's `Suggested.lean`; the 23 cited by HalfIntegralWeightModularForms | each exists on main; each is placed in a row or the paragraph, or has the same short name in Tau Ceti | true | none |

The rows for the statements this diff leaves untouched (§§2.9, 3.4, 6.3, 7.1, 7.3–7.6, 8.6, `nebentypus`) stand as in the previous review, of `cf64845`.

- Source locators checked against the text: none. The one new locator, Turaev (1998) §1.3, has no legal copy: the publisher's page shows only the abstract, no arXiv version exists, and the sources service found nothing.
- Tau Ceti declarations opened at the pin:
  - `ZLattice.gaussSum` (`Algebra/Module/ZLattice/GaussSum.lean:176`) and `ZLattice.dualGaussSum` (`:449`);
  - `ZLattice.IsEven.qExpansion_thetaSeries_coeff` (`NumberTheory/ModularForms/ThetaSeries/QExpansion.lean:152`);
  - `ZLattice.thetaSeries_comap` (`…/ThetaSeries/Functoriality.lean:49`);
  - `ZLattice.thetaForm` and `ZLattice.coe_thetaForm` (`…/ThetaSeries/LevelOne.lean:122`, `:135`);
  - `ZLattice.representationNumber_zero` (`Algebra/Module/ZLattice/Shell.lean:157`);
  - the module docstring of `Analysis/Fourier/PoissonSummation.lean` and `SchwartzMap.tsum_eq_tsum_fourier_span_orthonormalBasis` (`:282`).
- Cross-roadmap citations resolved: the lettered labels used by SieveMethodsAndPrimePatterns and HypergeometricMotives (2H), LatticePackingsAndPerfectForms (7C–7D), SpecialFunctionsTheta (1A–1C, 1F) and CFSGBasicProperties (8D) on main. The former Lean names cited by LFunctions on main and by HalfIntegralWeightModularForms at its open head all resolve.
- Automatic checks: all passed on this head, rerun by me. Dependency check: `depcheck: 182 roadmaps, 2074 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the 10 `sorry` warnings. `#check @gaussSum_eq_mul_dualGaussSum` shows every needed binder present and no coprimality hypothesis. The one-tactic probe (`rfl`, `simp`, `simp` with the two definitions, `infer_instance`, `decide`) does not close it.
- Overlap check: read HalfIntegralWeightModularForms (its contract with this roadmap, at its open head), and IntegralLattices and LatticePackingsAndPerfectForms on main. The change moves no object between owners, so the shares stand as in the review of cf64845:
  - Milgram's formula at every signature belongs to Tau Ceti and IntegralLattices; its positive definite instance is §6.3 here.
  - The odd-rank theorem belongs to HalfIntegralWeightModularForms.
  - Siegel theta series belong to SiegelModularForms.

Source independence: changed passages only; 0 passages compared with 0 sources, since no cited source in the changed passages (Turaev 1998, Milnor–Husemoller, Serre, Ebeling) has a legal copy the service could read. No layer was added, removed or reordered, so the arrangement was not compared again. The largest share is Ebeling, *Lattices and Codes* (6 of 18 locators, as in the review of cf64845), and this change adds no locator to it.

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic consume Layer 7. This rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Turaev, "Reciprocity for Gauss sums on finite abelian groups" (1998), §1.3: only the abstract is public on the publisher's page; no arXiv version; the sources service found no legal copy.
- Milnor–Husemoller, *Symmetric Bilinear Forms* (1973), App. 4: Springer, paywalled.
- Serre, *A Course in Arithmetic* (1973), Ch. VII §6: Springer, paywalled.
- Ebeling, *Lattices and Codes* (2013), Ch. 3: Springer, paywalled; the table-of-contents page redirects to a login.
- Schoeneberg (1974), Miyake (1989), Conway–Sloane (1999): Springer, paywalled, as in the review of cf64845.
- Iwaniec (1997), Ogg (1969): no legal copy found by the sources service, as in the review of cf64845.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, the source with the largest share of the locators (6 of 18). Neither its text nor its table of contents could be read, and no other cited source was readable either, so wording and arrangement were not checked against any source.
