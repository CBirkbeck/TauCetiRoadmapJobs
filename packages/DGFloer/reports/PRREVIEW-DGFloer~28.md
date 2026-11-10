# Review of DGFloer (pull request #1798 at c3d8506)

**Verdict:** needs changes

This is an incremental re-review of the 138 lines changed since 334507b. The gate passes, `Suggested.lean` (untouched) elaborates with only its seven `sorry` warnings, and the dependency check reports no problem.

Of the six previous findings, the four in the README are repaired (R02, R03, R05, R06) and the repairs were checked at the pins and at the source lines. The two in the pull-request description are not repaired (previous R01 and R04): the description is unchanged. They are written again as R01 and R02. One repair introduced a small notation clash (R03).

| Id | Priority | Defect |
| --- | --- | --- |
| R01 | P2 | Layer 1 items 2–4 hand their ordinary targets to AlgebraicTopology stages that main does not have, yet the description says nothing must merge first (previous R01). |
| R02 | P3 | The order with the conflicting revision #963 is still not stated (previous R04). |
| R03 | P3 | The rewritten 7.5 writes `𝓛` for a local system, the letter the README uses for the free loop space. |

## R01 (P2) — Layer 1 items 2–4 hand their targets to AlgebraicTopology stages that only open revisions define, and the description says nothing must merge first (previous R01, not repaired)

**Location.**
- `TauCetiRoadmap/DGFloer/README.md:161–175`: "The ordinary targets of Layer 1 items 2–4 are AlgebraicTopology's, and a citation of one of them resolves there", mapping them to Stages 4.8, 5.0, 5.5, 8.8c and 8.8d.
- `:4486`: "AlgebraicTopology consumes nothing of Layer 1".
- The description's merge-order paragraph: "No open pull request must merge before this one".

**Claim.** The README describes the state after an AlgebraicTopology revision has merged. The description does not order that revision first.

