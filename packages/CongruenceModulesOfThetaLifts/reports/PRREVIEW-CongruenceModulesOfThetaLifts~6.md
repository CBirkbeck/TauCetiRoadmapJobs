# Review of CongruenceModulesOfThetaLifts (pull request #2921 at 72ec95e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 41 lines changed since `2d0d9be`, and the one finding of the previous review is repaired. The block characters of weight elimination (7.16) now carry the weights `h − bot_τ − (t − 1) + s` at `τ∘c`, which are those of the chain and of [FormalProof]. The small correction on 7.10c and the four format notes are repaired as well, and the repairs introduce no new problem. There is one format note, not blocking; the scope and licence questions about [FormalProof] remain for the human reviewers.

## N01 — The route of 7.11 quotes the base-level bound of [FormalProof] without a locator

The route of 7.11 (lines 1393–1397) gives the bound `D_0·C·x^ε·(B₀ + N_c)` as the one [FormalProof] states, and 7.10c now sends the reader there for the comparison of the two forms. The statement is the definition `DIVinN_at` in `Formalism/SharpRestriction/GlobalTheoremInputs.lean` (namespace `Formalism.MainNotions`): `etaSum L j ≤ D0·(C·x^eps·(B0 + Nc))`. Naming it in the route would let a reader check the form as 7.10c now does for its own.

## Previous findings

- R01 — repaired: 7.16 now reads "`χ_s` crystalline characters of Hodge–Tate weight `bot_τ + s` at `τ` and `h − bot_τ − (t − 1) + s` at `τ∘c`", with the remark that this is the shape `χ_s = χ_0·χ_cyc^{−s}` of 7.5 (1).
- C01 — repaired: 7.10c states that [FormalProof] has the further term `(log x)²·N_c` in the bracket and names `Formalism.MainNotions.TwistedPlaces.aux₃` with its file; the statement there agrees.
- N01 — repaired: the degree is written `[ℚ(ψ):ℚ]` throughout the route of 7.10c; `o` is only the order of `ℓ`.
- N02 — repaired: 7.15 now gives the reason "`Σ_{𝔭|ℓ} e_𝔭f_𝔭 = [𝕃:ℚ]` (Check (i) of 7.10c)".
- N03 — repaired: the Conventions read "The statements of this roadmap are those established by a complete formal proof", and a target in the roadmap's own form says so.
- N04 — repaired: 7.11 applies UniformWildKernelBounds §7.6 with `κ = max(1, C_t)` and `t ≤ x^{C_t} ≤ x^κ`.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.16 hypothesis on `χ_s` (headline 4) | `χ_s = χ_0·χ_cyc^{−s}`, `χ_cyc` of weight `−1`; `s = 0, t − 1`; block of `r` at `τ∘c` | README `h − bot_τ − (t−1) + s`; chain: `a + s`, `a = h − bot_τ − (t−1)`; set `{h−bot_τ−t+1, …, h−bot_τ} = h − {bot_τ, …, bot_τ+t−1}` | holds |
| 7.16 Check (ii) against the new hypothesis | `t = 1`, `s = 0`, `h = 57`, `bot_τ = 0` | new formula gives `57 − 0 − 0 + 0 = 57`; Check says required weight `57`, actual `39` | holds, Check unchanged |
| 7.16a (2) invoking 7.16 | residual shape "as in 7.16" at lifted points; 7.5 (1) `χ_c = χ_1χ_cyc^{−(c−1)}` | `s = c − 1`: weights increase by `1` in `s` at both embeddings, as the new hypothesis asks | holds |
| 7.10c, form of [FormalProof] | `aux₃`, `TwistedPlaces.lean` line 123 | README bracket `C·(f·m·b·L² + (log x)²·N_c) + V`; source `C*(f*m*b*large₂² + (log x)²*Nc) + Σ' vvTerm`, factor `dZ0 j` | holds |
| 7.10c route, `M_*` | `d = [ℚ(ψ):ℚ]`, `\|A\| ≤ 2^n·d` | `2^{n+2} ≥ 4\|A\|/d`, so `2^{n+2}/(4L_th) ≥ \|A\|/(d·L_th)`; with `d ≤ x^{ε/100}`: `M_* ≥ \|A\|x^{−ε/50}` | holds |
| 7.11, budget from §7.6 (headline 1) | `κ = max(1, C_t)`; `C_t < 1`; `t < ⌊x^κ⌋` | §7.6 asks `κ ≥ 1`, gives `V(E, ⌊x^κ⌋) ≤ exp(x^ε) = b`; `V` monotone in `t`, `b ≤ x^εB₀`: `κ_W = 1` | holds |
| 7.11 route, bound of [FormalProof] | `DIVinN_at`, `GlobalTheoremInputs.lean` line 59 | README `D_0·C·x^ε·(B₀ + N_c)`; source `D0*(C*x^eps*(B0 + Nc))` | holds; N01 |
| 7.15, sum over the places above `ℓ` | `ϱ(𝔭) = f_𝔭·log ℓ/[𝕃:ℚ]` | `Σ ϱ(𝔭)e_𝔭·v_ℓ(N) = v_ℓ(N)·(log ℓ/[𝕃:ℚ])·Σ e_𝔭f_𝔭 = v_ℓ(N)·log ℓ` | holds |

The rows for the untouched statements stand as in the previous review, of `2d0d9be`.

- Source locators checked against the text: 2 in [FormalProof] (the new locator of 7.10c, and the statement behind the route of 7.11); the sampled targets 7.10c, 7.11 and 7.16 fall in the changed passages and were read again.
- Supplier statements read at their open heads: UniformWildKernelBounds §7.6 (`κ, α ≥ 1`, `t = ⌊x^κ⌋`), ThetaChainsOnDefiniteUnitaryGroups §2.1 (`N_c`, `C_t`, `SizeT`).
- Dependency check: `depcheck: 170 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, no output (it declares nothing; the change there is to the docstring only, so there is no signature to compare and nothing for the one-tactic probe).
- Changes outside the folder since the previous head: none.
- Pull request text: nothing in the 41 lines changes what the title and description describe (no section, headline, declaration or supplier added or removed).
- Duplication and layers: the diff adds, removes or reorders no layer, section, target or supplier citation; its one new locator is that of 7.10c.

Overlap check: read GluedTargetAndDivisionInequality, SelmerLengthBoundsAndLocalLifting, ThetaChainsOnDefiniteUnitaryGroups, ThetaChainsAndFrobeniusPrimeSums, RowTowerAndRallisIdentities, LengthBoundsInPadicFamilies, AutomorphicGaloisRepresentationsPartII, AutomorphicGaloisRepresentations, EndoscopicTransferAndUnitaryTraceComparison (scopes as read in the previous review; the change touches no ownership); nothing shared.

Source independence: changed passages only: 5 passages compared with 1 source ([FormalProof], Lean code cited by path and declaration name), none shared; largest share [FormalProof], 95 of 96 locators; the diff adds, removes or reorders no layer, so the arrangement was not compared again (previous result: independent).

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the tradition of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the sources read.

## Not verifiable

- The proofs inside [FormalProof] were not traced: only the statements at the locators were compared. The sentence of 7.11 that the term `(log x)²·N_c` "is added only in its last step" was not checked.
- The items the previous review could not verify (the published works cited without locators, Check (ii) of 7.6, the size inequalities quoted from ThetaChainsOnDefiniteUnitaryGroups) are untouched and stand as there.

## Source issues

- none

## For the human reviewers

- **Scope.** 95 of the README's 96 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The licence of the public repository of [FormalProof] was not established here; the README cites file paths and declaration names only and reproduces no text of it.
