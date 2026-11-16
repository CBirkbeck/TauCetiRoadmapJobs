# FIX-RT-CompressibleEulerEquations~1: repair of red-team round 1 (passes a and b)

Files changed: `packages/CompressibleEulerEquations/README.md`,
`packages/CompressibleEulerEquations/Suggested.lean` (module docstring only),
`packages/CompressibleEulerEquations/sources.toml`. `design/plan.json` and `metadata.toml` are
unchanged: no supplier gap is needed.

The two reviews do not overlap: each of the eleven findings is settled in its own section.

## RT-CompressibleEulerEquations~1a/F01 (P2) — applied

Evidence: at SymmetricHyperbolicSystems' head, `LinearSystem.apply` uses pointwise `deriv` and `fderiv`
(junk value `0`). The witness `h ∈ H¹(ℝ²)`, unbounded on every open set, holds.

Change: §1.2 contract "These are the carrier of §5.1" → the structure and predicate are the carrier;
`apply` is classical, used only on `C¹` maps; in §§5.1, 5.3, 5.4, `LW` uses the `L²_Λ` time derivative
and weak `∂ᵢ`, agreeing with `apply` for `C¹` `W`. §5.1 says the same, and gains the witness as a Check.

## RT-CompressibleEulerEquations~1a/F02 (P2) — applied

Evidence: `TauCeti/Analysis/Sobolev/Mollification/Basic.lean:73,97` proves `D_v(u ⋆ ρ) = u′ ⋆ ρ` for every
smooth compactly supported `ρ`. With `Ω = ⊤`, that is every kernel of §4.4 and every `Λ`.

Change: "extension of these three statements" → two (contraction, convergence). `∂ᵢJ_ε = J_ε∂ᵢ` leaves
§4.4's "Prove" list and is consumed: a new Tau Ceti contract bullet, a Scope deferral, and the route and
*Needs:* cite the lemma. `lowerOrder_translate` and `iteratedGradient_translate` move to §4.1's *Needs:*.
The non-bump kernel Check now notes the lemma applies to it.

## RT-CompressibleEulerEquations~1a/F03 (P3) — applied

Evidence: LorentzianGeometry §7.3, first Check (at its head), states that `(t, x) ↦ (ct, x − vt)` is an
isometry onto `minkowskiForm`.

Change: the §3.1 bullet listed the frame among the things §7.3 "does not state" → the frame is cited to
LorentzianGeometry §7.3, first Check, with §6.1's `minkowskiForm E`; only the determinant `c` (giving
`det g = −c²`) is stated here. The Scope bullet and the §6.1 contract bullet now say the same.

## RT-CompressibleEulerEquations~1a/F04 (P3) — applied

Evidence: every EperonReallSbierski2019 passage below was read in the cached text. Lines 1232–1240 (Step
1 of the proof of Theorem 4.64) are added because they hold the construction itself.

Change: locators appended to the three §8.2 bullets. *Maximal common development*: lines 1141–1144,
1232–1240 and 1208–1210. *Compatibility*: line 1228 (Theorem 4.64), line 1330 (Remark 4.67), lines
1218–1223. *Maximal developments*: lines 1010–1012 (Remark 3.56, Zorn). `sources.toml` now lists Remark
4.67.

## RT-CompressibleEulerEquations~1b/F01 (P2) — applied

Evidence: §7.1's continuation needs values in a compact subset of `G`, and the Euler hypothesis bounds only
`(ρ, s)`. Along material curves `|Bv| ≤ C_L|∇(ρ, s)|`, so the velocity is bounded.

Change: after the local-existence route, §7.2 adds `sup|v(t)| ≤ sup|v(t₀)| + C_L∫‖∇(ρ, s)‖_∞`, with
`C_L = max_L(|∂_ρP| + |∂_sP|)/ρ`. The values then lie in the compact set
`{(ρ, v, s) : (ρ, s) ∈ L, |v| ≤ V} ⊆ G`, and §7.1 applies. *Needs:* adds the material curves of §1.3.

## RT-CompressibleEulerEquations~1b/F02 (P3) — applied

Evidence: §1.3 states entropy propagation only on slabs, and no bullet of §8 stated `s ≡ s₀` on a
development. The statement is true (route below).

Change: a new §8.1 bullet, *Entropy on developments*: extend the material curve backwards as far as
possible; `D = D⁺_D({t₀} × S)` forces it to reach `{t₀} × S`, so `s ≡ s₀`. Hence barotropic developments
are the constant-entropy full ones. §1.3 now reads "(on slabs, here; on developments, §8.1)", and the
`Suggested.lean` docstring names §8.1.