**Witness.** Main (f8836c4), `TauCetiRoadmap/AlgebraicTopology/README.md`: no Stage 4.8, 5.0, 8.8c or 8.8d heading exists, and `:915` still reads "Consume DGFloer Layer 1 item 2's homotopy LES". The cited stages exist only at the open AlgebraicTopology revisions (#1797, #1807, #1808, #1854).

**Repair** (description only).
1. In the merge-order paragraph, place before this pull request the AlgebraicTopology revision that owns Stage 4.8, 5.0, the Serre sequences of 5.5, 8.8c and 8.8d. The description's body already names #1807 and #1808.
2. Add: "#1652 is rebased on that revision before it merges (its 4.8 renumbered, its 5.5 no longer consuming DGFloer Layer 1 item 2)."

**Test.** If this pull request merged alone, main's AlgebraicTopology 5.5 would cite DGFloer Layer 1 item 2 and DGFloer would send that citation back to AlgebraicTopology 5.5, leaving the Serre spectral sequence with no owner. With the stated order it has exactly one owner at every step.

## R02 (P3) — The order with the conflicting revision #963 is not stated (previous R04, not repaired)

**Location.** The pull-request description, which does not mention #963.

**Witness.** The overlap check on this head again reports that #963 and #1798 conflict in `README.md` and `Suggested.lean`. #963 owns `arbitraryCWSerreSpectralSequence` for every path-connected CW base; this head hands the same target to AlgebraicTopology Stage 5.5 (`:167–170`).

**Repair** (description only). Add: "#963 changes the same Layer 1 targets in the opposite direction and is rebased on this pull request, dropping its ownership of `arbitraryCWSerreSpectralSequence`, before it merges." If the intended order is the reverse, state that instead.

## R03 (P3) — The rewritten 7.5 uses `𝓛` both for a local system and for the free loop space

**Location.** `TauCetiRoadmap/DGFloer/README.md:2602–2613`: "For a local system `𝓛` on the free loop space … `SH^{=0}_*(W; 𝓛) ≅ H_{*+n}(W, ∂W; i_W^*𝓛)`", and `:2625` "`𝓛` trivial".

**Witness.** Everywhere else `𝓛` is the free loop space (`𝓛Q`, `𝓛₀Q`, `:1550`, `:1867`), including the same item's Check "`SH_*(T*S¹) ≅ H_*(𝓛S¹)`". Layer 9 writes a classical local system as `L` (`:3890`: "every classical local system `L` on `𝓛Q`").

**Repair.** In 7.5 and its new Check, write the classical local system as `L`: `SH_*(W; L)`, `i_W^*L`, `ι^*L`. With that letter the Check at `:2623` and the new one at `:2625` read unambiguously side by side.

## Previous findings

- R01 — not repaired: the description's merge-order paragraph still reads "No open pull request must merge before this one"; main's AlgebraicTopology still lacks Stages 4.8, 5.0, 8.8c, 8.8d. Written again as R01.
- R02 — repaired: `:2319–2323` "complete outward Liouville vector field … which points out of `U` along `Σ`, so that `Ū` is a Liouville domain"; `f_α > 1` on every component; the shell and two-shell instances are now negative controls (`:2386–2396`).
- R03 — repaired: `:218` and `:858–863` add the ContactGeometry CG4 row and contract (sign `λ = −λ_Z` stated); `:2310–2312` consumes the collar; 6.4's and the layer's *Needs:* name CG4.
- R04 — not repaired: the description does not mention #963. Written again as R02.
- R05 — repaired: `:39–40` "other than Definition 1.7 and Theorems B (Theorem 5.14), G, H and I, which the continuation roadmap DGFloerPartII owns"; coverage rows for Thm B, G, Def 1.7/Thm H and Thm I added.
- R06 — repaired: `:2600–2613` cites Seidel §3(3e) lines 486–515, Propositions 3.44–3.46 (`bdho-cotangent` lines 2916–2935) and Seidel §7(7a) lines 1323–1329. R03 above is the one problem this rewrite introduced.

## Verified sound

### Gate, dependency check and Lean

- **Gate.** Rerun on this head: every check passes (`set_option=0 … outside-folder=0 source-material=0 OK`); the worker's gate also records `build=0`.
- **Dependency check.** `depcheck: 235 roadmaps, 2266 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DGFloer'` is empty.
- **Elaboration.** `lake env lean TauCetiRoadmap/DGFloer/Suggested.lean`: seven `sorry` warnings (lines 83, 109, 142, 165, 195, 218, 244), nothing else. The file is unchanged since 334507b, so the signature comparison, padding probe and headline list of the previous report stand; the worker's elaborated signatures show no lost binder.

### Library declarations opened at the pin (Tau Ceti, 5 new)

| Declaration | File and line | What was checked |
| --- | --- | --- |
| `TauCeti.IsLiouvilleDomain` | `TauCeti/Geometry/Symplectic/Liouville/Domain.lean:83` | nondegenerate `ω`, `dα = ω`, `W` compact, `W = {f ≤ c}` with `df(Z) > 0` on the level: exactly "`Z` points out of `U` along `Σ`" for `W = Ū`. It does not include completeness of `Z`, which 6.4 assumes separately. |
| `TauCeti.IsLiouvilleDomain.flowOf_notMem` | `…/Liouville/Completion.lean:94` | `x ∉ interior W`, `t > 0` in the flow domain gives `flowOf Z t x ∉ W`: so `Φ((1, ∞) × Σ) ⊂ T*Q ∖ Ū`. |
| `TauCeti.IsLiouvilleDomain.injOn_flowOf` | `…/Liouville/Completion.lean:119` | complete `Z`, finite dimension: `(y, t) ↦ ψ_t(y)` injective on `frontier W × ℝ`, that is `Φ` injective on `(0, ∞) × Σ` with `r = eᵗ`. |
| `TauCeti.mpullback_globalFlow_comp_eq_symplectization` | `…/Liouville/Symplectization.lean:142` | complete `Z` with `ι_Z dα = α`, smooth `ι`: `(t, s) ↦ ψ_t(ι s)` pulls `α` back to `eᵗ ι^*α`, as `:615–617` says. |
| `TauCeti.IsContactType.isContactForm_mpullback` | `…/Liouville/ContactType.lean:219` | contact type, injective differentials, `dim S + 1 = dim M`: `ι^*α` is a contact form. |

### Sources read for the changed passages

| Passage | Locator | Lines read | Result |
| --- | --- | --- | --- |
| 6.4 graph construction | Remark 1.3; Corollary E and proof | `bdho-cotangent` 223–228, 304–317 | supported: connected `Σ`, one global rescaling (line 312), `f_α : Σ → (1, ∞)`, positive half in the complement of `U` |
| 7.5 direct limit | Seidel §3(3e) | `seidel-biased` 486–515 | supported: (3.23)–(3.26), slopes `τ` off the Reeb periods, continuation maps, limit |
| 7.5 zero and positive parts, LES | Props 3.44, 3.45 | `bdho-cotangent` 2916–2930 | supported: windows `(−ε, ε)`, `(ε, ∞)`; connecting map into `H_{*−1+n}` |
| 7.5 transfer | Seidel §7(7a); Prop 3.46 | `seidel-biased` 1323–1329; `bdho-cotangent` 2931–2935 | supported: `ι^*θ' = e^ρθ + d(function)`; pullback local system along `𝓛V → 𝓛W` |
| scope and coverage rows | Thm G, Def 1.7, Thm H, Thm I; Thms 5.14, 6.12, 7.1, Def 6.11 | `bdho-cotangent` 384–390, 415–430, 4267, 4517–4525, 5366 | supported: G = 7.1, H = 6.12, Def 1.7 = Def 6.11, B via 5.14 |

### Adversarial table

Rows for the changed statements, with values computed this round:

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 6.4 Stokes sign | `Z` with `ι_Z ω = λ_Z`, `dλ_Z = ω` | `ι_Z(ωⁿ) = n λ_Z ∧ ω^{n−1}`; boundary orientation is `ι_{out}(ωⁿ)`, so the integrand is `> 0` where `Z` is outward, `< 0` where inward; `∫_Σ = ∫_U ωⁿ > 0` forces outward on connected `Σ` | holds |
| 6.4 `Φ` an open embedding | `dim((0, ∞) × Σ) = 2n` | injective (`injOn_flowOf`) + immersion (`dφ_t Z = Z`, `Z ⋔ Σ`) in equal dimensions = injective local diffeomorphism | holds |
| 6.4 `Φ^*λ_Z = r α₀` | `S*Q`, `Z = p∂_p`, `λ_Z = −λ_can` | `Φ(r, (q, p)) = (q, rp)`, pullback of `λ_Z` is `r·λ_Z|_{S*Q}`; `L_Z λ_Z = ι_Z ω + d(ω(Z, Z)) = λ_Z` | holds |
| 6.4 rescaling to `f_α > 1` | `α = −α₀`; `α = ½α₀` | multiply by `−2`: `f = 2`; by `4`: `f = 2`; Reeb orbits unchanged as sets (`R_{cα} = c⁻¹R_α`) | holds |
| 6.4 `F_α = r/f_α`, `{F_α < 1} = U_α` | outward only, `f_α > 1` | near `Σ_α`, `U_α = {r < f_α} = {r/f_α < 1}` | holds (the `f_α < 1` case of the previous R02 is gone) |
| 6.4 negative control, one shell | `U = {½ < |p| < 2}` | `Φ(4, (q, p)) = (q, 4p) = Φ(1, (q, 4p))` for `|p| = ½`; `Φ(2, S*_{1/2}) = S*_1 ⊂ U`; `Ū` fails `df(Z) > 0` on `S*_{1/2}` | excluded by the hypothesis, as the Check says |
| 6.4 negative control, two shells | `{1 < |p| < 2} ∪ {3 < |p| < 4}` | contains `{|p| = 3/2}`; `Φ(7/4, S*_2) = S*_{7/2}`, `3 < 7/2 < 4` | excluded, as the Check says |
| 6.4 last sentence of the Check | outer component `S*_2S³ = ∂{|p| < 2}` | connected, bounds a domain containing the zero section (degree 1), `Z` outward: Corollary E applies to `α|_{S*_2}`, giving a closed Reeb orbit of `α` on `Σ` | holds |
| CG4 sign dictionary | CG4: `ω = −dλ`, `ι_Zω = −λ`; here `ω = dλ_Z`, `ι_Zω = λ_Z` | `λ = −λ_Z`; `Φ^*(−λ) = eˢα` becomes `Φ^*λ_Z = eˢ λ_Z|_Σ`, `r = eˢ` | agrees with `:2310–2312` and `:858–863` |
| 7.5 LES shift Check | `W = D²ⁿ`, trivial coefficients | `SH = 0` gives `SH^{>0}_k ≅ H_{k+n−1}(D²ⁿ, S²ⁿ⁻¹)`, `ℤ` iff `k = n + 1`; `SH^{=0}_k ≅ H_{k+n}`, `ℤ` iff `k = n`; wrong shift `H_{k+n+1}` gives `k = n − 1` | holds |
| 7.5 transfer conformal factor | `ρ = 0` | `ι^*θ' = θ + d(function)` is `TauCeti.IsExactLiouvilleEmbedding`'s case of Seidel's definition | holds |
| Scope sentence | Def 1.7, Thms B, G, H, I | source lines 384, 415, 424, 430; DGFloerPartII §§3.2, 3.3, 4.1, 4.5, 4.6 exist at 4def45e (`:1207`, `:1250`, `:1291`, `:1966`, `:2037`) | holds |

Rows carried from the previous report (PRREVIEW-DGFloer~27, statements untouched by the diff): 0.1 boundary formula; 1.1; 1.3 regradings and negative control; 1.4 mod-2 vanishing; 1.5 sign; 2.1 rescaling; 5.3; 5.4; 5.6; 6.1 (both Checks); 6.3 magnetic translation; 6.4 Corollary E Check (`S*Q`, `α = fα₀`) and negative rescaling; 7.1; 7.4 (both); 7.5 `a|z|²`; 8.2; 8.7; 9.3 (both); 9.4; 10.1; 10.2; 10.4 (both); 10.5 Theorem 5.10, Theorem 5.15 / C and the non-orientable route; 11.1; 11.2; 11.3. Their values are in that report's table; the three 6.4 rows that failed there are replaced by the rows above.

### Cross-roadmap citations resolved this round

- **ContactGeometry CG4**, main (f8836c4), `TauCetiRoadmap/SymplecticGeometry/ContactGeometry/README.md:134–143`: the collar `Φ(s, y) = φ_Z^s(y)`, `Φ^*(−λ) = e^s α`, `Φ^*ω = d(e^s α)`, local flow only, and the sentence giving `λ_D = −λ` for DGFloer. Matches the new contract word for word in content.
- **DGFloerPartII** at 4def45e: §3.2 (Theorem B = 5.14), §3.3 (Corollaries D and E in their Theorem B forms), §4.1 (abundance, Theorem H = 6.12), §4.5 (Theorem I), §4.6 (Theorem G = 7.1).
- **AlgebraicTopology** on main: R01. **#963**: R02.
- **Duplication by object** for the new text: the flow-out, injectivity and no-re-entry statements of the graph construction are now cited from Tau Ceti rather than restated, and the collar from CG4; 6.4 owns only the graph `Σ_α`, `U_α`, `F_α` and the radial homotopy. Ownership of these against the other open pull requests was checked in the previous round and not searched again.
- **Remark, another roadmap's text.** DGFloerPartII §3.3 (`:1253`, `:1259`) uses "DGFloer Layer 6 item 4's Liouville-flow argument" for a domain disjoint from the zero section; with this head that argument carries the outward hypothesis, automatic for connected `Σ`. The id resolves; nothing changes here.

## Not verifiable

- Nothing new in the changed passages: every locator the diff adds was read at the text.
- Carried from the previous report: Weibel 5.5.1(2) and 5.5.10 (1.3); Serre 1951 and 1953 (1.2, 1.4); the texts settled as uncertified (Hofer–Zehnder, Struwe, Palais, Bröcker–tom Dieck, Massey, Whitehead, Hofer–Salamon).

## Source issues

- none

No new source mistake was found in the passages read this round; the four entries of the previous report stand.
