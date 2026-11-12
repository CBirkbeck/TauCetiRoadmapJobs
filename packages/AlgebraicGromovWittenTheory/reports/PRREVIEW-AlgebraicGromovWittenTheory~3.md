# Review of AlgebraicGromovWittenTheory (pull request #1998 at 9b70e32)

**Verdict:** needs changes

## R01 (P1) — Over a non-closed field, the curve classes miss geometric curves, and WDVV and associativity fail

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:37, 93–96`: "Fix an field `k` of characteristic zero"; "`NE(X)` is the submonoid of classes represented by effective integral one-cycles."

**Claim:** `NE(X)` is built from one-cycles over `k`, but over a non-closed `k` a geometric fibre of a stable map can push forward to a class outside `NE(X)`. The splitting sum over `β₁+β₂=β` in `NE(X)` then misses boundary strata, so §6.4, WDVV (§7.2) and associativity (§§8.2–8.3) fail.

**Witness:** Take a non-split quadric surface `Q` over ℚ. Every curve defined over ℚ has even `H`-degree, while a geometric line has `H`-degree 1. Without the odd classes, `H⋆H = 2pt`, `H⋆pt = 0` and `pt⋆pt = s²·1`. So `(H⋆H)⋆pt = 2s²` but `H⋆(H⋆pt) = 0`.

**Repair:** This keeps the field arbitrary, as Behrend–Manin do (§3, line 530).
- In Conventions (lines 93–96) and §1.1, let `N₁(X)_ℤ ⊂ Hom(N¹(X),ℤ)` be the classes `L ↦ deg(L|_C)` of one-cycles `C` on `X_k̄`, and let `NE(X)` be the classes of the effective ones (Behrend–Manin §2, p. 12, and Def. 3.2(2)).
- Add to §1.1: each such class is `1/m` times the class of its Galois-orbit sum, a `k`-cycle. So it lies in `NE(X/k)_ℚ`, and the finiteness argument of §1.1 still applies.
- Write "a field" at lines 4, 37 and 78.

Test on `Q/ℚ`: `NE(Q) = ℕ` in `H`-degree, the `s`-terms return (`H⋆H = 2s+2pt`, `H⋆pt = sH`), and both sides of the triple product equal `2s²+2s·pt`. The other option is to restore "an algebraically closed field" at lines 4, 37 and 78.

## R02 (P2) — §5.4 states the cotangent-line comparison as a divisor identity on the stack; it holds only after capping with the virtual class

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:620–622`: "Identify the class `ψ_i - st^*ψ_i^curve` as the sum of boundary divisors where the marked rational tail is contracted by stabilization, each with multiplicity one."

**Claim:** Where a stable-map stack has components of excess dimension, the contracted-tail locus is not a divisor. The cited Kontsevich–Manin 1998 Thm. 1.2 states the comparison only for correlators against the virtual class.

**Witness:** In `MbarMap 1 1 ℙ² 3`, take the maps that contract an elliptic component and carry marking 1 on a degree-3 rational tail. They form a component of dimension `1+10 = 11`, which exceeds vdim 10. On that component the comparison map `st^*L₁ → L₁` vanishes identically.

**Repair:** Replace the sentence with: "Prove `(ψ_i − st^*ψ_i^curve) ∩ [MbarMap g n X β]vir = Σ_{β₁+β₂=β, β₁≠0} ι_*Δ^!([MbarMap 0 {i,•} X β₁]vir × [MbarMap g (([n]∖{i})∪{•}) X β₂]vir)`, with `ι` the external gluing of §3.5 (Kontsevich–Manin 1998, Thm. 1.2, p. 2, in correlator form)." Test it on the Layer 5 Example on ℙ¹, with insertions `τ₁(H), H, 1` and `β = 1`. The left side is `1 − 0 = 1`. The right side is `⟨H,H⟩_{0,2,1}·g^{H1}·⟨1,H,1⟩_{0,3,0} = 1·1·1 = 1`.