## RT-CompressibleEulerEquations~1b/F03 (P3) — applied

Evidence: public catalogue listings of Majda1984's contents, found through a web search, give §2.3 as
"Uniformly Local Sobolev Spaces", after §2.1 (local existence) and §2.2 (continuation principle). The
source is uncertified and its text was not read.

Change: in §5.2, §6.1 and §6.2, "Majda1984, Ch. 2, §2.3" → "Ch. 2, §2.1, the energy method, whose localised
form is proved here". §7.3 now cites "Majda1984, Ch. 2, §2.3, uniformly local Sobolev spaces".
`sources.toml`: `cited_for` gains "7.3".

## RT-CompressibleEulerEquations~1b/F04 (P3) — applied differently

Evidence: Kato1975 is paywalled. Appendix A of the open paper arXiv:2103.08919 (Minucci and Valiente Kroon)
calls Kato's quasilinear existence result the "main Theorem II", with Theorem IV giving sufficient
conditions. It is silent on Theorem I, so the reviewer's choice to keep Theorem I at §5.4 is unsupported.

Change: §§5.4, 7.1, 7.3 and 8.3 and the References entry now cite "Kato1975, Theorem II". §5.4 cites it for
the linear case (coefficients independent of the unknown). In `sources.toml`, `locator = "Theorem II"`,
and the `version_note` records the evidence.

## RT-CompressibleEulerEquations~1b/F05 (P3) — applied differently

Evidence: (1) ChristodoulouMiao2014 lines 864–872 and Christodoulou2019 lines 134–138 mention no symbol.
(2) BGP Theorem 3.2.11 (lines 3664–3670) is global. A local analogue exists: Corollary 3.2.3 at line 3365,
with Lemma 3.2.2 at line 3284.

Change: (1) as suggested: §3.1 says the identification is proved here, and cites CM 869–872 and
Christodoulou2019 134–138 only for the causal structure. (2) In place of the suggested global reading,
§6.1 cites Corollary 3.2.3 with Lemma 3.2.2 (local, on relatively compact causal domains). `sources.toml`
updated.

## RT-CompressibleEulerEquations~1b/F06 (P3) — applied differently

Evidence: no Check tested the continuity clause, and the reviewer's computations hold. Their last example
(`1` for `t > 0`, `0` at `t = 0`) fails both clauses, so it cannot show the clauses are independent.

Change: §4.1 gains a Check (`n = 1`, `Λ = 0`, `k = 0`, `w = 1_{[0,1]}`). Transport gives `2|t′ − t|`;
the escaping bump keeps norm `1` but is at distance `2` from its start for `0 < t < 1`. `U ≡ 1` replaces the last
example: it satisfies the continuity clause (differences `0`) and fails the finiteness clause (infinite
norm).

## RT-CompressibleEulerEquations~1b/F07 (P3) — applied

Evidence: the Lean statement fixes `K` before `T`. The README Check (Burgers, `T* ≈ 0.1166` at `λ = 10`,
values in `[−1, 0]`) shows that `T` depends on more than the size of the data.

Change: in the `Suggested.lean` module docstring, "existence on a time depending only on the size of the
data" → "…only on a bound for the `Hᵏ_Λ` norm of the data and a compact set of states containing their
values". No other place in the README or the Lean file made this claim.

## Checks run

- **Elaboration.** From `content`, `lake env lean packages/CompressibleEulerEquations/Suggested.lean`
  produced no errors and 15 warnings, all `declaration uses 'sorry'`, one per theorem at lines 256, 277,
  299, 334, 356, 390, 425, 440, 451, 464, 493, 506, 523, 542 and 559. The imported object file
  `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.olean` was present. No `set_option`, and the imports are
  unchanged.
- **Signatures.** I appended `#check @name` for all 37 declarations to a scratch copy of the file and
  elaborated it once. All 37 elaborated types match `scratch/signatures.md` word for word after
  whitespace normalisation. `[NeZero n]` appears in 14 theorems and `[DiscreteTopology Λ]` in 13, as
  before. No binder was lost, and no Lean statement changed (only the module docstring).
- **Dependency check**, verbatim: `depcheck: 250 roadmaps, 2363 edges, 0 problem(s)`. There is no UPWARD,
  CYCLE or `moved:` line.
- **Citation resolver** on the edited README: no cross-roadmap citation and no Lean name was found nowhere.
  The new `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right` and `…hasLineDerivAt_convolution_right`
  resolve at the pin.

