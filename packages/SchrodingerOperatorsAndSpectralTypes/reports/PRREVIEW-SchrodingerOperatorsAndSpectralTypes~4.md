# Review of SchrodingerOperatorsAndSpectralTypes (pull request #2424 at 9ffa805)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 14 lines changed since `02dfa40`: the two README repairs (the finiteness parenthesis in the route of 1.6 and the cusp-decomposition pointer in the Hide–Magee worked example) are correct and introduce no new problem, and the title and description agree with this head. There are no findings and no small corrections; one format note is carried over, not blocking. The acceptance remains conditional on the two declared supplier gaps, and the questions for the human reviewers are unchanged.

## N01 — Six lines of `Suggested.lean` exceed 100 characters

Lines 63, 85, 254, 281, 360 and 421 (three of them the instance binders `[IsContinuousRiemannianBundle …] [IsRiemannianManifold I M] [CompleteSpace M] …` at 160 characters); `laplacian_add_potential_isSelfAdjoint_closure` already breaks the same binders across two lines. The Lean file did not change since the previous review.

## Previous findings

The previous review (of `02dfa40`) had no finding (no R-numbered remark); its three small corrections and one format note are accounted for here.

- C01 — repaired: the description now says "thirteen headline theorems", states the equality of section 3.11 with its hypotheses, and names QuantumFoundations as the one open supplier.
- C02 — repaired: "by 3.11, once `X` is presented as a compact set together with finitely many standard cusp ends (the thick–thin decomposition named under Downstream consumers; Layer 3, Examples, gives it for congruence quotients)" (README line 1679–1682).
- C03 — repaired: "(always for `λ < inf σ_ess(A)` when `A` is bounded below, by UO-C02 and the compactness argument of the next paragraph)" (README line 432–433).
- N01 — not repaired: the six long lines of `Suggested.lean` stand; written again above as a format note.

## Verified sound

| Target | Instances tried | Statement side (computed) | Other side (computed) | Result |
|---|---|---|---|---|
| 1.6 route, finiteness of `ran P_A((−∞, λ))` (changed) | `diag(1,3,5)`, `λ = 4`; `diag(1 − 1/n)`, `λ = 0.9` and `λ = 1`; `−diag(n)`, `λ = 0` | `d = 2`, obstacles `e₁, e₂` leave `e₃`, form `5 ≥ 4`, `μ₃ = 5`; `d = 9` at `0.9` | `λ = 1 = inf σ_ess`: infinite, excluded by `<`; `−diag(n)`: `σ_ess = ∅`, dimension `∞`, excluded by "bounded below" | holds with the added clause |
| 1.6 `minMax_principle` (cited by the changed text) | `diag(1,3,5)`, `c = 4`; `ℋ = 0` | `#{n : μ_{n+1} < 4} = 2` (values `1, 3, 5, ⊤`); all `⊤`, count `0` | finrank of `ker(A−1) ⊕ ker(A−3)` is `2`; `0`; hypothesis `hγ` present in the signature | holds; teschl line 5044–5055, 5063–5069 |
| Worked example, Hide–Magee (changed) | degree-`n` cover over one cusp end of width `w`; `ε > 0`, `c = 1/4 − ε` | preimage: components of degrees `k_j`, `Σ k_j = n`, widths `k_j w`, at most `n` per cusp; complement compact (finite cover) | 3.11 gives finitely many eigenvalues below each `c < 1/4`; Downstream consumers lists the thick–thin decomposition as an outside input | true; pointer now matches; hm23 line 60–66, 104–105 |

The rows for the untouched statements stand as in the previous review, of `02dfa40`.

- Incremental re-review of 14 changed lines (README only; `Suggested.lean` and `metadata.toml` unchanged); nothing changed outside the folder.
- Source locators checked against the cached text for the changed passages: 4 line ranges in 2 sources (teschl line 5044–5055, 5056–5057, 5063–5069, printed p. 119; hm23 line 60–66 and 104–105, with line 44–47 for the finiteness below `1/4`).
- Cross-roadmap citations resolved for the changed passages: UnboundedOperators §3.2 (UO-C02) on main; the Downstream consumers paragraph and Layer 3 Examples of this README, which the new pointer names, say what the pointer attributes to them (README lines 1659–1671, 1412–1426).
- The pull request's text against the head: 13 theorems and 7 definitions in `Suggested.lean` (description: thirteen headline theorems); the docstring names three clauses as not statable (§3.6 form domain, §4.2 form domain, §3.8 identification), as the description says; the hypotheses of 3.11 quoted in the description are those of README line 38–40 and of `essentialSpectrum_eq_Ici_quarter`; of the roadmaps the README cites, QuantumFoundations and MaassForms are the only ones not on main; no roadmap on main or at an open head cites this one. No sentence contradicted, no change left unstated.
- Declared gaps `weyl-criterion` and `spectral-integral-resolvent`: untouched by the change; the acceptance stays conditional on them.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. The one-tactic probe and the `#check` comparison were not repeated: no Lean statement changed since `02dfa40`.

Overlap check: read UnboundedOperators, SelfAdjointSpectralTheory, VariationalMethods (main), QuantumFoundations (open); the changed passages add no object; shared objects and owners as before: essential spectrum, UnboundedOperators UO-C02; type subspaces, UO-C03; free Laplacian, QuantumFoundations §8.2; compact-pair min–max, VariationalMethods 4.4 (different object). No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 2 passages compared with 2 sources (teschl, hm23), none shared; largest share teschl, 38 of 97 locators; contents not compared again (the change adds, removes and reorders no layer; the previous review found the arrangement independent).

Research link: Layer 1 is the trace-class scattering theory of Kato 1957, Rosenblum 1957 and Pearson 1978; 3.6–3.11 state the operator and essential spectrum in which Hide–Magee 2023 (Theorem 1.1) and Lax–Phillips 1980 work; 4.4–4.5 are the operators of Karpeshina–Parnovski–Shterenberg 2026 (Theorem 1.1). Rests on the README's Worked examples and on hm23, lp80, kps26 as read.

## Not verifiable

- The 13 sources settled as uncertified (`strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `rs1`, `rs2`, `rs3`, `kato76`, `pearson78`, `cfks87`): locator only, as in the previous review; none is cited in a changed passage.
- The description's sentence on the number of review rounds before the port describes the process, not the head, and was not checked.

## Source issues

- **Gap** in teschl at Theorem 4.10, p. 119: the source says min–max holds for every self-adjoint `A`, listing the eigenvalues below the essential spectrum increasingly; it should assume `A` bounded below (for `−diag(n)` on `ℓ²` there is no least eigenvalue and every sup–inf is `−∞`); affects a stated result.
- **Error** in teschl at Theorem 6.4, (6.3), p. 135: the source says the lower bound of `A + B` is `γ − max(a|γ| + b, b/(a − 1))`, whose second term is negative for `a < 1`; it should be `b/(1 − a)`, as the estimate in the proof of Lemma 6.3 gives; affects a stated result.

## For the human reviewers

- Supplier still open: Layer 4 takes the free Hamiltonian from QuantumFoundations §8.2, which is another author's open pull request (#1771); it must merge first.
- Not tested: 13 sources settled as uncertified carry 28 of the 97 locators; their wording and their statements at the locators were not compared. The theorem of 3.6 beyond essential self-adjointness rests on `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09` and the README's own route.
- Licence: `teschl` was read from the author's online edition on the author's university page; `kps26` only as an OCR text of the arXiv version, whose numbering was not compared with the Annals version the README cites.
