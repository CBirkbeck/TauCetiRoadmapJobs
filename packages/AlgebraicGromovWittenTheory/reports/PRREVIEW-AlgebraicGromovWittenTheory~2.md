# Review of AlgebraicGromovWittenTheory (pull request #1998 at 1949322)

**Verdict:** needs changes

## R01 (P2) — The separating splitting with the numerical inverse metric does not say which level it holds at

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:47–51, 571–573`: "the Chow-valued Gromov–Witten class … the splitting axiom"; "After applying an outgoing evaluation pushforward on each separate component, apply the projection formula to derive numerical inverse-metric contraction for separating gluing."

**Claim:** For classes in `CH^*(Mbar g₁ (n₁+1) × Mbar g₂ (n₂+1))_ℚ`, the contraction `Σ g^{ef} I(γ_{S₁},T_e) ⊗ I(T_f,γ_{S₂})` is not defined. Only its degrees are.

**Witness:** §5.3 descends only the numbers to `H_X`. Two Chow lifts of `T_e` differ by a numerically trivial `γ₀` (on an elliptic curve, `p − q`), and no target makes `I(…,γ₀)` vanish in Chow.

**Repair:** In §6.4 replace the sentence with: "For separating gluing and classes `c₁, c₂` on the two factors, prove `deg(φ_S^* I_{g,n,β}(γ)·(c₁×c₂)) = Σ_{β₁+β₂=β} Σ_{e,f} g^{ef} deg(I_{g₁,n₁+1,β₁}(γ_{S₁},T_e)·c₁)·deg(I_{g₂,n₂+1,β₂}(T_f,γ_{S₂})·c₂)`. The class-level splitting stays the Chow-correspondence statement with refined pullback along `Δ_X`." In end goal 2 write "the splitting axiom, as Chow correspondences, with numerical inverse-metric contraction for separating invariants". On `E` with `u = pt, v = 1` both sides are 1. With `u = v = pt` both are 0.

## R02 (P3) — Most targets still carry no locator

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md`, §§0.1–0.2, 1.2–1.4, 2.2, 3.2, 3.4–3.5, 4.3–4.5, 5.1–5.3, 5.5, 6.2, 7.1–7.3, 8.1–8.2, 8.4, 9.2–9.3, 10.1, 10.3–10.5: no source or supplier locator at the claim.

**Claim:** 29 targets have no locator. Only §3.1 gained one, and it is wrong (R14).

**Witness:** §7.2 (lines 619–633) states WDVV without a citation. `fulton-pandharipande-1997` (50)–(52) and the proof of Thm. 4, pp. 37–39, prove it.

**Repair:** Put the locator at the claim (arXiv numbering):
- 0.2: VirtualFundamentalClass §2.2.
- 1.2: Kontsevich–Manin 1998 §2.1, p. 7.
- 2.2: Behrend 1997 Lemma 1, p. 3.
- 4.3: Behrend 1997, pp. 6–7.
- 4.4: Kontsevich–Manin 1998 §1.4 eq. (5), p. 3.
- 5.1: Kontsevich–Manin 1998 §1.1 eqs. (1)–(2), p. 2.
- 7.1: Fulton–Pandharipande (45)–(46), pp. 36–37.
- 7.2: Fulton–Pandharipande (50)–(52) and the proof of Thm. 4, pp. 37–39.
- 9.3: Iritani, proof of Prop. 2.3, p. 9.
- 5.5: add a source that proves the virtual product formula.
- The rest: cite a standard text or the supplier section that provides the fact.