## R03 (P3) — §6.5 states no recursion, and its Kock locator assumes a homogeneous target

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:731–732`: "prove genus-zero topological recursion for descendants … For the relation with arbitrary remaining markings use Kock, *Notes on psi classes*, §5.4."

**Claim:** The target names the relation but gives no formula. The cited section covers only projective homogeneous targets, not the general `X` of this roadmap.

**Witness:** `kock-psi-notes` line 1795 (§5.0.1, p. 48) restricts §5 to genus zero and projective homogeneous `X`. The proof of 5.4.1 (line 2176, p. 56) writes `ψ₁` as boundary divisors on that smooth stack.

**Repair:** State the relation: "For `n ≥ 3`, `⟨τ_{a₁+1}(γ₁)τ_{a₂}(γ₂)τ_{a₃}(γ₃)∏_{i∈S}τ_{a_i}(γ_i)⟩_{0,β} = Σ_{β₁+β₂=β} Σ_{S₁⊔S₂=S} Σ_{e,f} ⟨τ_{a₁}(γ₁)τ₀(T_e)∏_{S₁}⟩_{0,β₁} g^{ef} ⟨τ₀(T_f)τ_{a₂}(γ₂)τ_{a₃}(γ₃)∏_{S₂}⟩_{0,β₂}`, unstable factors being zero."
- Cite its proof as: Kontsevich–Manin 1998 Thm. 1.2 (p. 2), with `ψ₁ = D(1|2,3)` on `Mbar 0 n` (Kock 1.5.2, p. 15) and §6.4.
- Cite Kock 5.4.1 (p. 56) as the homogeneous case.

Test: for the point target with `n = 4`, the left side is `∫ψ₁ = 1`. On the right, `S₁ = {4}` gives `1·1·1 = 1` and `S₁ = ∅` is unstable, so the total is 1.

## R04 (P3) — Five locators are missing or point at the wrong passage

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md`:
- §2.1 (316–321) and §9.4 (972–977) have no locator.
- Line 403: "Fulton–Pandharipande §3, Thms. 1–2".
- Line 447: "Behrend–Manin §2 for graphs".
- Line 666: "the forgetting formula in §1.4".

**Claim:** §2.1 and §9.4 state results with no source. The other three cite passages that do not contain the claim.

**Witness:**
- `fulton-pandharipande-1997` lines 581–611: Thm. 1 is the coarse space, and Thm. 2 covers only convex targets in genus zero. FP §3 (line 729) is the rigidification for `ℙ^r`.
- `behrend-manin-1996` line 99: graphs are §1.
- `kock-psi-notes` line 310: the forgetting formula is Lemma 1.3.1.

**Repair:**
- §2.1: add "(Behrend 1997, Prop. 2, p. 3)".
- §3.2: "Fulton–Pandharipande §2.3 (boundedness, p. 13), §§3–4 (the rigidified parameter space for `ℙ^r`, pp. 14–26) and §5.1 (the subscheme for `X ⊂ ℙ^r`, proof of Thm. 1, p. 26)".
- §3.5: "Behrend–Manin §1, Defs. 1.1–1.12 (pp. 4–10), for graphs; Props. 2.4–2.5 (pp. 12–13) for gluing curves; Thm. 3.6 (p. 16) for the induced maps".
- §6.1: "the forgetting formula, Kock Lemma 1.3.1, p. 12".
- §9.4: "(the defining equation of a fundamental solution: Iritani (2.8), p. 8)".

## R05 (P3) — §§9.2, 10.3 and 10.5 cite Iritani passages that do not contain the claim

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:944, 1054, 1091`: "Iritani §2.1"; "Source: Iritani §2.1, the small connection."; "Source: Iritani Prop. 2.3 for the divisor equation."

**Claim:** §2.1 defines the twisted invariants and products and contains no connection. Prop. 2.3 iv) is a divisor equation for `L`, not the identification of the divisor slice.

**Witness:** `iritani-2008` lines 131–239 (§2.1, pp. 4–5) contain no connection. The small and big connections and their flatness are Def. 2.2, lines 310–317 (p. 7). The divisor-slice substitution is the Remark at lines 214–239 (p. 5).

**Repair:**
- §9.2: "Iritani Def. 2.2, p. 7".
- §10.3: "Iritani Def. 2.2, p. 7, the operators `ℏQ_a∂_{Q_a} + p_a∗`".
- §10.5: "Iritani §2.1, the Remark after (2.5), p. 5, and the paragraph after Def. 2.2, p. 7".

## R06 (P3) — The supplier contracts omit the stable-map graph API and power-series API that the pinned libraries already have

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:139–142, 290`: "Use `PrestableMap`, its evaluation and degree maps, scheme-level `Chow.ChowGroup` and `LineBundleClass.IsAmple`."; "Prove continuity of coefficient extraction".

**Claim:** §§3.1 and 3.4–3.5 build the stability criterion, stabilization and gluing combinatorics, and §1.4 restates coefficient continuity. All of these exist at the pins and are not cited.

