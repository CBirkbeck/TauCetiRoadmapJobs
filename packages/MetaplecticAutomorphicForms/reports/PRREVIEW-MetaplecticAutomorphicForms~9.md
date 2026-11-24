# Review of MetaplecticAutomorphicForms (pull request #3027 at a4d9b5d)

**Verdict:** accepted

**Summary.** A review of the change against `main`: 252 changed lines since `74a09b7`. I checked the repair of the previous round finding by finding, recomputed the normalisations of the ten added sections (1.5, 2.5a, 3.3d, 3.7a, 3.9a, 3.22a, 5.6a, 5.6b, 6.4a, 6.4b) and of the restated 6.13, and read the new locators into HKS96, KV78, Howe89a, Howe89b, Li89 and Kudla96 against the texts. Both earlier findings are repaired: 3.3d (a) now holds for any acting space, by a doubling argument that I checked, and the Check of 5.6b is true. No finding remains; there are one small correction and one format note, neither blocking, and nothing for a human to decide.

## C01 — Four of the new sections still cite a main source without a locator, and one page range starts a page late

A reader cannot check these statements against their sources. In 1.5 (line 363) Bargmann61 and Bargmann67 carry no section or equation, although they are the sources of (i)–(ii) and of (iv). In 3.9a (line 847) MVW87 is cited only as "type-I pairs over a `p`-adic field". In 6.4a (line 1736) Ichino07 has no theorem number, and it is the only source for the range `n<m≤2n`. In 6.4b (line 1756) Weil65 has no section, while 6.4a and the reference list give §§V–VI for the same work. Give each the theorem or section, as the other citations of these sections now do.

In 2.5a (line 525), KV78, II.1, (1.1) begins on p. 9, not p. 10 (KV78 line 409, the page headed 9); "pp. 9–11" would be right.

## N01 — In the first Check of 3.9a, (iii) for `n=0` is trivially true, not vacuous

For `n=0` the hypothesis of (ii) holds (the zero subspace is isotropic of dimension 0) and `U(V)=1`, so (iii) asserts a vector with `‖φ‖²>0`, which exists. "Holds trivially" would be the accurate word (line 851).

## Questions for the author

- 6.4a (line 1732) restricts the range `n<m≤2n` to `F` totally real, `E` totally imaginary and polynomial Fock data at the archimedean places, as "the setting of Ichino07". Does Ichino07 assume this? GQT, proof of Proposition 11.1 (ii), credits the convergent range to Ichino07 without such conditions. If it does not, the statement is narrower than its source. I could not read Ichino07 (Math. Z., no open copy).

## Previous findings

- R01 — repaired. The Check of 5.6b (line 1504) now reads "every irreducible admissible representation of `O(V_v)` is isomorphic to its contragredient (Kudla96, IV, Theorem 1.6 (i), p. 63 …), so replacing `π_v` by `π_v^∨` changes nothing there", restricted to finite places; Kudla96 line 2482 says this. The unitary contrast (`χ` of `E¹` with `χ²≠1`) is true.
- R02 — repaired. 3.3d (a) (line 677) no longer assumes `V` split; the route embeds `V` in the split `V⊕V⁻`, restricts to `U(V)×1` by (b) with the roles exchanged, and cancels the factor `⊗1`. I checked the step: `A_{V,W}(g)⊗1=(A_{V,W′}(g)⊗1)⊗(A_{V,W″}(g)⊗1)` gives `A_{V,W}=A_{V,W′}⊗A_{V,W″}`. HKS96 (a.22)–(a.24), p. 997, defines the non-split splitting by this doubling. 5.6a now cites "3.3d (a) and (b)". ThetaKernelsForUnitaryDualPairs §3.3b (its lines 40, 44 and 92) still describes 3.3d (a) as stated only for a split acting space; that sentence belongs to that folder's review.
- C01 (centre of `Mp(W)`) — repaired: "The kernel `{±1}` of `Mp(W)→Sp(W)` (2.4b)".
- C02 (hypothesis of 5.6b (ii)) — repaired: (ii) is unconditional and cites 3.7; the locator says Rallis84a states it with the duality as a hypothesis.
- C03 (missing locators) — partly repaired: KV78, Howe89a, Howe89b, Li89 and HKS96 now carry locators, all of which I found at the stated places; the rest is C01 above.
- C04 (homogeneous polynomials) — repaired in 2.5a (i) and in 3.7a.
- C05 (the description) — repaired as far as I could read it: the description now names the Fock model, the unitary theta correspondence, the two Siegel–Weil statements, Rallis's global Howe duality and the lift convention of 6.13.