## R03 (P3) — §3.3 credits Behrend–Manin with an extension argument it does not contain

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:347–348`: "together with the stable-map extension argument in Behrend–Manin Thm. 3.14 and Cor. 4.8."

**Claim:** Behrend–Manin state properness and reduce it to `ℙ^r`. They do not give the extension argument.

**Witness:** `behrend-manin-1996` lines 1137–1139: Cor. 4.8 reduces properness to maps to `ℙ^r`, then cites Prop. 3.3 of its reference [13], a preliminary preprint. The argument is `fulton-pandharipande-1997` §4.2, Props. 5–6.

**Repair:** "… together with the valuative extension argument for maps to `ℙ^r` in Fulton–Pandharipande §4.2, Propositions 5–6 (pp. 19–22), and the reduction to `ℙ^r` in Behrend–Manin Cor. 4.8 (p. 28); the statement is Behrend–Manin Thm. 3.14 (p. 25)."

## R04 (P3) — The descendant equations cite locators for the primary axioms only

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:542, 548–549, 563, 576, 584`: "(Kontsevich–Manin 1994, §2.2)"; §6.2 has no locator; "(Kontsevich–Manin 1994, §2.2, and Iritani Prop. 2.3)"; "§§2.2.7 and 2.3.8"; "(Kontsevich–Manin 1998, Cor. 1.3)".

**Claim:** The cited texts do not state the descendant equations as the README writes them.

**Witness:** `kontsevich-manin-1994` §2.2 has no descendants (its 2.2.4 is the primary divisor axiom). Iritani Prop. 2.3 is an equation for `L`. Kontsevich–Manin 1998 Cor. 1.3 covers only `n = 3`.

**Repair:**
- §6.2: add "(Kontsevich–Manin 1998, Lemma 1.5.3, p. 6)".
- §6.3: use "(Kontsevich–Manin 1998, Lemma 1.5.2, eq. (12), p. 5; primary case Kontsevich–Manin 1994, 2.2.4)".
- §6.4: use "Kontsevich–Manin 1994, 2.2.6–2.2.7 and 2.3.8".
- §6.5: say that Cor. 1.3 is the three-point case, and cite a source for the `n`-point recursion.
- §6.1: cite a source for the descendant string equation. Keep Kontsevich–Manin 1994, 2.2.3, for the primary case.

## R05 (P3) — §9.4 normalises its solution differently from the Iritani result it cites

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:777–779`: "solve the horizontal equations recursively in the parameter degree, with identity constant term … See Iritani §2.3 and Prop. 2.3 for the formal solution convention."

**Claim:** §9.4 normalises at `t = 0` in every Novikov degree. Iritani normalises only at `Q = t = 0` and adds a Novikov-direction equation.

**Witness:** `iritani-2008` lines 385–390: Prop. 2.3 asks for `L(0,0,ℏ) = id` and the `q_a`-equation. On `ℙ¹`, `L(Q,0)` contains `⟨H,H⟩_{0,2,1} Q = Q ≠ 0`.

**Repair:** Replace the sentence with: "This normalisation at `t = 0` differs from the descendant fundamental solution of Iritani Prop. 2.3 (p. 8), which is normalised at `Q = t = 0` and also solves the Novikov-direction equation (2.9)."

## R06 (P3) — The locator "Behrend 1997, §3" does not exist

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:387`: "has rank `d(1-g)+c₁(T_X)·β` (Behrend 1997, §3)".

**Claim:** Behrend 1997 has no numbered sections.

**Witness:** `behrend-1997` lines 81 and 120: the section headings are unnumbered. The rank `χ(f^*T_V)` is computed at lines 157–161, p. 5.

**Repair:** "(Behrend 1997, section 'The Virtual Fundamental Classes', p. 5, the paragraph after Prop. 4)".

## R07 (P3) — The topology on `R_X` is never defined

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:113–114, 253–257`: "interpreted in the Novikov and parameter-adic topology specified in Layer 1"; "### 1.4 The mixed completion … `R_X = Λ_X⟦t⁰,…,tᴺ⟧`".

**Claim:** Layer 1 defines no topology on `R_X`, and neither do the new §1.4 Checks. The convergence claims of §7.1 and §10.5 depend on that choice.

**Witness:** `Σ_β Q^β` converges coefficientwise. It is not Cauchy in the `t`-adic topology with `Λ_X` discrete, because each partial sum changes the `t⁰`-free coefficient.

**Repair:** In §1.4: "`R_X = MvPowerSeries (Fin (N+1)) Λ_X` carries the product topology of Mathlib's `MvPowerSeries.WithPiTopology` (`Mathlib/RingTheory/MvPowerSeries/PiTopology.lean`) over the period topology of `Λ_X`." Drop "mixed completion". Under "From Mathlib" (line 128), name `MvPowerSeries.WithPiTopology` and `LaurentSeries`.

## R08 (P3) — Definitions still lack API lists, and four lack three Checks

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:649, 724`: "The two splittings of the four-pointed curve give the same WDVV coefficient."; "Compare the class-zero specialization with the classical ring." §§2.1, 9.3, 10.1 and 10.5 have no Checks block.