**Witness:**
- `TauCeti/AlgebraicGeometry/Curves/StableMaps/DualGraph/Basic.lean:105` `IsStable`.
- `Clutching.lean:77,177` `clutch`/`selfClutch`.
- `Stabilization.lean:64` `exists_iso_of_reflTransGen_of_isStable`.
- `Contracted.lean:95`.
- `Mathlib/RingTheory/MvPowerSeries/PiTopology.lean:114` `continuous_coeff`.

**Repair:**
- Add to "From Tau Ceti": "`TauCeti.DualGraph.DegreeDecoration.IsStable` and `isStable_iff_weightedLogCanonicalDegree_pos`, `DegreeDecoration.clutch` and `selfClutch`, `DegreeDecoration.StabilizationStep` and `exists_iso_of_reflTransGen_of_isStable` (`AlgebraicGeometry/Curves/StableMaps/DualGraph/`), and `PrestableMap.IsContractedComponent` (`…/StableMaps/Contracted.lean`), for §§3.1, 3.4–3.5."
- Add to "From Mathlib": "`MvPowerSeries.WithPiTopology.continuous_coeff`, `MvPowerSeries.pderiv`, `MvPowerSeries.subst` with `hasSubst_of_constantCoeff_zero`, and `MvPowerSeries.isUnit_iff_constantCoeff`."
- In §1.4, delete "coefficient extraction". Add: "Mathlib's `continuous_subst` assumes discrete coefficients; continuity of `pderiv` and `subst` over `Λ_X` is new here."

## R07 (P3) — Nine definitions have no Checks, and two Checks do not discriminate

**Location:** §§1.1, 2.3, 3.4, 3.5, 4.1, 4.3, 5.4, 9.4 and 10.3 have **API.** but no **Checks.** `README.md:927`: "The order-`z⁻¹` terms … cancel in the paired connection formula". Line 968: "the pairing matrix is `[[0,1],[1,0]]`".

**Claim:** The nine definitions have no tests. Line 927 also holds for the opposite sign convention. Line 968 also holds for the unsigned pairing and repeats §6.4's third Check.

**Witness:** Take `∇' = ∂ − z⁻¹C`. Then `S(∇'s₁,s₂)+S(s₁,∇'s₂) = ∂S + z⁻¹[(Cs₁(−z),s₂) − (s₁(−z),Cs₂)] = ∂S` by Frobenius. On constant sections both pairings equal `g`.

**Repair:**
- §1.1: "On `ℙ¹×ℙ¹` with `A=(1,1)`, six classes have `ω_A ≤ 2`. The nef class `(1,0)` has the infinite slice `{(0,m)}`."
- §2.3: "On `Mpre 0 3`, the curve `ℙ¹∪ℙ¹` with markings 1, 2 on one component and 3 on the other stabilizes to the point `Mbar 0 3`."
- §3.4: "On `MbarMap 0 1 ℙ¹ 1`, `ev₁` is an isomorphism onto `ℙ¹`."
- §3.5: "Self-gluing `MbarMap 0 {1,a,b} X 0 ×_{X×X} Δ_X → MbarMap 1 1 X 0` has degree 2 onto its image."
- §4.1: "On ℙ¹ at `(0,0,1)`, `Rπ_*f^*T = H⁰(O(2))` has rank `3 = 1+2`. On an elliptic curve at `(1,1,0)`, `R⁰` and `R¹` both have rank 1."
- §4.3: "On an elliptic curve, `[MbarMap 1 1 E 0]vir = −λ₁ ∩ [Mbar 1 1 × E]`, so `⟨τ₀(pt)⟩_{1,0} = −1/24`. The fundamental class has dimension `2 ≠ 1`."
- §5.4: "For the point target, `I_{g,n,0}(1,…,1) = [Mbar g n]`. On ℙ¹, `I_{0,3,1}(pt,pt,pt) = [Mbar 0 3]`."
- §9.4: "For the point target, the `t^m`-coefficient is `(−1)^m z^{−m}/m!`."
- §10.3: "On ℙ¹, `∇^small_H(Q·1) = Q·1 + z⁻¹Q·H`. The unweighted `∂_Q` gives `1 + z⁻¹Q·H`."
- Replace line 927 with: "For the point, `exp(−t/z)` is horizontal. For `∂_t − z⁻¹` the horizontal section is `exp(t/z)`."
- Replace line 968 with: "On ℙ¹ at the origin, `S(∇_H1,1)+S(1,∇_H1) = −z⁻¹+z⁻¹ = 0 = ∂_H S(1,1)`. Without the involution the sum is `2z⁻¹`."