## Verified sound

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| 1.5 `h_J`, Heisenberg law (sampled) | `h_J(Jx,y)`, `U_wU_{w′}` | `h_J(Jx,y)=i·h_J(x,y)`; ratio `exp(−π(h(w,w′)−h(w′,w))/2)=e(ω(w,w′)/2)`; 0.15 gives `ρ(ae)ρ(bf)=e(ab/2)ρ(ae+bf)` | holds |
| 1.5 Check 1 | `N=1`, `Je=f` | `∫e^{−2πu²}=2^{−1/2}`; kernel on vacuum `√2·2^{−1/2}e^{πz²/2}e^{−πz²/2}=1`; translation by `a` matches `U_a` exponent by exponent | holds |
| 1.5 (ii), Check 2 | `z^k`, `N=1` | `π∫s^ke^{−πs}ds=k!π^{−k}`; `‖z‖²=1/π` | holds |
| 1.5 (iv), Check 3 | `T=δ₀`; `T=∫f·` | `ϑ=K(0,·)=2^{1/4}e^{−πz²/2}`; `|ϑ|²e^{−π|z|²}=√2e^{−2πx²}`; `⟨f̄,𝔅⁻¹G⟩=⟨𝔅f̄,G⟩` | holds |
| 2.5a (i), Check 1 | `dω(J)` on `d/du`, `2πiu`, Gaussian | `[dω(J),D]=2πiu`; `[dω(J),2πiu]=−D`; eigenvalue `−i/2`; `J(e−if)=i(e−if)`; `z^ℓ↦e^{−i(ℓ+1/2)θ}z^ℓ` | holds |
| 2.5a covariance | `G∘k⁻¹` | `k·U_w·k⁻¹G(z)=G(z+kw)e^{−πh(z,kw)−…}=U_{kw}G(z)` | holds |
| 3.3d (a), arbitrary `V` | doubling `V⊕V⁻` | restriction to `U(V)×1` gives `A⊗1` on each of the three pairs; cancel `⊗1` | holds |
| 3.3d Checks | `W″=0` | `χ_{W′}χ_{W″}` restricts to `ω^{dim W}`; `η=χ_{W″}` trivial on `F×` | holds |
| 3.7a (iii) | `δ=−i/c` | `ω(x,ix)=2Re(iδ)h=(2/c)h`; `J=i` iff `ε=−1`; SchurWeyl §8.4 action `P(ᵗgXh)` gives `𝕊^λ⊗𝕊^λ` | holds |
| 3.7a Checks 2–3 | `n=d=1`; `n=1` | `(ts)^{−ℓ}` on `z^ℓ`, `(ts)^{ℓ}` on `z̄^ℓ`; `μ=(ℓ)`, `σ_μ=t^ℓ` | holds |
| 3.9a (ii) from (iii) | any admissible `π` | `g↦⟨ω(g)φ′,φ⟩` compactly supported (`g⁻¹x₀∈supp+L`); on the support coefficient `=vol·‖φ′‖²≥0` | holds |
| 3.22a (iii), Check 1 | `n=0`; `d−n` even | `q_E^{1/2}=q_F`; segment `q^{±(d−1)/2}` is the base-change parameter of the trivial representation | holds |
| 5.6a consequence | parabolics of `U(V)` | every proper parabolic lies in some `P_C`, `N_P⊃N_C` | holds |
| 5.6b (ii), Checks | 3.7 at every place; `O(V_v)` | `Hom≠0` with `ρ_v` irreducible gives `ρ_v≅θ(π_v)`; `τ≅τ^∨` at finite places | holds |
| 6.4a | `m=3,r=1,n=1`; `m=4,r=1,n=2`; `m=2,r=1,n=1` | `s₀=1>1/2`; `s₀=1=n/2`; `m−r=1=d(1)`, `1<2≤2`; constant `τ/[E:F]=1`, `c=1` | holds |
| 6.4b (a), (b) | split place; `m=n+1` exponents | stabiliser of `(a,ℓ)` is `GL(⋂ker ℓ_i)`, dimension `m−n`; convergence factors of `U(m)`, `U(m−n)` cancel; `τ(H^{x₀})/τ(H)=2/2` | holds |
| 6.13 | 5.6 | 5.6 integrates against `conj(f)`, so `f↦θ_φ(f̄)` is the linear lift | holds |