**Claim:** This head adds Checks to twelve definitions and a Downstream consumers section. What remains:
- No definition has an API bullet list.
- `Mpre`, `S` and `D_big,z` have no Checks, and `φ` has one, in the Layer 10 Examples paragraph (line 862).
- The Layer Examples Checks are still paragraphs, and two of them compute nothing.

**Witness:** Line 649 restates §7.2. Line 724 asks for a comparison and states no value. `grep '^\*\*Checks'` gives 23 blocks, and none follows §2.1, §9.3, §10.1 or §10.5 before the next target.

**Repair:**
- Give each definition an API bullet list.
- Add these Checks:
  - §2.1: "`Mpre 0 0` has dimension `−3` at `ℙ¹`, whose automorphism group `PGL₂` has dimension 3. `Mpre 0 3` contains `Mbar 0 3 = pt` as an open point."
  - §9.3: "For the point, `S(exp(−t/z), exp(−t/z)) = exp(t/z)·exp(−t/z) = 1`. The unsigned pairing `(s₁(z), s₂(z))` gives `exp(−2t/z)`."
  - §10.1: "At `z = 0` the algebra is commutative. At `z = 1` it is the ring of differential operators generated over `R_X` by the `∂_a`, where `[∂_a, tᵃ] = 1`."
  - §10.5: "On `ℙ¹`, `∂_t φ(Q²) = 2e^{2t}Q² = φ(δ_H Q²)`."
- Replace lines 649 and 724 with computed values, for example "on `ℙ²`, the `(1,1)` term of WDVV gives `N₂ = N₁²(C(2,1) − C(2,2)) = 1`" and "at `Q = 0`, `H ⋆small H = H²` on `ℙ²`".

## R09 (P3) — Each layer's *Needs:* line is copied onto every subsection

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:801` (§10.1): "*Needs:* Layers 1 and 6–9."; line 205 (§0.2): "*Needs:* MotivesAndAlgebraicCycles and SchemeAndStackFoundations Layer 5."

**Claim:** The 45 *Needs:* lines take only 11 distinct values, one per layer.

**Witness:** §10.1's Rees algebra uses only `R_X` (§1.4). §0.2's degree on a Deligne–Mumford stack needs the stack projection formula (VirtualFundamentalClass §2.2), which its line omits.

**Repair:** Write the *Needs:* line per target:
- §10.1: "*Needs:* §1.4, Mathlib `Derivation`".
- §0.2: "*Needs:* MotivesAndAlgebraicCycles §0.5, VirtualFundamentalClass §2.2".
- §1.1: drop "Layer 0" and "Tau Ceti Novikov series".
- §9.3: "*Needs:* §§8.1, 8.3, 9.1".

## R10 (P3) — Three targets do not state their conclusion

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:715–716`: "Record precisely which grading survives without a Fano or monotonicity hypothesis"; line 507: "with multiplicities from the cotangent comparison"; line 367: "Prove their graph-stratum descriptions, degree, properness".

**Claim:** None of the three gives the value to be proved.

**Witness:** On `ℙ¹`, `deg Q = 4`. With `deg Q = 0`, `H⋆H = Q·1` joins degrees 4 and 0, so only a ℤ/4 grading survives. Self-gluing is 2:1 onto its image, because swapping the two branches gives the same point.