## R08 (P3) — The Summary refers to the symplectic roadmap without naming it

**Location:** `TauCetiRoadmap/AlgebraicGromovWittenTheory/README.md:20`: "The symplectic Gromov–Witten roadmap owns the analytic stable-map theory." Scope and ownership (lines 72–89) does not mention it.

**Claim:** No roadmap is named, so a reader cannot tell what is left to which owner.

**Witness:** At the head of GromovWittenTheory (#990), its Scope owns `I_(g,n,A)` on `H^*(X;ℚ)`, the quantum product and topological recursion. AnalyticStableMaps (#987) owns the analytic stable-map carrier.

**Repair:** Delete line 20. Add to Scope and ownership: "GromovWittenTheory owns the symplectic invariants of closed symplectic manifolds, and AnalyticStableMaps owns the analytic stable-map carrier. This roadmap builds the algebraic invariants on numerical Chow and does not compare them with the symplectic ones."

## Previous findings

- R01 — repaired: §6.4, lines 701–716, gives the scalar formula, and end goal 2 (lines 50–52) separates the Chow and numerical statements.
- R02 — partly repaired: every target listed now has a source. §§3.2, 3.5 and 6.1 cite the wrong passage (R04), §§9.2 and 10.3 likewise (R05), and §2.1 and §9.4 have none (R04).
- R03 — repaired: line 412 cites Fulton–Pandharipande §4.2, Props. 5–6, and Behrend–Manin Cor. 4.8 and Thm. 3.14.
- R04 — repaired except in two places: §6.5's Kock §5.4 covers only homogeneous targets (R03), and §6.1's "§1.4" should be §1.3 (R04).
- R05 — repaired: line 977.
- R06 — repaired: line 466, "(Behrend 1997, 'The Virtual Fundamental Classes', p. 5, after Prop. 4)".
- R07 — repaired: lines 131–132 and 286–288 name `MvPowerSeries.WithPiTopology`.
- R08 — repaired for `Mpre`, `S`, `D_big,z` and `φ`, and at lines 808 and 902. Nine other definitions still lack Checks (R07).
- R09 — repaired: *Needs:* lines are now per target, for example line 1011, "§1.4 and Mathlib `Derivation`".
- R10 — repaired: lines 888–892, 442–445 and 622. The new wording at 620–622 overclaims (R02).
- R11 — repaired as requested (line 37). The request was wrong, because dropping algebraic closure breaks the curve classes (R01).
- R12 — repaired: lines 153–159.
- R13 — repaired: Acknowledgements is gone and line 3 is fixed.
- R14 — repaired: line 380.
- R15 — repaired: lines 209, 269, 302, 881, 926, 1038 and 1079.
- R16 — repaired: lines 1146–1148.

## Verified sound

| Statement | Instances | Roadmap side | Independent value | Result |
|---|---|---|---|---|
| 1.3 ample independence | `ℙ¹×ℙ¹`, `A=(1,1)`, `A'=(1,2)` | same `Λ_X` | `a+b ≤ 2a+b ≤ 2(a+b)` on `ℕ²`; Kleiman, AlgebraicModuli…PartII §1.7(iii) | true |
| 1.4 topology | one parameter; `(1−Q^βt)⁻¹` | Pi topology; `t^m`-coefficient `Q^{mβ}` | geometric series; finitely many parameters: Pi = parameter-adic | true; restates `continuous_coeff` (R06) |
| 2.1 prestable stack | `Mpre 0 0`; `Mpre 1 1` | −3; 1 | Behrend Prop. 2: `n−3(1−g)` gives −3, 1 | true; no locator (R04) |
| 2.2 stable locus | Behrend Lemma 1 | open substack | `behrend-1997` lines 86–91, p. 3 | true |
| 3.2 quotient presentation | FP Thms. 1–2 | "projective parameter construction" | Thm. 1 coarse space p. 11; Thm. 2 convex genus 0, p. 12 | wrong locator (R04) |
| 3.5 gluing degrees | self-gluing; `I=J=∅`, equal labels | 2; 2; else 1 | branch swap fixes the point; half swap when types agree | true; BM §2 ≠ graphs (R04) |
| 5.2 descendants | ℙ¹ `(0,2,1)`, `pt,pt`; point `(1,1)`, `τ₁` | 1; `1/24` | vdim 2, one line map; `∫_{Mbar 1 1}ψ₁ = 1/24`; KM98 eq. (1), p. 2 | true |
| 5.4 codimension | general | `c+d(g−1)−c₁·β` | `3g−3+n−(vdim−c)` simplifies to the same | true |
| 5.4 ψ comparison | `MbarMap 1 1 ℙ² 3` | divisor, multiplicity one | excess component of dim 11 > 10, section ≡ 0 | false at class level (R02) |
| 5.4 virtual form | ℙ¹, `τ₁(H),H,1`, `β=1` | — | LHS `1−0`; RHS `⟨H,H⟩_{0,2,1}g^{H1}⟨1,H,1⟩_{0,3,0} = 1` | repair holds |
| 6.1 string | ℙ¹ `⟨1,τ₁(H),H⟩_{0,1}`; `(0,3,0)` | `⟨H,H⟩_{0,1}=1`; `deg(γ₁γ₂)` | vdim 3 = codim 3; Kock 4.3.1, lines 1593–1607 | true; "§1.4" (R04) |
| 6.3 divisor | ℙ¹ `⟨H,H,H⟩_{0,1}`; `(1,0,0)` | `(H·β)⟨H,H⟩ = 1`; excluded by Conventions | `1·1 = 1`; KM98 (12), p. 5 | true |
| 6.5 recursion | point, `n=4` | no formula | LHS 1; RHS `S₁={4}`: 1, `S₁=∅` unstable | formula of R03 holds |
| 9.3 flat pairing | point, `exp(−t/z)` | 1; unsigned `exp(−2t/z)` | `e^{t/z}e^{−t/z}=1`; Iritani proof of Prop. 2.3, lines 398–404 | true |
| 9.4 fundamental solution | point; ℙ¹ | `exp(−t/z)`; `L(Q,0)=id` | `t^m`-coefficient `(−1)^m z^{−m}/m!`; Iritani's `L(Q,0)` has a `Q`-term | true; contrast stated correctly |
| 10.2 big module | point; ℙ¹ | `z∂_t+1`; `z∂_H·H = Qe^{t_H}` | `T_0⋆ = id`; `F_HHH = Qe^{t_H}`; Iritani Def. 2.2, p. 7 | true |
| 10.3 small connection | ℙ¹×ℙ¹ | flat by the divisor equation | `(D·β)⟨E,a,b⟩_β = ⟨D,E,a,b⟩_β`, symmetric in `D,E` | true; locator (R05) |
| 6.4 separating splitting | `E`: `(pt,1)`, `(pt,pt)`, `p−q` | 1; 0; same pairing | `deg(pt)=1`, `deg(pt·pt)=0`, `deg(p−q)=0` | true |
| Layer 6 self-gluing | `E`, `β=0` | 0, not 2 | `Δ·Δ = 2−2g = 0`; `Σg^{ef}T_eT_f = 2pt` | true |
| 8.4 grading | ℙ¹ | `ℤ/4` | `c₁·β = 2d`, `N_X = 2` | true |
| 9.1 Check 3 | `∇' = ∂−z⁻¹C` | presented as a sign test | cancellation also holds for `∇'` | not discriminating (R07) |
| Headline 1: vdim | ℙ² `(0,0,1)`; point `(1,1,0)` | 2; 1 | lines in ℙ²: 2; `dim Mbar 1 1 = 1` | true |
| Headline 2: dilaton | `(1,0,0)` | excluded by Conventions | `⟨τ₁(1)⟩_{1,1,0} = χ(X)/24`, Kock p. 45 | exclusion needed and present |
| Headline 3: WDVV | ℙ², `d=2` | `N₂=1` | `N₁²(C(2,1)−C(2,2)) = 1` | true over `k̄` |
| Headlines 3–4 over ℚ | non-split quadric | associative | `(H⋆H)⋆pt = 2s²`, `H⋆(H⋆pt) = 0` | false (R01) |
| Headline 4: small QH | ℙ¹; `ℙ^r` | `H⋆H=Q`; `H^{⋆(r+1)}=Q` | `⟨H,H,H⟩_{0,1}=1`; FP §10 | true |
| Headline 5: big QH | point; ℙ¹ | `1⋆_t1=1`; `Qe^{t_H}` | `∂³(t³/6)=1`; `F₀ ∋ Qe^{t_H}` | true |
| Headline 6: connection | point; ℙ¹ | `∂_t+z⁻¹`; flat | `C_0=id`; `∂_0F_{abc}=0`, `[C_0,C_H]=0` | true |

- **Source locators checked against the texts: 44.**
  - Behrend 1997: 6.
  - Behrend–Manin: 8.
  - Fulton–Pandharipande: 4.
  - Kontsevich–Manin 1994: 5.
  - Kontsevich–Manin 1998: 7.
  - Kock: 7.
  - Iritani: 5.
  - Behrend product formula: Thms. 1 and 9.
- **Library declarations opened at the pins: 28.**
  - `TauCeti.NovikovSeries` (`RingTheory/NovikovSeries/Basic.lean:92`), `degreeDerivation` (`Derivation.lean:70`), `continuous_degreeDerivation` (`:135`), `domCongr` (`Equiv.lean:55`) and `rescaleContinuousAlgEquiv` (`:192`).
  - `PrestableMap` (`Curves/StableMaps/Basic.lean:73`) and `Chow.ChowGroup` (`Chow/Basic.lean:295`).
  - Mathlib: `MvPowerSeries.pderiv` (`Derivative.lean:117`), `continuous_subst` (`Substitution.lean:324`, discrete coefficients only) and `isUnit_iff_constantCoeff` (`Inverse.lean:136`).
- **Cross-roadmap citations resolved: 34; all exist.**
  - On main: SchemeAndStackFoundations Layer 1, §§1.10, 4.14 and 4.15 (`StableCurves.Mbar`, line 7056) and Layer 5. StableReduction Layers 9–11. AlgebraicVectorBundles L1A–L2B. DerivedModuleAlgebra §§0.4 and 0.25. EnhancedDerivedSheaves §0.3 and E1.8.
  - At open heads: StableReductionPartII at c7fcbbe, §§3.1–3.3 and 3.11. MotivesAndAlgebraicCycles at 1ef618d, §§0.5 and 3.1. AlgebraicModuliForArithmeticGeometryPartII at 36adfc3, §§1.1–1.2, 1.4 and 1.7(iii). VirtualFundamentalClass at cd5dcf5, §§2.2–2.5, 3.3, 6.1, 7.3 and 9.2, and Layers 2, 3 and 6–9.
- **Ownership:**
  - VirtualFundamentalClass's Scope excludes the stable-map obstruction theory, so §§4.1–4.3 are owned here.
  - StableReductionPartII owns only the stable pointed stack, so `Mpre` is owned here.
  - GromovWittenTheory works on `H^*(X;ℚ)`, a different carrier.
  - The board package VirtualFundamentalClasses comes after this roadmap in the merge order (line 405 against 321) and restates §§4.1–4.3 in its Layer 11. That package must cite this roadmap.
- **Gate:** the worker's gate passed every check on 9b70e32. The dependency check printed `depcheck: 223 roadmaps, 1969 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder, and the overlap check found none.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/AlgebraicGromovWittenTheory/Suggested.lean` exits 0 with no output.
  - The file declares nothing, so neither the `#check` comparison nor the one-tactic probe applies.
  - None of headlines 1–6 is statable at the pins: there are no algebraic stacks and no rational Chow groups of Deligne–Mumford stacks. The docstring says so.
- **Pull-request text:** the title and description match the head. It is a new roadmap; no section, headline or supplier is removed.

## Not verifiable

- Fulton, *Intersection Theory*: not open access, and it is cited without a locator.
- Dubrovin 1996: cited without a locator, so there is nothing to check against.

## Source issues

- **Misprint** in kontsevich-manin-1998 at §1.1, p. 2: the source says the stable range is `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`, as Theorem 1.2 uses; affects nothing.
- **Misprint** in kock-psi-notes at 4.3.2, p. 45: the source writes the summand of the divisor equation with index `i`, as `τ_{k_i−1}(γ_i ∪ D)`, inside the sum over `j`; it should be `τ_{k_j−1}(γ_j ∪ D)`; affects nothing.
- **Gap** in kontsevich-manin-1998 at Theorem 1.2, p. 2: the source gives only a sketch and defers the virtual-class argument to a later text; it should give the argument through the pullback property of the virtual classes; affects the proof.
- **Gap** in kock-psi-notes at 4.3.1, p. 44: the source defers the proofs of the string and dilaton equations for stable maps to Section 6, which leaves them unfinished; it should derive them from virtual-class pullback along forgetting; affects the proof.
