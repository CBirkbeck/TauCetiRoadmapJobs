# Review of AlgebraicGromovWittenTheory (pull request #1998 at 103a9db)

**Verdict:** needs changes

## R01 (P2) — The separating splitting with the numerical inverse metric does not say which level it holds at

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:48–51, 536–538`: "the Chow-valued Gromov–Witten class … Prove … the splitting axiom"; "After applying an outgoing evaluation pushforward on each separate component, apply the projection formula to derive numerical inverse-metric contraction for separating gluing."

**Claim:** For the Chow-valued classes in `CH^*(Mbar g₁ (n₁+1) × Mbar g₂ (n₂+1))_ℚ`, the contracted right side `Σ g^{ef} I(γ_{S₁},T_e) ⊗ I(T_f,γ_{S₂})` is not defined. The contraction holds only after taking degrees.

**Witness:** §5.3 descends only the numbers (a multilinear map on `H_X`). §5.4's classes take insertions in `CH^*(X)_ℚ`. Two Chow lifts of a numerical `T_e` differ by a numerically trivial `γ₀`, and no target makes `I(…,γ₀)` vanish in Chow.

**Repair:** In §6.4 replace the sentence with: "For separating gluing and classes `c₁, c₂` on the two factors, prove `deg(φ_S^* I_{g,n,β}(γ)·(c₁×c₂)) = Σ_{β₁+β₂=β} Σ_{e,f} g^{ef} deg(I_{g₁,n₁+1,β₁}(γ_{S₁},T_e)·c₁)·deg(I_{g₂,n₂+1,β₂}(T_f,γ_{S₂})·c₂)`. The class-level splitting stays the Chow-correspondence statement with refined pullback along `Δ_X`." In end goal 2 write "the splitting axiom, as Chow correspondences, with numerical inverse-metric contraction for separating invariants". Tested on an elliptic curve `E` with `u = pt`, `v = 1`: both sides are 1. With `u = v = pt`, both sides are 0.

## R02 (P3) — Most targets carry no locator

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md`, §§0.1–0.2, 1.2–1.4, 2.2, 3.1–3.2, 3.4–3.5, 4.3–4.5, 5.1–5.3, 5.5, 6.2, 7.1–7.3, 8.1–8.2, 8.4, 9.2–9.3, 10.1, 10.3–10.5: no source or supplier locator at the claim.

**Claim:** 12 of the 15 sampled targets have no locator (only 3.3, 9.4 and 10.2 do). No listed reference proves §5.5's virtual product formula: Kontsevich–Manin 1994, 2.5.1 only states it as a claim.

**Witness:** §7.2 states WDVV with no citation. `fulton-pandharipande-1997` lines 2007–2124 prove it ((50)–(52) and the proof of Theorem 4, pp. 37–39).

**Repair:** Put the locator at the claim (arXiv numbering):
- 0.2: VirtualFundamentalClass §2.2 (projection formula).
- 1.2: Kontsevich–Manin 1998 §2.1, p. 7.
- 2.2: Behrend 1997 Lemma 1, p. 3.
- 3.1: Behrend–Manin Def. 3.13, p. 25.
- 4.3: Behrend 1997, pp. 6–7 (the dimension count after Prop. 5).
- 4.4: Kontsevich–Manin 1998 §1.4 eq. (5), p. 3.
- 5.1: Kontsevich–Manin 1998 §1.1 eqs. (1)–(2), p. 2.
- 7.1: Fulton–Pandharipande (45)–(46), pp. 36–37.
- 7.2: Fulton–Pandharipande (50)–(52) and the proof of Thm. 4, pp. 37–39.
- 9.3: Iritani, proof of Prop. 2.3, p. 9.
- 5.5: add a source that proves the virtual product formula.
- For the rest, cite a standard text or the supplier section that provides the fact. Move Behrend 1997 Prop. 2 from §2.3 into §2.1, which is the section that states it.