**Repair:**
- §8.4: "With `deg Q^β = 2c₁(T_X)·β` both products are homogeneous of degree zero. With `deg Q^β = 0` they are `ℤ/2N_X`-graded, where `N_X ℤ` is generated by `c₁(T_X)·β` for `β ∈ NE(X)`."
- §5.4: "each with multiplicity one".
- §3.5: "Self-gluing has degree 2 onto its image. External gluing has degree 2 when `I = J = ∅` and `(g₁,β₁) = (g₂,β₂)`, and degree 1 otherwise."

## R11 (P3) — The base field is narrower than the sources

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:37`: "Fix an algebraically closed field `k` of characteristic zero" (likewise lines 4 and 74).

**Claim:** No target uses algebraic closure, and the sources work over an arbitrary field.

**Witness:** `behrend-manin-1996` line 530 fixes an arbitrary field `k`. Its Def. 3.13 (lines 1014–1017) admits characteristic `p` for classes bounded by the characteristic.

**Repair:** "Fix a field `k` of characteristic zero". Either add the characteristic-`p` case of Behrend–Manin Def. 3.13 as a target, or exclude it by name in Scope.

## R12 (P3) — Supplier links point at pull requests

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:146–152`: "[StableReductionPartII](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1841)", and likewise for MotivesAndAlgebraicCycles, AlgebraicModuliForArithmeticGeometryPartII and VirtualFundamentalClass.

**Claim:** Four cross-roadmap citations carry pull-request numbers.

**Witness:** Citations name the roadmap and its section, never a pull-request number. Line 143 already uses the right form, `../StableReduction/README.md`.

**Repair:** Link `../StableReductionPartII/README.md`, `../MotivesAndAlgebraicCycles/README.md`, `../AlgebraicModuliForArithmeticGeometryPartII/README.md` and `../VirtualFundamentalClass/README.md`.

## R13 (P3) — The README says its organisation follows its sources

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:940–942`: "The geometric spine follows Behrend–Manin, Behrend–Fantechi, and Behrend. The axioms and WDVV organization follow Kontsevich–Manin and Fulton–Pandharipande…"; line 3: "This roadmap constructs of algebraic Gromov–Witten theory".

**Claim:** A roadmap may not say that it follows a source, and line 3 is ungrammatical.

**Witness:** The principles forbid a roadmap from saying it follows a source. The References already say what each work is cited for.

**Repair:** Delete `## Acknowledgements`. Change line 3 to "This roadmap constructs algebraic Gromov–Witten theory for …".

## R14 (P3) — §3.1's new locator names the wrong section

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:321–322`: "Prove effective fppf descent and invariance of the class condition in connected families (Behrend–Manin §3)."

**Claim:** "§3" is a whole section, and the local constancy of the class is in §2.

**Witness:** `behrend-manin-1996` lines 466–474 (§2, p. 12): the homology class of a family is locally constant. The fppf stack is Def. 3.13, lines 1009–1012, p. 25.

**Repair:** "(Behrend–Manin §2, p. 12, the paragraph before Lemma 2.2, for local constancy of the class; Def. 3.13, p. 25, for the fppf stack)".

## R15 (P3) — Six new Checks restate a definition or a theorem, and one uses "degree" for codimension

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:241, 267, 708, 744, 817, 844, 195`: "The zero class gives the monomial `Q⁰ = 1`."; "The commutator with multiplication by `t^a` is multiplication by `z`."; "the degree-zero and degree-one classes are dual".

**Claim:** These Checks hold for the wrong objects too, or restate a definition or a theorem of their own section. Line 195 says "degree" for codimension, while the Conventions give `H_X^p` degree `2p`.

**Witness:** Line 241 is the pinned `single_zero_one` (`TauCeti/RingTheory/NovikovSeries/Multiplication.lean:291`). Line 817 is §10.1's relation at `f = t^a`. Line 744 also holds for `∂ − z⁻¹C`. Line 844 holds for every `D`-linear operator.