## Adversarial pass on the changed and added statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `LW` with weak derivatives (§1.2 contract, §5.1) | witness `h` (`n = 2`, `A⁰ = A¹ = 1`); transport `f(x − at)` with `f` smooth; `W ≡ 0` | `apply W ≡ 0`, `LW = ∂₁h ≠ 0`; solution `h(x₁ − t, x₂)`; for smooth `f`, classical = weak (`−af′ + af′ = 0`); both `0` | sound, Check added |
| Agreement with `apply` for `C¹` `W` | `t ∈ (0, T)`; endpoints | difference quotients converge in `L²` and pointwise, so the limits agree a.e. in `x`; at `t = 0, T` the two-sided `deriv` may be junk, so the claim is made only for `t ∈ (0, T)` | sound |
| Pinned commutation for every kernel and `Λ` | `φ = (η(x−2)+η(x+2))/2`; `Λ = 2πℤ`, `u = cos x`; local integrability of `u ∈ L²_Λ` | smooth with compact support, so the lemma applies; `∂J_ε cos = −φ̂(ε) sin = J_ε(−sin)`; `∫_K|u|² ≤ #(Λ ∩ (K − K))·∫_F|u|²` | sound |
| Frame determinant (§3.1) | `n = 2`, `c = 2`, `v = (1, 0)` | Gram determinant `−4`; frame determinant `2`; `2²·(−1) = −4` | sound |
| Velocity bound (§7.2 route) | simple wave `p = ρ³/3`, `L = [1, 3/2]`; constant state; static entropy wave `P = e^sρ²` | `C_L = 3/2`, `sup|v(t₀)| = 1/2 ≥ actual sup v = 1/2`; `∇ = 0` gives the bound `|v₀|`, which is exact; `∇P(ρ, s) = 0` but the bound is `C_L∫‖∇(ρ, s)‖ > 0 ≥ 0` (true, not sharp) | sound |
| Entropy on developments (§8.1) | counter-flow `D₁`; `S = ∅`; a backward end `a > t₀` with a limit in `D` | from `T_L`, `x(0) < −1 − t ≤ −1` and the curve stays in `T_L`; from `T_R ∩ {t < 1}`, `x(0) > 1 + t`; `D = ∅` is vacuous; Picard–Lindelöf continues the curve past `a` | sound |
| `C(I; Hᵏ_Λ)` Check (§4.1) | transport; escaping bump; `U ≡ 1` | `2|t′ − t|`; norm `1`, difference `2` for `t < 1`; differences `0`, norm `∞` | sound |
| Docstring `T(M, K)` | Burgers `u₀^λ = −e^{−λ²x²}`, `λ = 10` | `T* ≈ 0.1166`, `‖u″‖² = 3√(π/2)·10³ ≈ 3760` | sound |
| BGP locator (§6.1) | lines 3284–3291, 3365–3367 | Lemma 3.2.2 needs a small relatively compact causal domain with a Cauchy hypersurface; Corollary 3.2.3 gives `supp u ⊆ J_Ω(supp u₀ ∪ supp u₁)` | carries "linear analogue" |
| ERS locators (§8.2) | lines 1010–1012, 1141–1144, 1208–1210, 1218–1223, 1228, 1232–1240, 1330 | each passage read; each concerns quasilinear wave equations, as the bullets say | carries the claims |

## Ownership and suppliers

- **Siblings read.** LorentzianGeometry §§6.1, 7.3 and SymmetricHyperbolicSystems' `Suggested.lean` §1.2 were
  read at their open heads through `roadmaps show`. They are open roadmap pull requests that add new
  folders, consumed as before.
- **New supplier object.** The only new supplier object is a pinned Tau Ceti declaration. Nothing moved
  between roadmaps.
- **No new owned object.** The new §8.1 bullet and the §7.2 route step are statements about this
  roadmap's own developments and Euler continuation; no other roadmap owns them.

## Notes for the maintainer

- **Names.** No Lean name changed, and no id that other roadmaps cite was dropped.
- **SymmetricHyperbolicSystems.** Its `LinearSystem.apply` is the classical operator. This roadmap
  now says so, and uses the weak operator on Sobolev classes. That roadmap does not need to change.
- **Kato1975.** The theorem number rests on a second-hand open source (above). An operator who holds
  Kato1975 could confirm that Theorem II is the quasilinear theorem.
- **Majda1984.** The §2.3 title rests on public catalogue listings; its text was not read.
- **Suspicious text.** None found in the reviews or the fetched pages.