- Source locators checked against the text: 15 (HKS96 lines 2570–2572, 2654–2664, 2669; KV78 lines 409, 1277–1323, 1607, 1689, 1704; Howe89a lines 86–125, 263–299; Howe89b lines 622, 688, 873; Li89 lines 54, 405, 565; Kudla96 lines 88, 2482).
- Seeded sample: of its targets only 1.5 lies in the changed text; its KV78 and Howe89a locators hold and its statements are in the table. 1.1 (Kudla96 Theorem 1.1, line 88) holds. The other targets are untouched and unaffected.
- Library declarations opened at the pin: none new (the change adds no Lean declaration; `integral_gaussian` is cited as on `main`).
- Cross-roadmap citations resolved in the head: 9 (SchurWeyl §8.4; CompactGroups Layers 4–5; OrthogonalL2Bases Part D; AdelicAlgebraicGroups §2.6 *top-form-measure*; GeometryOfNumbersAndQuadraticArithmetic 2.7.6, 2.9.3a (b), 2a.4 (a); ArithmeticGaloisRepresentations §2.7 *Global inputs*).
- Record: no layer or item of the README at the merge base is removed or renumbered; the ten deleted lines are each replaced by a superset.
- Dependency check: `depcheck: 132 roadmaps, 1477 edges, 0 problem(s)`.
- Automatic checks: all pass. `Suggested.lean` is unchanged by the pull request and elaborates with four `sorry` warnings only. No file is changed outside the roadmap folders.
- Overlap check: read ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, GrossZagierAndArithmeticHeights; the orthogonal-sum compatibility (a) for a non-split acting space is now stated here (3.3d) and still called its own formulation in ThetaKernelsForUnitaryDualPairs §3.3b: this roadmap, the earlier and general one, is the owner; nothing else shared.

Source independence: 8 passages compared with 6 sources (HKS96, KV78, Howe89a, Howe89b, Li89, Kudla96), changed passages only, none shared beyond forced formulae; largest share BFH90, 94 of 297 locator lines; contents not compared, since the diff adds, removes or reorders no layer.

Research link: Layers 3–6 carry the local Howe duality of Gan–Takeda (2016) and the Siegel–Weil and Rallis inner product formulas of Gan–Qiu–Takeda (2014); the added sections are the unitary inputs (Harris–Kudla–Sweet 1996, Li 1989, Liu 2021, Wu 2013, Weil 1965) of arithmetic theta lifting. Rests on the README overview and the sources read.

## Not verifiable

- Kudla94 (3.3d (a), split case): Israel J. Math., paywalled; checked through HKS96 (a.5)–(a.6).
- Weil65 (6.4a, 6.4b) and Ichino07 (6.4a): paywalled; the statements were checked by computation only.
- Bargmann61, Bargmann67, MVW87, Li92, Mínguez08, Liu11, Rallis82, Braun41: not read; their statements were checked by computation, not against the texts.
- The description: the copy I was given is cut short, so I could not check whether it names RepresentationTheory/SchurWeyl §8.4 as a new supplier of this roadmap.

## Source issues

- none

## For the human reviewers

- none