## R03 (P3) — §3.3 credits Behrend–Manin with an extension argument it does not contain

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:323–325`: "together with the stable-map extension argument in Behrend–Manin Thm. 3.14 and Cor. 4.8."

**Claim:** Behrend–Manin state properness (Thm. 3.14, p. 25). Cor. 4.8 only reduces it to `ℙ^r` and takes the extension argument from another text.

**Witness:** `behrend-manin-1996` lines 1138–1139: Cor. 4.8 reduces properness to maps to `ℙ^r` and cites Prop. 3.3 of its reference [13], Pandharipande's preliminary notes (line 1979). The argument is in `fulton-pandharipande-1997` §4.2, Propositions 5–6 (lines 1012–1129).

**Repair:** "… together with the valuative extension argument for maps to `ℙ^r` in Fulton–Pandharipande §4.2, Propositions 5–6 (pp. 19–22), and the reduction to `ℙ^r` in Behrend–Manin Cor. 4.8 (p. 28); the statement is Behrend–Manin Thm. 3.14 (p. 25)."

## R04 (P3) — The descendant string, dilaton, divisor and recursion equations cite locators for the primary axioms only

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:506, 513, 527, 540, 548`: "(Kontsevich–Manin 1994, §2.2)"; the dilaton equation has no locator; "(Kontsevich–Manin 1994, §2.2, and Iritani Prop. 2.3)"; "§§2.2.7 and 2.3.8"; "(Kontsevich–Manin 1998, Cor. 1.3)".

**Claim:** The cited texts do not state the descendant equations as the README writes them.

**Witness:**
- `kontsevich-manin-1994` §2.2 has no descendants. Its 2.2.4 is the primary divisor axiom (lines 186–196).
- Iritani Prop. 2.3(iv) is an equation for the fundamental solution `L`.
- Kontsevich–Manin 1998 Cor. 1.3 covers only `n = 3`.

**Repair:**
- §6.2: add "(Kontsevich–Manin 1998, Lemma 1.5.3, p. 6)".
- §6.3: use "(Kontsevich–Manin 1998, Lemma 1.5.2, eq. (12), p. 5; primary case Kontsevich–Manin 1994, 2.2.4)".
- §6.4: "Kontsevich–Manin 1994, 2.2.6–2.2.7 and 2.3.8" (2.2.6 is the separating axiom, which is not cited now).
- §6.5: say that Cor. 1.3 is the three-point case, and cite a source for the `n`-point recursion.
- §6.1: cite a source for the descendant string equation. Keep Kontsevich–Manin 1994, 2.2.3 with (2.7) for the primary axiom and its basic exception.

## R05 (P3) — §9.4 normalises its solution differently from the Iritani result it cites

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:717–719`: "solve the horizontal equations recursively in the parameter degree, with identity constant term … See Iritani §2.3 and Prop. 2.3 for the formal solution convention."

**Claim:** §9.4 normalises the solution to the identity at `t = 0` in every Novikov degree. Iritani normalises only at `Q = t = 0` and adds a Novikov-direction equation, so his `L(Q,0) ≠ id`.

**Witness:** `iritani-2008` lines 385–390: Prop. 2.3 requires `L(0,0,ℏ) = id` and the `q_a`-equation. By (2.10), line 340, `L(Q,0)` on `ℙ¹` contains `⟨H,H⟩_{0,2,1} Q = Q ≠ 0`.

**Repair:** Replace the sentence with: "This normalisation at `t = 0` differs from the descendant fundamental solution of Iritani Prop. 2.3 (p. 8), which is normalised at `Q = t = 0` and also solves the Novikov-direction equation (2.9)."

## R06 (P3) — The locator "Behrend 1997, §3" does not exist

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:363`: "has rank `d(1-g)+c₁(T_X)·β` (Behrend 1997, §3)".

**Claim:** Behrend 1997 has no numbered sections.

**Witness:** The section headings in `behrend-1997` are unnumbered (lines 81, 120, 209, 494). The rank `χ(f^*T_V)` is computed at lines 157–161, p. 5.

**Repair:** "(Behrend 1997, section 'The Virtual Fundamental Classes', p. 5, the paragraph after Prop. 4)".

## R07 (P3) — The topology on `R_X` is never defined

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:113–114, 241–245`: "interpreted in the Novikov and parameter-adic topology specified in Layer 1"; "the mixed completion `R_X = Λ_X⟦t⁰,…,tᴺ⟧`".

**Claim:** Layer 1 names "the mixed completion" but defines no topology. The convergence of `F₀` (§7.1) and of `φ` (§10.5) depends on that choice.

**Witness:** `Σ_β Q^β` (all `β ∈ NE(X)`) converges coefficientwise. It does not converge in the `t`-adic topology with `Λ_X` discrete, because each partial sum changes the `t⁰` coefficient.

**Repair:** In §1.4: "`R_X = MvPowerSeries (Fin (N+1)) Λ_X` carries the product topology of Mathlib's `MvPowerSeries.WithPiTopology` (`Mathlib/RingTheory/MvPowerSeries/PiTopology.lean`) over the period topology of `Λ_X`." Drop "mixed completion". Under "From Mathlib", name `MvPowerSeries.WithPiTopology` and `LaurentSeries` (`Mathlib/RingTheory/LaurentSeries.lean`) instead of "Mathlib's commutative algebra, finite-rank lattices and topological-ring APIs".

## R08 (P3) — Definitions lack API lists and three Checks each, and there is no Downstream consumers section

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:484–488`: "**Checks.** For degree one maps to the projective line, the descendant with insertions τ₁(H), H, 1 has value one by the string equation…". The other Checks blocks (lines 201–205, 552–556, 786–790) have the same shape.

