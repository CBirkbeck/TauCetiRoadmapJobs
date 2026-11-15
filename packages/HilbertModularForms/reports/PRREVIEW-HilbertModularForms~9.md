# Review of HilbertModularForms (pull request #1724 at 02ea152)

**Verdict:** accepted

Incremental re-review of 32 changed lines since eda7e59. The one previous finding is repaired, the repair introduces no new problem, and the gate passes. No findings.

## Previous findings

- R01 — repaired: `README.md:2290`–`2301` fixes `p`, `ι : ℚ̄_p ≅ ℂ`, `T` the places above `p`, `Σ_v`, the weight `(n, s) = (k − 2, m)` and "R17.3.8a's algebraic, not normalized, determinant convention"; `:2326`–`2336` add the two Checks; `:2347` reads `M_{k−2,m}(U; ℂ)`.

## Verified sound

| Statement | Instances tried | Values computed on each side; result | Change |
| --- | --- | --- | --- |
| §10.2 quaternionic weight `(k − 2, m)` | General `k`; `ℚ(√5)`, `k=(2,4)`; parallel weight 2 | `(k_w−2)+2m_w = k₀−2` at every `w`. `(2,4)`: `k₀=4`, `m=(1,0)`, `n+2s=(2,2)`, as `README.md:434`. Weight 2: `n=s=0`, functions on `Cl(U)` (R17.3.8c Check). | None |
| §10.2 bijection real places ↔ pairs `(v, σ)` | `p=11` in `ℚ(√5)` (split); `p` inert | `F⊗ℚ_p=∏F_v`, so `Hom(F,ℚ̄_p)=⊔_v Hom(F_v,ℚ̄_p)`: split gives 1+1, inert 2; both total `n=2`. `⊔Σ_v=Hom(F,ℂ)`, the hypothesis of R17.3.8c's definite case. | None |
| §10.2 comparison with Dembélé–Voight (7.3) | `Φq(X,Y)=q(Y,−X)`, general `γ=(a b; c d)` | Source action: `q(dx−cy, −bx+ay)·det^m`. `Φ(q·γ)=q(cX+dY, −(aX+bY))=(Φq)(aX+bY, cX+dY)`: R17.3.8a's slash with `s=m`. Degrees `w=k−2`, twists `m`. Scalars: `u^{w+2m}` both sides. | None |
| §10.2 Check, unit `u=(3+√5)/2` | `s=m=(1,0)`; `s=0` | `u=((1+√5)/2)²`, `N(u)=1`; R17.3.8a (Global units) gives `N(u)²=1`. `s=0`: `((3−√5)/2)²=0.38197²=0.1459≠1`, not a root of unity, invariants zero at every compact open level. | None |
| §10.2 Check, `S_v` at `p=11` | Algebraic and normalized conventions | `5≡4² mod 11`: split. `(Sφ)(g)=φ(g·11_p⁻¹)∣11_p=φ(g)∣11_p`; scalar `u` acts by `u^{n+2s}`: `11^{2}·11^{2}=11⁴=121²=N(11)^{k₀−2}` (`README.md:1343`). Normalized: `ν_norm(11²)=1` at `w₁`, total `11²`. | None |
| §10.2 choice of the algebraic convention | Complex model against the model at `p` | `φ′(α)=φ(α)∣α_p` carries the archimedean-coefficient model to R17.3.8c's; Hecke operators at `v∣p` then carry `ι(x_t)` unnormalized. Normalized differs by `ν_alg(ϖ_v)^e` (R17.3.8a): `11²` above. | None |
| §10.3 `B_k(𝔭)` on `M_{k−2,m}(U; ℂ)` | Parallel weight 2; `k=(2,4)` | Weight 2: the space is the functions on `Cl(U)`, `B_k=B`. `(2,4)`: the space of §10.2, nonzero invariants possible since units act by `N(u)²=1`. | None |

The rows for every other statement stand as in the previous review, of `eda7e59`.

- Gate at 02ea152 (worker's run, with the merge-order candidate): OK, every check 0, `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check with the candidate order: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line. HilbertModularForms is line 188; GL2AutomorphicRepresentationsAndTransfer 104, HilbertModularVarietiesAndShimuraCurves 167.
- Elaboration: `lake env lean` on `Suggested.lean` exits with eleven `declaration uses sorry` warnings and nothing else. The diff changes no Lean statement, so the one-tactic probe and the `#check` comparison were not repeated.
- Cross-roadmap citations resolved at the open head of GL2AutomorphicRepresentationsAndTransfer: 4 (R17.3.8a: slash, scalars, global units, `ν_alg`/`ν_norm`; R17.3.8b: `Γ_i`, `Cl(U)`; R17.3.8c: `T`, `Σ_v`, `ι_{v,σ}`, definite case; R17.3.8d: `S_v=[Uϖ_vU]`).
- Source locators checked against the text: 2 (dembele-voight line 1740, equation (7.3) on printed page 35, with lines 1727–1739 for `k₀`, `m_i`, `w_i` and the action; line 2191, Example 8.1 on page 44, for the sampled §10.3).
- Seeded sample: only §10.3 falls in a changed passage; its changed sentence carries no source locator, and its Check's locator (Example 8.1, p. 44) stands.
- Pull request text: the description states neither the quaternionic weight nor the convention, so the change leaves it correct; 12 layers and 56 numbered sections at this head, Layer 10 suppliers as in `README.md:159`–`167`.
- Overlap check: read BianchiModularForms, HilbertModularSurfaces, SiegelModularForms, MaassForms, HalfIntegralWeightModularForms, ModularForms, LFunctions, GlobalNumberFields; the changed passages define no new object: the coefficient modules, classical quaternionic forms and their Hecke operators are owned by GL2AutomorphicRepresentationsAndTransfer R17.3.8a–R17.3.8d and are cited, not restated.

Source independence: 2 passages compared with 1 source (changed passages only: `README.md:2290`–`2296` and the Check at `:2326`–`2331` against dembele-voight lines 1725–1740), none shared; the arrangement was not compared again, no layer being added, removed or reordered.

## Not verifiable

- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests.
- The previous reports' list of texts that could not be read (Shimura 1978 §3, Freitag, Miyake, Doi–Naganuma, van der Geer, Garrett, Diamond–Shurman, Atkin–Li, Shimura 1971, Iwaniec–Kowalski, four LMFDB knowls) is unchanged.

## Source issues

- none

## For the human reviewers

- **Scope.** The README does not cite QuaternionicModularForms, and the description's `depends-on` and `merge-order` blocks no longer list it; the merge-order candidate (line 63) still places it before this roadmap.