**Repair:**
- 241: "On `ℙ¹`, `δ_H(Q²) = 2Q²`; an unweighted derivation gives `0` or `Q²`."
- 267: "On `ℙ¹`, `δ_H(Q² t_H³) = 2Q² t_H³`; an extension that also differentiates in `t_H` adds `3Q² t_H²`."
- 708: "For a point, `1 ⋆_t 1 = 1` for every `t`, since `∂_t³(t³/6) = 1`."
- 744: "On `ℙ¹` at `t = 0`, `∇_H − ∂_H` has matrix `z⁻¹[[0,Q],[1,0]]` in the basis `(1,H)`; the opposite sign gives its negative."
- 817: "On `ℙ¹`, `z∂_H · H = Q e^{t_H}·1`."
- 844: "On `ℙ¹`, `(zδ_H + H⋆small)(Q·1) = zQ·1 + Q·H`."
- 195: "On the projective line the codimension-zero and codimension-one classes are dual: `(1,pt) = 1` and `(1,1) = (pt,pt) = 0`."

## R16 (P3) — Downstream consumers names no section

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:898–900`: "Mirror comparison for projective targets uses the genus-zero product, the small quantum connection and the divisor-slice comparison."

**Claim:** The section names no roadmap and no section of this roadmap, so a consumer cannot tell which targets it imports.

**Witness:** `roadmaps grep 'AlgebraicGromovWitten'` finds no citing roadmap on main or at the open heads. The Downstream consumers section of StableReduction on main names the consuming roadmap and the layers it consumes.

**Repair:** "Mirror theorems for projective targets consume the small product (§8.1), the small connection and small quantum `D`-module (§§10.3–10.4) and the divisor slice (§10.5). Enumerative reconstruction for particular targets consumes the invariants and their equations (§§5.2, 6.1–6.5) and WDVV (§7.2)."

## Previous findings

- R01 — not repaired: §6.4, lines 571–573: "After applying an outgoing evaluation pushforward on each separate component, apply the projection formula to derive numerical inverse-metric contraction for separating gluing."
- R02 — partly repaired: §3.1 now cites "(Behrend–Manin §3)", which is wrong (R14). The other 29 targets still have no locator, among them §7.2 WDVV (lines 619–633).
- R03 — not repaired: lines 347–348: "together with the stable-map extension argument in Behrend–Manin Thm. 3.14 and Cor. 4.8."
- R04 — not repaired: line 542 "(Kontsevich–Manin 1994, §2.2)"; §6.2 has no locator; line 563 "(Kontsevich–Manin 1994, §2.2, and Iritani Prop. 2.3)"; line 584 "(Kontsevich–Manin 1998, Cor. 1.3)".
- R05 — not repaired: lines 777–779: "with identity constant term … See Iritani §2.3 and Prop. 2.3 for the formal solution convention."
- R06 — not repaired: line 387: "(Behrend 1997, §3)".
- R07 — not repaired: line 113: "the Novikov and parameter-adic topology specified in Layer 1". §1.4 and its new Checks name no topology.
- R08 — partly repaired: twelve definitions gained three bulleted Checks, and `## Downstream consumers` exists. There are still no API lists. `Mpre`, `S` and `D_big,z` have no Checks, and `φ` has one. Lines 649 and 724 are unchanged.
- R09 — not repaired: there are still 45 *Needs:* lines with 11 distinct values. Line 801 (§10.1): "*Needs:* Layers 1 and 6–9."
- R10 — not repaired: lines 715–716 "Record precisely which grading survives…"; line 507 "with multiplicities from the cotangent comparison"; line 367 "graph-stratum descriptions, degree, properness".
- R11 — not repaired: line 37: "Fix an algebraically closed field `k` of characteristic zero".
- R12 — not repaired: lines 146–152 still link `…/pull/1841`, `…/pull/1313`, `…/pull/1754` and `…/pull/1996`.
- R13 — not repaired: line 3 "This roadmap constructs of algebraic Gromov–Witten theory"; lines 938–942 `## Acknowledgements` "The geometric spine follows Behrend–Manin…".

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| 0.1 Checks | point; `ℙ¹`; elliptic `E`, `p−q` | `(1,1)=1`; codim 0 and 1 dual; `p−q ↦ 0` | `deg[pt]=1`; `(1,pt)=1`, `(1,1)=(pt,pt)=0`; `deg(p−q)=0`, so numerically trivial | true; "degree" wording (R15) |
| 1.2 Checks | `ℙ¹`, `ω_A=id`; `cω_A`, `c>0` | `Λ=ℚ⟦Q⟧`; same series; `Q⁰=1` | `finite_lt` automatic on `ℕ`; `{cω<C}={ω<C/c}`; `single_zero_one` | true; `Q⁰=1` restates library (R15) |
| 1.4 Checks | one parameter `t` | coefficient of `tᵐ` in `(1−Q^βt)⁻¹` is `Q^{mβ}`; `t=0` gives `Λ_X` | geometric series, constant term 1 invertible; constant-coefficient map is onto | true; `δ_D(tᵃ)=0` restates extension (R15) |
| 3.1 Checks, locator | `β=0`, stable `(g,n)`; `(0,2,0)`; `ℙ¹`, `(0,0,1)` | `Mbar g n × X`; empty; a point | stable source mapped to a point; unstable; degree-1 maps modulo `Aut ℙ¹`, trivial stabiliser | true; locator in §2 (R14) |
| 5.1 Checks | `β=0`; `(0,3,0)`; `Mbar_{0,4}` | `ψᵢ` pulled back; `ψᵢ=0`; `deg ψᵢ=1` | universal curve `C_{g,n}×X`; pulled back from `Mbar_{0,3}=pt`; `ψ₁` is one boundary point | true |
| 5.2 Checks | `ℙ¹`, `(0,2,1)`, `pt,pt`; point, `(1,1)`, `τ₁(1)`; `(0,3,0)` | 1; `1/24`; zero unless codim `d` | vdim `−2+2+2=2`, `(ev₁,ev₂)` birational; `∫ψ₁` over `Mbar_{1,1}` is `1/24`; vdim `=d` | true |
| 7.1 Checks | point; `β=0`; `ℙ²`, `β=2` | `t³/6`; classical cubic; coefficient 1 | only `n=3`; only `n=3` as `dim Mbar_{0,n}=n−3`; vdim `−1+n+6=2n`, `n=5`, `N₂=1` | true |
| 8.1 Checks / headline 4 | point; `ℙ¹`; `ℙ^r` | `1⋆1=1`; `H⋆H=Q·1`; `H^{⋆(r+1)}=Q` | `(H⋆H,H)=Q⟨H,H,H⟩_{0,1}=Q`, `(H⋆H,1)=0`; FP §10 | true |
| 8.3 Checks | `ℙ¹` | `H⋆_tH=Qe^{t_H}·1`; no `t⁰`-dependence; `t=0` gives `⋆small` | `F₀=(t⁰)²t_H/2+Qe^{t_H}`, `F_HHH=Qe^{t_H}`, `F_{HH0}=0`; `F_{0bc}=g_bc` | true; third restates §8.3 (R15) |
| 9.1 Checks | point; `ℙ¹` | `∂_t+z⁻¹`; `[∇_0,∇_H]=0`; `z⁻¹`-terms cancel | opposite sign gives `∂_t−z⁻¹`; `z⁻¹∂_0C_H=0`; cancellation also for `∂−z⁻¹C` | true; third not discriminating (R15) |
| 10.2 Checks | point | `z∂_t+1`; `[z∂_a,tᵃ]=z`; `exp(−t/z)` in completion | `T_0⋆=id`; §10.1 relation at `f=tᵃ`; `tⁿ`-coefficient `(−1)ⁿz^{−n}/n!`, not in `ℚ⟦t⟧[z,z⁻¹]` | true; second restates §10.1 (R15) |
| 10.4 Checks | `D=0`; `Q^β`; `ℙ¹` | 0; `z(D·β)Q^β`; `1↦H`, `H↦Q·1` | true of any `D`-linear operator; `degreeDerivation_single`; `H⋆1=H`, `H⋆H=Q` | true; first not discriminating (R15) |
| Downstream consumers | main and open heads | "Mirror comparison … reconstruction problems" | no citing roadmap; no section named | R16 |
| 6.4 separating splitting (R01) | `E`; `u=pt, v=1`; Chow lift `γ₀=p−q` | contraction stated for classes | numbers: both sides 1; `γ₀ ≡ 0` numerically, `I(…,γ₀)` not shown zero in Chow | class level undefined |
| 9.4 normalisation (R05) | `ℙ¹` | `L(Q,0)=id` | Iritani Prop. 2.3 i): `L(0,0)=id`; `Q`-term `⟨H,H⟩_{0,2,1}Q=Q≠0` | conventions differ |
| 4.1 rank (R06) | `ℙ¹`, `g=0`, `β=1` | `1+2=3` | `h⁰(O(2))=3`; `behrend-1997` lines 159–161 | value true; "§3" absent |
| 1.4 topology (R07) | `Σ_d Q^d` | topology unstated | converges coefficientwise; not `t`-adically Cauchy with `Λ_X` discrete | unstated |
| 8.4 grading (R10) | `ℙ¹` | conclusion unstated | `deg Q=4`; with `deg Q=0`, `H⋆H=Q·1` joins degrees 4 and 0: ℤ/4 | unstated |
| 3.5 gluing degree (R10) | self-gluing | "degree" unstated | swapping the branches gives the same point: degree 2 | unstated |
| 3.3 properness (R03) | `ℙ¹`, `(0,0,1)` | a point, proper | BM Cor. 4.8 (lines 1137–1139) defers the `ℙ^r` extension to a preprint | locator overclaims |
| 6.3 divisor (R04) | `ℙ¹`, `⟨H,H,H⟩_{0,3,1}` | `(H·β)⟨H,H⟩_{0,2,1}` | `1·1=1` | value true; descendant locator absent |