**Claim:**
- None of `H_X`, `Λ_X`, `R_X`, `Mpre`, `MbarMap`, `ψ_i`, `F₀`, `⋆small`, `⋆_t`, `∇`, `S`, `D_big,z`, `φ` has an API bullet list or three Checks.
- The Checks are written as paragraphs.
- There is no `## Downstream consumers` section.

**Witness:**
- There are 19 Checks in all for at least 19 definitions, and Layers 5, 6 and 10 have one each.
- "The two splittings … give the same WDVV coefficient" restates §7.2.
- "Compare the class-zero specialization…" computes nothing.

**Repair:**
- Give each definition an API bullet list and at least three bulleted Checks with computed values. For `⋆small`, for example: `H⋆H = Q·1` on `ℙ¹`; `H^{r+1} = Q·1` on `ℙ^r`; ordinary multiplication on a point.
- Replace the two vacuous Checks.
- Add `## Downstream consumers`.

## R09 (P3) — Each layer's *Needs:* line is copied onto every subsection

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:741` (§10.1): "*Needs:* Layers 1 and 6–9." and line 199 (§0.2): "*Needs:* MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5."

**Claim:** The 45 *Needs:* lines take only 11 distinct values, one per layer, so they do not list what each target uses.

**Witness:** §10.1's Rees algebra uses only `R_X` (§1.4), not Layers 6–9. §0.2's degree computation on a Deligne–Mumford stack needs stack Chow groups and their projection formula (VirtualFundamentalClass §2.2), which its line omits.

**Repair:** Write the *Needs:* line per target:
- §10.1: "*Needs:* §1.4, Mathlib `Derivation`".
- §0.2: "*Needs:* MotivesAndAlgebraicCycles §0.5, VirtualFundamentalClass §2.2".
- §1.1: drop "Layer 0" and "Tau Ceti Novikov series".
- §9.3: "*Needs:* §§8.1, 8.3, 9.1".

## R10 (P3) — Three targets do not state their conclusion

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:661–662`: "Record precisely which grading survives without a Fano or monotonicity hypothesis"; lines 470–471: "with multiplicities from the cotangent comparison"; lines 343–344: "Prove their graph-stratum descriptions, degree, properness".

**Claim:** None of the three gives the value to be proved.

**Witness:** On `ℙ¹`, `deg Q = 2c₁·[line] = 4`. Without the Novikov degree, `H⋆H = Q·1` mixes degrees 4 and 0, so only a ℤ/4 grading survives. Self-gluing is 2:1 onto its image, because swapping the two branches gives the same point.

**Repair:**
- §8.4: "With `deg Q^β = 2c₁(T_X)·β` both products are homogeneous of degree zero. With `deg Q^β = 0` they are `ℤ/2N_X`-graded, where `N_X ℤ` is the subgroup generated by `c₁(T_X)·β` for `β ∈ NE(X)`."
- §5.4: "each with multiplicity one" (`kontsevich-manin-1998` lines 116–117).
- §3.5: "Self-gluing has degree 2 onto its image. External gluing has degree 2 when `I = J = ∅` and `(g₁,β₁) = (g₂,β₂)`, and degree 1 otherwise."

## R11 (P3) — The base field is narrower than the sources

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:37`: "Fix an algebraically closed field `k` of characteristic zero" (likewise lines 4 and 74).

**Claim:** No target uses algebraic closure, and the sources construct the stacks and classes over an arbitrary field.

**Witness:** `behrend-manin-1996` line 530 fixes an arbitrary field. Its Def. 3.13 (lines 1014–1017) allows characteristic `p` for classes bounded by the characteristic. `behrend-1997` line 82 also works over an arbitrary field.

**Repair:** "Fix a field `k` of characteristic zero". Either add Behrend–Manin's characteristic-`p` case (classes bounded by the characteristic, Def. 3.13) as a target, or name it in Scope as excluded.

## R12 (P3) — Supplier links point at pull requests

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:146–152`: "[StableReductionPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1841)"; the MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometryPartII and VirtualFundamentalClass links have the same form.

