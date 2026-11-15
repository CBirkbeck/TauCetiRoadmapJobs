# Review of MarketImpact (pull request #1655 at a418601)
Folder: `TauCetiRoadmap/FinancialMathematics/MarketImpact/`

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description reports 17 admitted theorems, the targeted build and its actual warnings; elaboration confirms 17 admissions.
- R02 — repaired: the description names coordinate identities and system estimates, explicitly excludes computation and experiments, and distinguishes the hard-cutoff price-slice model.
- R03 — repaired: the description identifies the April 1997, 35-page author preprint and its locators; it no longer identifies lecture-note pagination as the source.
- R04 — repaired: `TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:8`, 48 and 558 cite PDE §§6.4–6.9 or §§6.5–6.8; these match the F27 tags on main.
- R05 — repaired: `global_clearing` drops `hinfty`; `strikeSmoothedCall_gamma` drops `hζzero` and compact support. The first follows from the margin; the payoff integral only uses the bounded interval between zero and positive spot.

## Verified sound

| Statement | Instances tried | Computed values on both sides | Result; change |
| --- | --- | --- | --- |
| `global_clearing`; README §1.1 lower bound | H(x)=1/2−x, δ=1/2, y=3 | g(3/2)=3=y; g′=1/2+2x≥δ; g(3/2)=3≥δx=3/4 | Unique positive root; infinity hypothesis unnecessary. |
| `global_clearing` endpoint control | H(x)=−1/x, δ=1, y=1/2 | g(x)=x+1; g′=1; g(0+)=1≠0; prospective root −1/2 | Retained zero-limit hypothesis excludes this case. |
| `strikeSmoothedCall_gamma`, README §2.1 | ζ=1, −1, or K; x=2; also ζ=1, x=−1 | h(2)=2,−2,4/3; h″(2)=1,−1,2=ζ(2); h″(−1)=0≠1 | Noncompact signed densities work; positive-spot restriction matters. |
| Imported `dPlus` and `callPrice` replacing local definitions | (x,r,σ,K,τ)=(2,.03,.4,3,.7) | Old=new: d₊=−0.981477236; price=0.0500316955 | Both equalities also close by `rfl` for arbitrary inputs. |
| `callVega` | Same unequal parameters; also x=K=σ=τ=1,r=0 | New formula=pinned derivative: 0.412393369; symmetric case 0.352065327 | Argument order and normalization agree. |
| `callGamma` | Same unequal parameters; also x=K=σ=τ=1,r=0 | New formula=pinned second derivative: 0.368208365; symmetric case 0.352065327 | Argument order and denominator agree. |
| `callFitObjective` | Baseline call, K=σ=τ=1,r=0; trial volatilities 1 and 1.1 | J(1)=0; J(1.1)=0.00676848662; old and imported-price objectives coincide | Replacement preserves the objective. |
| `local_call_fit` baseline slice | ρ=0, K=σ=τ=1,r=0 | fit(0)=1; J′(1)=0; J″(1)=2∫vega²=1.194389358>0 | Baseline strict minimum retained; changed hypotheses definitionally equivalent. |
| `call_correction_equation`, dependent on gamma | K=σ=x=ε=1,r=0,τ=2; cutoff τ=1 | Finite-difference residual −0.0482661814; forcing −0.0482661763; cutoff integral 0 | Numerical residual agrees; exact cutoff has identical integral endpoints. |
| `call_fit_cutoff_limit`, dependent on gamma and vega | K=σ=ε=1,r=0; τ=1.002 | Numerator 0.0918881492; denominator 0.5971946789; slope 0.153866323; ratio at τ=1.002 is 0.153380242 | Positive slope and approach retained. |

The remaining rows stand as in the previous review, of `1f4eaab`.

- Source sample: 4 changed locator groups checked: §1.1 against sircar-papanicolaou lines 517–710; §2.1 against lines 1781–1836; §3.2 against lines 2123–2425; §4.1 against lines 2625–2712. The broader clearing and continuous-density conclusions follow from the stated derivative margin and bounded-interval integration, respectively.
- Pinned declarations: 7 changed supplier references opened—`dPlus`, `callPrice` at `TauCeti/Probability/Finance/BlackScholes/Basic.lean:175,232`; gamma/vega derivatives at `TauCeti/Probability/Finance/BlackScholes/Greeks.lean:136,181`; lognormal law, zero variance and moments at `TauCeti/Probability/Distributions/LogNormal/Basic.lean:106,121,370`. Mathlib's mean-value and strict-monotonicity results at `Mathlib/Analysis/Calculus/Deriv/MeanValue.lean:144,378` are inputs, not these headlines.
- Signatures and padding: 42 `#check @name` commands elaborated; changed signatures agree with the README, with no lost binder. Two replacement-formula equalities proved by `rfl`; none of the 3 changed theorems closed with `simp`, `rfl` or `infer_instance`.
- Citations: 4 roadmap suppliers re-resolved—FinancialMathematics M0.1–M0.4; PDE §§6.4–6.9; StochasticCalculus §§3.2–3.4, 5.1, 9.4; StandardDistributions Layers 2–3. Dependency output: `depcheck: 244 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Gate and Lean: the worker's head-specific gate passes every check, including build. Direct elaboration exits 0 with 17 `sorry` warnings only; targeted build exits 0, additionally reporting Mathlib's module-system notice. The standalone gate reports `NOT IN ORDER: MarketImpact` and `outside-folder: TauCetiRoadmap/FinancialMathematics/README.md`: the supplied candidate-order check resolves the former, and the brief explicitly permits the latter.
- PR text and scope: title, summary and prose match this new folder, 42 declarations and 17 admissions. Against the merge base, only the 2 roadmap files and 2 sentences in the authorized family README change; no pins or other files change. Object searches found no competing owner for the changed clearing, strike-mixture or fitting targets.

Overlap check: read FinancialMathematics, StochasticCalculus, DysonBrownianMotion and PDE; baseline markets belong to FinancialMathematics, stochastic integration to StochasticCalculus, scalar parabolic estimates to PDE, and feedback clearing/fitting to MarketImpact; DysonBrownianMotion excludes finance models.

Source independence: changed passages only; 9 passages compared with 1 article and 3 pinned Tau Ceti modules, with no copied expression or reused source material found. Largest share: sircar-papanicolaou, all 21 inline named-source citations. No layer was added, removed or reordered, so the arrangement comparison stands from the previous review.

## Not verifiable

- The description's preparation history and use of Luna transcripts cannot be verified from the repository.

## Source issues

- **Error** in sircar-papanicolaou at §2.3, p.8, line 611: the source says strict monotonicity makes the price derivative nonzero; it should require a nonzero derivative separately, since a strictly increasing cubic has zero derivative at its center; affects the proof.
- **Misprint** in sircar-papanicolaou at §2.7.2, p.15, line 1811: the source assigns a discounted-strike zero-spot value to a call; it should assign zero to a call and the discounted strike to a put; affects a stated result.

## For the human reviewers

- **Scope.** Every source locator is to Sircar–Papanicolaou's article, read as the April 1997 author preprint (`TauCetiRoadmap/FinancialMathematics/MarketImpact/README.md:611`); the journal version's numbering was not compared.
- **Licence.** The PR description still names existing Luna Markdown transcripts as preparation material; their provenance and licence are not established by the repository. The head cites the author-hosted preprint.

