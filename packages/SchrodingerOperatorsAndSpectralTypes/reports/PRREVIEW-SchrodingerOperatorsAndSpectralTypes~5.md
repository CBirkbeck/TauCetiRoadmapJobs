# Review of SchrodingerOperatorsAndSpectralTypes (pull request #2424 at df22383)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 24 lines changed since `9ffa805`, all in `Suggested.lean`: six over-long lines are wrapped and nothing else changes, so every statement is the one the previous review read, and the title and description still agree with the head. There are no findings, no small corrections and no format notes. The acceptance remains conditional on the two declared supplier gaps, and the questions for the human reviewers are unchanged.

## Previous findings

The previous review (of `9ffa805`) had no finding (no R-numbered remark) and no small correction; its one format note is accounted for here.

- N01 — repaired: no line of `Suggested.lean` exceeds 100 characters; the instance binders of the three manifold theorems now break after `[IsRiemannianManifold I M]`, and `open scoped TauCeti` stands on its own line.

## Verified sound

| Target | Instances tried | Statement side (computed) | Other side (computed) | Result |
|---|---|---|---|---|
| 1.2 `diag_spectralType_components` (docstring rewrapped) | `ℂ²`, `P = δ₀e₁e₁* + δ₁e₂e₂*`, `f = e₁ + e₂`; `L²[0,1] ⊕ ℂ`, multiplication by `x` and eigenvalue `2`, `f = (1, 1)`; `f = 0` | `μ_f = δ₀ + δ₁`, `rnDeriv = 0` a.e., ac part `0`; `μ_f = Leb|[0,1] + δ₂`, ac part density `1_[0,1]`; all `0` | `f_ac = 0`, `μ_{f_pp} = μ_f` restricted to atoms `{0,1}`; `μ_{f_ac} = Leb|[0,1]`, `μ_{f_pp} = δ₂`, atoms `{2}`, `μ_{f_sc} = 0`; `0 = 0` | holds; statement unchanged |
| 4.4 `schrodinger_isSelfAdjoint_closure` (one conjunct rewrapped) | `V = 0`, `d = 1`; `V = c ≠ 0` constant; `d = 0` | `ess inf V = 0`, form `‖u′‖² ≥ 0`, `σ_ess = [0, ∞)`; bound `c‖u‖²`, decay hypothesis fails for `ε < |c|`, no claim | `−Δ` on `H²(ℝ)`: spectrum `[0, ∞)`; `σ_ess(−Δ + c) = [c, ∞)`, not asserted; `d = 0` excluded by `hd : 0 < d` | holds; statement unchanged |
| 3.6, 3.7, 3.10 `gaffney_isSelfAdjoint_closure`, `exists_mem_domain_closure_eq_zero_iff`, `Ici_quarter_subset_essentialSpectrum` (binders rewrapped) | the binder list before and after | 11 instance binders each, in the same order: `[IsContinuousRiemannianBundle …] [IsRiemannianManifold I M] [CompleteSpace M] [SecondCountableTopology M] [MeasurableSpace M] [BorelSpace M]` | at `9ffa805`: the same 11 binders on two lines of up to 160 characters | identical after collapsing whitespace |

The rows for the untouched statements stand as in the previous review, of `9ffa805`.

- Incremental re-review of 24 changed lines (`Suggested.lean` only; `README.md` and `metadata.toml` unchanged); nothing changed outside the folder.
- The Lean file at this head against the file at `9ffa805`, compared token by token after collapsing whitespace: the only difference is the second `open scoped` that carries `TauCeti` (the same namespaces opened, in the same order). No declaration, binder, hypothesis or conclusion differs: 13 theorems and 7 definitions, as before.
- Source locators: none in the changed lines beyond the rewrapped citation of Teschl (3.83)–(3.85) and Lemma 3.19, whose words are unchanged; the seeded sample falls in no changed passage.
- Cross-roadmap citations: the changed docstring names UnboundedOperators UO-C03, unchanged and on main; no open pull request changes this roadmap or drops an id it cites.
- The pull request's text against the head: "thirteen headline theorems" (13 in the file), the three clauses named as not statable, the suppliers and the folder's contents are as described; a rewrapping changes nothing the title or description states.
- Declared gaps `weyl-criterion` and `spectral-integral-resolvent`: untouched by the change; the acceptance stays conditional on them.
- Automatic checks: all passed on this head. Dependency check output: `depcheck: 131 roadmaps, 1464 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean` gives 13 `sorry` warnings and nothing else. The one-tactic probe and the `#check` comparison were not repeated: no Lean statement changed since `9ffa805`.

Overlap check: read UnboundedOperators, SelfAdjointSpectralTheory, VariationalMethods (main), QuantumFoundations (open); the change adds no object; shared objects and owners as before: essential spectrum, UnboundedOperators UO-C02; type subspaces, UO-C03; free Laplacian, QuantumFoundations §8.2; compact-pair min–max, VariationalMethods 4.4 (different object).

Source independence: changed passages only: 1 passage compared with 1 source (the rewrapped docstring of 1.2 against teschl at (3.83)–(3.85) and Lemma 3.19), none shared, wording unchanged since the previous review; largest share teschl, 38 of 97 locators; contents not compared again (the change adds, removes and reorders no layer).

Research link: Layer 1 is the trace-class scattering theory of Kato 1957, Rosenblum 1957 and Pearson 1978; 3.6–3.11 state the operator and essential spectrum in which Hide–Magee 2023 (Theorem 1.1) and Lax–Phillips 1980 work; 4.4–4.5 are the operators of Karpeshina–Parnovski–Shterenberg 2026 (Theorem 1.1). Rests on the README's Worked examples and on hm23, lp80, kps26 as read.

## Not verifiable

- The 13 sources settled as uncertified (`strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09`, `chavel84`, `iwaniec02`, `lp76`, `rs1`, `rs2`, `rs3`, `kato76`, `pearson78`, `cfks87`): locator only, as in the previous review; none is cited in a changed line other than by an unchanged citation.
- The description's sentence on the number of review rounds before the port describes the process, not the head, and was not checked.

## Source issues

- **Gap** in teschl at Theorem 4.10, p. 119: the source says min–max holds for every self-adjoint `A`, listing the eigenvalues below the essential spectrum increasingly; it should assume `A` bounded below (for `−diag(n)` on `ℓ²` there is no least eigenvalue and every sup–inf is `−∞`); affects a stated result.
- **Error** in teschl at Theorem 6.4, (6.3), p. 135: the source says the lower bound of `A + B` is `γ − max(a|γ| + b, b/(a − 1))`, whose second term is negative for `a < 1`; it should be `b/(1 − a)`, as the estimate in the proof of Lemma 6.3 gives; affects a stated result.

## For the human reviewers

- Supplier still open: Layer 4 takes the free Hamiltonian from QuantumFoundations §8.2, which is another author's open pull request (#1771); it must merge first.
- Not tested: 13 sources settled as uncertified carry 28 of the 97 locators; their wording and their statements at the locators were not compared. The theorem of 3.6 beyond essential self-adjointness rests on `strichartz83`, `chernoff73`, `gaffney54`, `grigoryan09` and the README's own route.
- Licence: `teschl` was read from the author's online edition on the author's university page; `kps26` only as an OCR text of the arXiv version, whose numbering was not compared with the Annals version the README cites.