**Claim:** Four cross-roadmap citations carry pull-request numbers.

**Witness:** Citations name the roadmap and section and never a pull-request number, even for roadmaps still in pull requests. Line 143 already links `../StableReduction/README.md`.

**Repair:** Link `../StableReductionPartII/README.md`, `../MotivesAndAlgebraicCycles/README.md`, `../AlgebraicModuliForArithmeticGeometryPartII/README.md` and `../VirtualFundamentalClass/README.md`.

## R13 (P3) — The README says its organisation follows its sources

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:862–864`: "The geometric spine follows Behrend–Manin, Behrend–Fantechi, and Behrend. The axioms and WDVV organization follow Kontsevich–Manin and Fulton–Pandharipande…"

**Claim:** A roadmap may not say that it follows a source. Separately, line 3 reads "This roadmap constructs of algebraic Gromov–Witten theory".

**Witness:** The principles forbid a roadmap from saying it follows a source. The References section already says what each work is cited for.

**Repair:** Delete `## Acknowledgements`. Change line 3 to "This roadmap constructs algebraic Gromov–Witten theory for …".

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| 0.2 numerical descent | `E` elliptic, `γ = p−q`, `α = [Mbar_{0,3}(E,0)] = [E]` | `deg(ev^*γ ∩ α) = deg(p−q) = 0` | projection formula: `deg(γ·ev_*α) = 0` | holds; *Needs:* line omits VFC §2.2 (R09) |
| 1.1 ample degree | `ℙ¹`, `A = O(1)`; cone spanned by `(1,m)` | `#{β ∈ NE : ω_A(β) ≤ 3} = 4`; `x = 0` on `(0,1)` in the closure | AMAGPII §1.7(iii): `ω_A > 0` on the closed cone minus 0; the `(1,m)` slice `x ≤ 1` is infinite | holds; both Checks correct |
| 1.2 Novikov series | `ℙ¹`, `D = H` | `Λ = ℚ⟦Q⟧`; `δ_H(Q²) = 2Q²` | `degreeDerivation_single` gives `single g (ℓ g · r)` | holds |
| 1.3 ample independence | `ℙ¹×ℙ¹`, `A = (1,1)`, `A' = (1,2)` | `ω_A ≤ ω_A' ≤ 2ω_A` on `ℕ²` | finite slices: both carriers are all functions `NE → ℚ`, related by the identity | holds |
| 1.4 topology of `R_X` | `Σ_d Q^d` | converges coefficientwise | not Cauchy `t`-adically with `Λ_X` discrete | topology unstated (R07) |
| 2.2 stable locus | `(0,3)`, `(0,2)` | `Mbar_{0,3}` = point, open in `Mpre_{0,3}`; `(0,2)` excluded | Behrend 1997 Lemma 1 (line 86) | holds; no locator (R02) |
| 3.1 stable-map stack | `ℙ¹`: `(0,0,1)`, `(0,2,0)` | a point; empty | isomorphisms modulo `Aut ℙ¹`; a constant 2-pointed map is unstable | holds |
| 3.3 properness | `ℙ¹`, `(0,0,1)` | a point, proper | Behrend–Manin Thm. 3.14, p. 25; Cor. 4.8 defers the extension argument (line 1139) | locator wrong (R03) |
| 4.1 rank of `Rπ_*f^*T_X` | `ℙ¹`, `g = 0`, `β = 1`; point target | `d(1−g) + c₁·β = 1 + 2 = 3`; point: 0 | `behrend-1997` lines 159–161: `χ(τ) dim V − β(ω_V) = 3` | holds; locator §3 wrong (R06) |
| 4.3 virtual dimension | `ℙ¹`, `(0,3,1)`; point target | `(1)(−2) + 3 + 2 = 3`; `3g−3+n` | `behrend-1997` lines 16, 194–196 | holds |
| 4.4 point target / class zero | point; `X`, `(1,1,0)` | virtual class `[Mbar g n]`; vdim 1 | KM98 (5): `c_{gd}(E ⊠ T_X) ∩ [Mbar_{1,1}×X]`, dimension `1+d−d = 1` | holds; no locator |
| 5.1 cotangent lines / Layer 5 Check | `Mbar_{0,4}`; `ℙ¹`, `(0,3,1)` | `deg ψ₁ = 1`; `⟨τ₁(H) H 1⟩ = 1`; ancestor 0 | string equation: `⟨H,H⟩_{0,2,1} = 1`; `ψ = 0` on `Mbar_{0,3}`; `D₁` term = 1 | holds |
| 5.4 codimension of the GW class | general `(g,n,β)`, insertions of codimension `c` | `c + d(g−1) − c₁·β` | `3g−3+n − (vdim − c) = c + d(g−1) − c₁·β` | holds |
| 6.2 dilaton | `(1,0,0)` | LHS `χ_top(X)/24` | RHS undefined; excluded by the Conventions' stable-type rule | holds as scoped |
| 6.3 divisor | `(0,2,0)`, insertions `D, γ₁, γ₂` | LHS `deg(Dγ₁γ₂)`, RHS 0 | target type absent; excluded by the Conventions | holds as scoped |
| 6.4 separating splitting, numbers | `E`: `u = pt, v = 1`; `u = v = pt` | `deg(u·v)` = 1; 0 | `Σ g^{ef}(u,T_e)(v,T_f)` = 1; 0 | numbers hold; class level undefined (R01) |
| Layer 6 Check: self-gluing on `E` | `β = 0`, three-point class | `Δ·Δ = deg c₁(T_E) = 0` | numerical contraction `Σ g^{ab} T_a T_b = 2·pt` | Check correct |
| 7.1 potential | point; `ℙ¹` | `t³/6`; `t₀²t₁/2 + Q e^{t₁}` | `F₁₁₁ = Q e^{t₁}`, so `H⋆H = Q` at `t = 0` | holds; no locator |
| 7.2 WDVV | `ℙ²`, indices `(1,1,2,2)` | `N₂ = N₁²(2·C(2,1) − C(2,2)) = 1` | one conic through 5 general points | holds; no locator |
| 8.1 / headline 4: small product | `ℙ¹`; `ℙ^r` | `H⋆H = Q·1`; `H^{r+1} = Q` | FP §10, pp. 47–48 | holds |
| 8.3 / headline 5: unit of the big product | any `X` | `F_{0jk} = g_{jk}` | FP p. 37 (line 1967) | holds |
| 8.4 grading | `ℙ¹` | `deg Q = 4` | `H⋆H` mixes degrees 4 and 0, so ℤ/4 | conclusion unstated (R10) |
| 9.2 / headline 6: flatness | point; small connection on `ℙ¹` | `[C,C] = 0`; `∂C` symmetric | `δ_D(E⋆)` equals `⟨D,E,·,·⟩_{0,4}`, symmetric by the divisor equation | holds |
| 9.3 flat pairing | general; wrong model `S = (s₁(z), s₂(z))` | defect `z⁻¹[(s₁(−z), T⋆s₂) − (T⋆s₁(−z), s₂)] = 0` | the wrong model leaves `2z⁻¹(T⋆s₁, s₂) ≠ 0` | holds |
| 9.4 fundamental solution | point; `ℙ¹` | `exp(−t/z)`, pole order `n` at `tⁿ`; `L(Q,0) = id` | Iritani (2.10): `Q`-term `⟨H,H⟩_{0,2,1} = 1 ≠ 0` | holds; convention differs from Iritani (R05) |
| 10.2 big quantum `D`-module | general; point | `[z∂, f] = z∂f`; `[z∂_a, z∂_b] = z²[∇_a, ∇_b] = 0` | Iritani Def. 2.2: `ℏ∂ + p∗`, same sign | holds |
| 10.5 divisor slice | `ℙ¹` | `φ(Q) = e^{t}Q`; `∂_t φ = φ δ_H` | `exp(t·β)` from `Σ(t·β)ⁿ/n!` (FP (66), p. 47) | holds |
| Headline 1: moduli and virtual class | rows 3.1, 3.3, 4.1, 4.3 | vdim `(1−g)(d−3) + n + c₁·β` | `behrend-1997` line 16 | holds |