Rows for the other untouched statements stand as in the previous review, of 103a9db.

- Gate on 1949322: the worker's gate passed every check (build 0, depcheck 0).
  - My run, against the content repository's order, reports only `depcheck: NOT IN ORDER: AlgebraicGromovWittenTheory (insert it after its last supplier)`. The candidate order lists the roadmap at line 320, so this is not a finding.
  - Dependency check against the candidate order: `depcheck: 229 roadmaps, 2060 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
  - Nothing changes outside the folder.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output. The file declares nothing and the diff does not touch it, so neither the `#check` comparison nor the one-tactic probe applies.
- Source locators checked against the texts: 6.
  - Behrend–Manin: §2 p. 12 (lines 466–474), Def. 3.13 (lines 1009–1017), Cor. 4.8 (lines 1137–1139) and line 530.
  - Behrend 1997: headings (lines 81, 120) and rank (lines 157–161).
  - Iritani: Prop. 2.3 (lines 385–390).
- Tau Ceti declarations opened at the pin: `TauCeti.NovikovSeries` (`TauCeti/RingTheory/NovikovSeries/Basic.lean:92`), `single_zero_one` (`Multiplication.lean:291`), `degreeDerivation` (`Derivation.lean:70`) and `degreeDerivation_single` (`Derivation.lean:110`).
- Cross-roadmap: `roadmaps grep AlgebraicGromovWitten` finds no consumer. The overlap check finds no open pull request that drops or changes an id this roadmap cites. The diff adds no object, so ownership is as in the previous review.
- The diff touches 13 sections, and every new Check was recomputed (table rows 1–13). Of the seeded sample, the changed targets are 3.1, 5.1, 5.2, 8.1 and 10.4.
- Pull-request text: the title and description match this head. It is a new roadmap, and the change adds Checks, one locator and Downstream consumers. It removes no section, headline or supplier.

## Not verifiable

- Fulton, *Intersection Theory*: not open access. It is cited without a locator.
- Dubrovin 1996: cited without a locator, so there is nothing to check against.

## Source issues

- none