- Gate on 103a9db: every check passed. Dependency check output: `depcheck: 231 roadmaps, 2076 edges, 0 problem(s)` (no UPWARD or CYCLE line). Nothing changes outside the roadmap folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output. The file declares nothing, so neither the `#check` comparison nor the one-tactic probe applies. Its docstring names all six headlines and the carrier each lacks (algebraic stacks, the stable-map stack, the virtual class, numerical Chow), and none is statable at the pins.
- Source locators checked against the arXiv texts: 18. These are Behrend–Manin Thm. 3.14 and Cor. 4.8; Behrend 1997 Props. 2, 3, 5 and "§3"; Kontsevich–Manin 1998 §1.1, Thm. 1.2 and Cor. 1.3; Kontsevich–Manin 1994 §2.2, 2.2.7 and 2.3.8; Fulton–Pandharipande (48)–(49), Thm. 4 and §10; Iritani Def. 2.2, §2.3 and Prop. 2.3.
- Tau Ceti declarations opened at the pin: `NovikovSeries` (`TauCeti/RingTheory/NovikovSeries/Basic.lean:92`), `single_mul_single` (`Multiplication.lean:181`), `periodFiltration` (`Topology.lean:93`), the `CompleteSpace` instance (`Topology.lean:263`), `IsTopologicalRing` (`TopologicalRing.lean:157`), `degreeDerivation` (`Derivation.lean:70`) and `continuous_degreeDerivation` (`Derivation.lean:135`).
- More Tau Ceti declarations: `PrestableMap` (`TauCeti/AlgebraicGeometry/Curves/StableMaps/Basic.lean:73`), `PrestableMap.ev` (line 88), `PrestableMap.degree` (`Degree.lean:95`), `Chow.ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`), `LineBundleClass.IsAmple` (`LineBundle/Ample.lean:71`) and `NovikovModule` (`TauCeti/RingTheory/NovikovModule/Basic.lean:53`). Mathlib declarations opened: `MvPowerSeries.WithPiTopology` (`Mathlib/RingTheory/MvPowerSeries/PiTopology.lean:86`) and `LaurentSeries` (`Mathlib/RingTheory/LaurentSeries.lean:101`).
- Cross-roadmap citations resolved: 30.
  - On main: SchemeAndStackFoundations Layer 1, §§4.14 and 4.15 (`StableCurves.Mbar`, `Mbar.forget`) and Layer 5; StableReduction Layers 9–11; AlgebraicVectorBundles L1A–L2B (through its label map); DerivedModuleAlgebra §§0.4 and 0.25; EnhancedDerivedSheaves §0.3 and E1.8.
  - At open heads: StableReductionPartII §§3.1–3.3 and 3.11; MotivesAndAlgebraicCycles §§0.5 and 3.1; AlgebraicModuliForArithmeticGeometryPartII §§1.1–1.4 and 1.7(iii); VirtualFundamentalClass Layers 2, 3 and 6–9 and §7.3.
- Ownership: StableReduction ("Boundary: moduli spaces and properness") and VirtualFundamentalClass (Scope) both exclude the stable-map stack and its obstruction theory, so this roadmap owns `Mpre`, `MbarMap` and Layers 4–10. GromovWittenTheory (#990) owns the symplectic invariants and the `H₂(X;ℤ)` Novikov specialisation, and AnalyticStableMaps (#987) owns analytic charts, so neither owns these objects. Tau Ceti's `NovikovModule` works over torsors under a group, while `Λ_X` here is built over the monoid `NE(X)`. There is no fully qualified name clash because `Suggested.lean` declares nothing.
- Pull-request text: the title and description match the head (a new roadmap, no other folder changed, and the generated depends-on list names the four open suppliers it cites).

## Not verifiable

- Dubrovin 1996 and Fulton, *Intersection Theory*: the README cites both without locators. Neither was read; Fulton is not open access.
- The roadmap index's copy of #1998 differs from 103a9db: it has further Checks blocks in Layers 0, 1, 3, 5, 7 and 8. This review reads 103a9db only.

## Source issues

- **Misprint** in kontsevich-manin-1998 at §1.1, p. 2: the source says the absolute stabilization exists in the range 2g − 2 − n > 0; it should be 2g − 2 + n > 0, as in Theorem 1.2; affects nothing.
- **Gap** in kontsevich-manin-1998 at Theorem 1.2, pp. 2–3: the source gives only a sketch and defers the virtual-class comparison of the two cotangent lines to a later paper; it should prove the boundary-divisor identity for the virtual class; affects the proof.
- **Gap** in behrend-manin-1996 at Corollary 4.8, p. 28 (arXiv v2): the source takes properness for maps to ℙ^r from an unpublished preliminary preprint; it should cite a published proof such as Fulton–Pandharipande §4.2, Propositions 5–6; affects the proof.
