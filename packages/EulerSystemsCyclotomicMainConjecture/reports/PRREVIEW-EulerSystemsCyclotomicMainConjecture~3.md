# Review of EulerSystemsCyclotomicMainConjecture (pull request #1311 at 4408ed4)

**Verdict:** needs changes

This is an incremental re-review of the 78 README lines changed since 9fc63e3, together with what they cite and what cites them. The merge from main also moved the pins to Lean `v4.36.0-rc2`, Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. Because of that, the gate, the elaboration and the padding probe were all rerun.

## R01 (P1) — The targeted build fails the gate on the module-system warning

**Location:** `TauCetiRoadmap/EulerSystemsCyclotomicMainConjecture/Suggested.lean:1`: “`import Mathlib`”.

**Claim:** At the new pins, `lake build TauCetiRoadmap.EulerSystemsCyclotomicMainConjecture.Suggested` emits a warning that is not a `sorry` warning. The gate counts it twice and reports `build=2 FAIL`, and an acceptance needs a passing gate. The file itself is unchanged; the warning comes from the pins that the merge from main brought in.

**Witness:** The gate rerun with `--build` on this head reports: “imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file” (twice), `build=2 FAIL`.

**Repair:** Make `module` the first line, followed by a blank line and the existing imports. IntegralIwasawaTheory's `Suggested.lean` does exactly this at its head. Main's `TauCetiRoadmap/AffineMorseLefschetz/Suggested.lean:1–5,35` uses the longer form, with `public import` and `public section`. Tested: scratch copies in both forms elaborate under `lake env lean` with exactly five `sorry` warnings and nothing else.

## R02 (P2) — IntegralIwasawaTheory §4.1e and `bakerBrumer_expDisc_linearIndependent` do not exist at that roadmap's head

**Location:** `README.md:223`: “where the disc form `bakerBrumer_expDisc_linearIndependent` of §4.1e applies … Sections 4.1a–4.1e of IntegralIwasawaTheory prove that disc form”. The same citation appears in §4.18 step 7 (line 3101) and in its *Needs:* (line 3145): “IntegralIwasawaTheory §4.1e (`bakerBrumer_expDisc_linearIndependent`, …)”.

**Claim:** This supplier citation, which also appears in a *Needs:* line, names a section and a declaration that IntegralIwasawaTheory does not define at its open head. The README also says something false about that supplier: that its §§4.1a–4.1e prove the disc form. IntegralIwasawaTheory did briefly own §§4.1a–4.1e on its branch (commit `ae7b458`). Its next commit went back to consuming LinearFormsInLogarithms §8.10, and its head (`78ec69e`) builds on that commit, so the cited ids are gone.

**Witness:** IntegralIwasawaTheory at `78ec69e`, `README.md`: Layer 4 has “### 4.1” (line 544) and then “### 4.2” (line 556). Line 560 proves `bakerBrumer_algebraicNumbers` by applying LinearFormsInLogarithms §8.10. Neither §4.1e nor `bakerBrumer_expDisc_linearIndependent` occurs anywhere in it.

**Repair:** Cite only IntegralIwasawaTheory §4.2 (`bakerBrumer_algebraicNumbers`, `algebraicLog_kernel`), for every `p` including 2. Leave the disc form to that roadmap's own supplier contract.
- Line 223: delete the clause from “where the disc form” through “not stated here”.
- Line 3101: end the sentence at “`bakerBrumer_algebraicNumbers` of IntegralIwasawaTheory §4.2”.
- Line 3145: replace the §4.1e item with “IntegralIwasawaTheory §4.2 (`bakerBrumer_algebraicNumbers`, `algebraicLog_kernel`)”.

Tested at `p=2` on `α=−1`, the case step 7 needs. IntegralIwasawaTheory §4.2 (line 562) takes `e=1`, `q=2`, depth `i≥2`, `N=2` and `u=1`, giving `ℓ=0=log₂(−1)`. So the dyadic passage into the disc is that roadmap's own §4.2 and needs no §4.1e.

## R03 (P3) — Four supplier declaration spellings remain in the adapters

**Location:** `README.md:522` “`EulerSystem.twist`, its evaluation equation in §2.5”; `:642` “`ind_O(c)=indexOfDivisibility(c)=sup{…}`”; `:741` “`J_m=denominatorIdeal(m)={…}`”; `:759` “`…=smoothedStickelberger(m,b)−((b−1)/2)N_m`”.

**Claim:** This is the rest of the previous R01. These spellings are presented as supplier names, but neither supplier declares or uses them.

**Witness:** EulerSystemsAndKolyvaginSystems writes the twist as `c ↦ c^χ` (README line 1701) and the index as `ind_O(c)` (line 2863). CyclotomicClassGroupsAndStickelberger declares only `stickelberger` and `stickelbergerIdeal` (Suggested lines 98, 108). It writes “J_m for the denominator ideal” (line 432) and calls the smoothing `s_(m,b)` (line 465).

**Repair:**
- Line 522: “its twist `c↦c^χ` (§2.5)”.
- Line 642: “`ind_O(c)=sup{…}`”.
- Line 741: “`J_m={x∈ℤ[G_m] : xθ⁰_m∈ℤ[G_m]}`”.
- Line 759: “`…=s_(m,b)−((b−1)/2)N_m`”.

Nothing mathematical changes. For example, `s_(5,2)` still has coefficients 0 at `[3]` and 1 at `[2]`.

## R04 (P3) — CyclotomicClassGroupsAndStickelberger §0.2 is cited at a generality it does not state

**Location:** `README.md:1442`: “The equality with CyclotomicClassGroupsAndStickelberger §0.2's character eigenspace holds for an arbitrary group and a commutative coefficient ring”. The same attribution is at lines 220, 1407 and 1453.

**Claim:** §0.18 needs `M^χ` for any group `Δ`, any character `χ : Δ → O^×` and any commutative ring `O`. The supplier's §0.2 states only the odd-prime tame case, so this Check and the contract describe a statement the supplier does not make. Nothing is unowned, because §0.18 defines `M^χ` itself and Mathlib supplies the carrier.

**Witness:** CyclotomicClassGroupsAndStickelberger `README.md:145` defines `cyclotomicClassEigenspace p r i` for odd `p`, the tame group `Δ_r` and `ω^i`. It mentions the kernel intersection only “for ρ and ωⁱ”. The case `Δ=C₂` with the sign character over `ℤ₂` lies outside it.

**Repair:** In §0.18, define `M^χ` as `⨅ δ, Module.End.eigenspace (ρ δ) (χ δ)`. That is Mathlib `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, with `mem_eigenspace_iff` at line 467, and it is exactly how `Suggested.lean:80` defines `classGroupChiComponent`. Then cite §0.2's `cyclotomicClassEigenspace p r i` as the special case `Δ=Δ_r`, `χ=ω^i`. Tested: on `ℤ/2` with trivial `C₂`-action and sign `χ`, the intersection is `ker 2 = ℤ/2`, which is the Check's torsion case.

## R05 (P3) — The new contract text states the smoothing identity with the shifted `θ_m`

**Location:** `README.md:220`: “§2.3's rational smoothing identity `s_(m,b)=(b−[b])θ_m`”.

**Claim:** In this README, `θ_m` means the half-norm-shifted element `Σ(a/m−1/2)σ_a⁻¹` (lines 1725, 1748), and F.9 writes `θ⁰_m` for the supplier's unshifted element. Read in this README's notation, the identity as written is false.

**Witness:** Take `m=3`, `b=5`. Then `s_(3,5)=[1]+3[2]=(5−[2])θ⁰_3`, whereas `(5−[2])θ_3=−[1]+[2]=s_(3,5)−2N_3`.

**Repair:** Write `s_(m,b)=(b−[b])θ⁰_m`, as F.9 does at line 744.

## R06 (P3) — The new Amice Check uses `[2]`, which is not a group element when `p=2`

**Location:** `README.md:2648`: “Under step 3, `[1]−[2]` maps to `(1−X)−(1−X)²=X−X²`, with linear coefficient `+1`.”

**Claim:** §4.6 covers every prime, and step 3 works with `ℤ_p[[Γ′]]` for `Γ′=ℤ_p^×`. At `p=2`, the integer 2 is not in `ℤ₂^×`, so the Check is undefined at the very prime this section was written to cover.

**Witness:** `v₂(2)=1`, so `2∉ℤ₂^×`. Step 3 extends unit measures by zero off `ℤ_p^×`, so `[2]` is not an element of `ℤ₂[[Γ′]]`.

**Repair:** Use `[1]−[−1]`, which is a group-ring element for every `p`. It maps to `(1−X)−(1−X)^{−1}=−2X−X²−X³−…`, with linear coefficient `−2`. The opposite coordinate gives `(1+X)−(1+X)^{−1}=2X−X²+…`, with linear coefficient `+2`. Alternatively, prefix the existing Check with “For odd `p`”.

## Previous findings

- R01 — partly repaired: lines 217–220 and adapters F.1–F.4, F.6–F.8 now use the suppliers' notation (`R_(F,M)`, `φ^fs`, `ES(T,𝒦,N)`, `κ_(F,r,M)`, `Hyp(K,T)`, `ind_Λ`). Still present: “`EulerSystem.twist`” (522), “`indexOfDivisibility(c)`” (642), “`denominatorIdeal(m)`” (741), “`smoothedStickelberger(m,b)`” (759). See R03.
- R02 — repaired: “For `Δ=C₂`, `p=3` and `χ` the sign character, `V_χ(ℤ₃)=0` … `V_χ(ℤ₃[C₂])=ℚ₃`” and the `[1]−[2]` Amice Check (lines 2647–2648). The second Check is defined only for odd `p`; see R06.

## Verified sound

### Gate, dependency direction and elaboration

The gate was rerun on this head:

```text
gate EulerSystemsCyclotomicMainConjecture: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=2 FAIL
```

Every text scanner passes; the only failure is the build warning in R01. The prescribed dependency check reports:

```text
depcheck: 240 roadmaps, 2437 edges, 0 problem(s)
```

It shows no UPWARD or CYCLE line. Against `origin/main` (`eaf17b1`), the pull request's diff outside the folder is empty; the files that changes.md lists outside the folder come from the merge of main.

- **Elaboration:** `lake env lean` on `Suggested.lean` gives exactly five `sorry` warnings (lines 124, 149, 164, 180, 197).
- **Binder check:** a scratch file printed `#check @name` for all 14 declarations. The types are identical to the previous round's, and the hypotheses of the five theorems (number field, abelian Galois, scalar tower, cyclotomic overfield, finite-dimensional coefficients, parity, coprimality, compatibility, and `n≥1`, `e≥1` in the 2-power branch) are in scope. `globalUnitImage` needs only `[Field K]`: `𝓞 K` needs nothing more, and the headlines impose `NumberField`. Nothing was changed.
- **Padding probe:** each of `simp_all`, `rfl`, `infer_instance` and `norm_num` failed on all five theorems (five errors each), so none is padding.
- **Headlines:** the five headlines statable at the pins are still stated, and the docstring still names the unstatable infinite ones. The diff touches neither.

### Changed passages

All 40 added and 38 removed lines were read, together with every passage that cites F.1–F.9, §0.18, §0.29, §4.6, §4.9 or §4.18. The supplier citations in those lines were checked against the suppliers' current heads:

- **SelmerIwasawaCohomology** (head `ebadda3`): §§0.6–0.8 (`README.md:179`, 208, 222); §2.1 “Compact and rational Selmer data” (343); §2.2 (372); §2.5 “Propagating local conditions” (441); §2.7 (489); §2.8 (518); §2.25 (954); §3.1 with condition `(F)` and the corestriction-limit description (1373, 1377); §3.5 (1454); §4.20 (2197).
- **EulerSystemsAndKolyvaginSystems** (head `ccd7e7a`): §1.7 `R_{F,M}` (928); §1.8 `φ^fs` (981, 1003); §2.2 `ES(T,𝒦,N)` (1606, 1624); §2.5 `c↦c^χ` (1683, 1701); §3.9 `κ_{F,r,M}` (2283); §4.3 `ind_O` (2842, 2863); §4.17 (3316); §8.2 `Hyp(K∞,T)` (4601); §8.7 `ind_Λ` (4813); §8.37 (5869).
- **CyclotomicClassGroupsAndStickelberger** (head `10bc9eb`): §0.2 (141, 145; see R04); §2.2 (419); §2.3 (461, identity at 465–469); §2.4 smoothed Gauss descent (480); §2.5 `stickelbergerIdeal_annihilates` (503); §3.4 `relativeClassNumber_character_product`, `realClassNumber_log_product` (654; Suggested 179, 192).
- **DirichletPadicLFunctions** (head `016e54c`), unchanged contract re-resolved: `localIwasawaLog` (270), `localIwasawaLog_norm_eq_trace` (272), §3.4–3.7 names (174), `ferreroGreenbergGammaSum` and the `ferreroGreenberg_…_gauss_projection` family (1434).
- **IntegralIwasawaTheory** (head `78ec69e`): §4.2 `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers` (558, 560); no §4.1e (R02).

That makes 38 citations resolved. Of the 225 backticked identifiers in the README, every non-notation name resolves to `Suggested.lean`, a supplier head, a roadmap on main, or the pins, apart from the R02 and R03 spellings.

**Ownership:** the diff adds no new object. overlaps.md shows no other open pull request changing this roadmap and no dropped ids. The closest roadmaps (IntegralIwasawaTheory, EulerSystemsAndKolyvaginSystems, CyclotomicClassGroupsAndStickelberger, DirichletPadicLFunctions, SelmerIwasawaCohomology) were read wherever the diff cites them. Ownership against the other open pull requests was not re-searched this round, since no new object was introduced. LinearFormsInLogarithms is not in the merge order. After the R02 repair this roadmap no longer names it as a supplier; IntegralIwasawaTheory consumes it.

### Library declarations re-opened at the new pins

- `Module.End.eigenspace`, `mem_eigenspace_iff`: `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:423`, 467.
- `Representation.invariants`, `mem_invariants`, `averageMap`: `Mathlib/RepresentationTheory/Invariants.lean:73`, 80, 126.
- `DirichletCharacter.LFunction_apply_one_ne_zero`: `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412`.
- `IsGalois.normalBasis`: `Mathlib/FieldTheory/Galois/NormalBasis.lean:121`.
- `Nat.totient_mul`: `Mathlib/Data/Nat/Totient.lean:131`.
- `ClassGroup.mulEquivHom`, `mulEquivHom_apply`: `TauCeti/NumberTheory/ClassGroup/Equiv.lean:178`, 184.
- `DirichletCharacter.generalizedBernoulli`, `generalizedBernoulli_def`, `map_generalizedBernoulli`: `TauCeti/NumberTheory/DirichletCharacter/GeneralizedBernoulli.lean:81`, 91, 101.
- `TauCeti.kummerMap_eq_one_iff`, `kummerRes_kummerMap`, `kummerCor_kummerMap`: `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean`.
- `TauCeti.semilocalEquiv`: `TauCeti/NumberTheory/NumberField/LocalGlobal/Semilocal/Basic.lean`.
- `charIdempotent`: `TauCeti/RepresentationTheory/GroupAlgebra/CharIdempotent.lean`.

### Seeded sample

All 15 targets were checked at their locators, in legal copies fetched through the sources service. Rubin's draft has printed page = PDF page − 10, Greither's scan journal page = PDF page + 447, and Sinnott's = PDF page + 179. RJW and Belliard use preprint pages.

| Target | README locator | Source line and page | Result |
|---|---|---|---|
| 0.5 | RUBIN-ES III §2.1, display (2), p.34 | RUBIN-ES line 1597–1604, printed p.34 | The exponent `1−Fr_ℓ⁻¹` agrees; the source's dyadic sign slip is not copied. |
| 0.11 | RJW-PADIC-L §10.5, p.52 | RJW-PADIC-L line 3036–3044, p.52 | At `D=1`, `(ξ⁻¹−1)/(ξ−1)=−ξ⁻¹` is torsion, which is what the target rules out. |
| 0.19 | RUBIN-ES III §2.2 (4), p.35; Def 2.2, p.35 | lines 1645–1651, 1659–1671 | The twisted product is the character sum. |
| 0.20 | RUBIN-ES proof of Thm III.2.3, (6), p.36 | line 1688 | `c_ℚ=ξ^(1−χ⁻¹(p))`, with `χ(p)=0` when `p∣f`. |
| 0.23 | RUBIN-ES III Def 2.2, p.35 | line 1659–1661 | `ξ_{n,χ}` generates `C_{n,χ}⊆E^χ_n`. |
| 1.3 | RUBIN-ES proof of Thm III.2.3, p.36; I Prop 6.1, p.14 | lines 1699–1703; 812–829 | `H¹_ur=0` when `χ(p)≠1`; the Selmer group is the dual of `A^χ_L`. |
| 2.2 | RUBIN-ES III Prop 2.6, p.37; proof, p.38 | lines 1731–1743; 1762–1770 | Parts (ii) and (iii) are at the cited pages. |
| 2.3 | RUBIN-ES II Def 3.1, p.28; proof of Thm III.2.7, p.38 | lines 1389–1400; 1772–1780 | The `ind_Λ` definition matches F.8's renamed adapter. |
| 3.3 | SINNOTT-1980 Intro, p.182; §4, p.201; Thm 4.1, p.207; Lemma 5.1, p.210; Thm 6.1, p.226; §7, pp.232–233; BELLIARD-DESCENT Thm 1.1, p.4; Lemmas 3.3, 4.1–4.2, p.12 | SINNOTT-1980 lines 89, 867, 1095, 1215, 1812–1816, 2060–2067 (OCR); BELLIARD-DESCENT lines 135, 495–524 | Pages agree. The OCR lost the wording of Theorem 6.1, but line 1816 fixes it on p.226. |
| 4.7 | GREITHER-1992 proof of Thm 2.13, pp.466–467; proof of Cor 2.7, p.461; Remark, p.468 | GREITHER-1992 lines 611, 436, 650–681, 682–683 | Agrees. |
| 4.10 | GREITHER Lemmas 3.9–3.10, p.475; Lemma 3.11, p.477; RUBIN-1988 Lemma 1.2, p.703 | GREITHER lines 926–930, 975; RUBIN-1988 line 129 (OCR) | Agrees. |
| 4.12 | GREITHER Thm 3.1, Remarks (a)–(c), p.468; strategy, p.470; before and in the proof of Thm 3.7, pp.471–472 | lines 691–705, 757, 772–807, 810 | Agrees. |
| 4.21 | GREITHER Thm 4.1, pp.482–484 | line 1167 | Agrees. |
| 4.24 | GREITHER Lemma 4.13 and proof, p.495 | lines 1615–1636 | Agrees. Leopoldt is used at line 1628; two of the proof's steps are Source issues that the README already repairs. |
| 5.3 | RJW §13.5.1 Def 13.19, p.70; §13.5.2, p.70; §13.5.2(3), p.71; Conj 13.21, Ex 13.22, p.71 | lines 3942, 3960, 3986–3995, 4026–4034 | The README's `n≤0` correction matches lines 3993–3995. |

### Adversarial table

The new rows below cover every statement the diff changes, with computed values. The rows after them are carried forward from the previous report (PRREVIEW~2) for statements the diff does not touch. They include the five Lean headlines (§§1.6, 4.20–4.22, 5.1) and the nine Lean definitions.

| Statement | Instances | Values computed on the two sides / competing model | Result; change |
|---|---|---|---|
| IntegralIwasawaTheory §§4.1–4.2 contract; §4.18 step 7 and *Needs:* | Supplier head `78ec69e`; `p=2`, `α=−1`; `y=5∈ℚ₂`; boundary `x=2` | The head has §4.1 (line 544) and §4.2 (line 556) and no §4.1a–4.1e. §4.2 gives `N=2`, `u=1`, `ℓ=0=log₂(−1)`. `‖log 5‖₂=1/4<ρ₂=1/2` and `exp(log 5)=5` is algebraic, so `5` meets the disc hypothesis. At `x=2`, `v₂(2ⁿ/n!)=s₂(n)` (binary digit sum) does not tend to ∞, so the series diverges and `NormedSpace.exp 2=0`; the relation `−2·1+1·2=0` would then refute a non-strict disc form | The disc form is stated correctly, with its strict inequality, but its cited location does not exist: R02. |
| F.1 `H¹_Iw` adapter | `ℚ∞/ℚ`, `T=ℤ₃(1)` | `lim_Cor H¹(ℚ_n,ℤ₃(1))=lim(ℚ_n^×)^`, the compact completion (RUBIN-ES line 1592); the supplier's §3.1 requires `(F)` (line 1378) | Renaming only; correct. |
| F.2 local conditions | `W_n=(ℚ_p/ℤ_p)(n)`, `n=1,0,−1` | `F⁺W_1=W_1` gives all of `H¹`; `F⁺W_0=F⁺W_{−1}=0` gives `H¹_ur`, matching RJW-PADIC-L line 3993–3994 | Correct. |
| F.3 `ES(T,𝒦,N)` | `T=ℤ_p(1)`, `q≠p` | `P_q(X)=det(1−Fr_q⁻¹X on ℤ_p)=1−X`, as at RUBIN-ES line 1611 | Correct. |
| F.4 `R_(F,M)`, `φ^fs` | `K=ℚ`, `p=2`, `M=2`, `q=3,5`; `T=ℤ/p^k(1)` | The `2`-ray degrees are 1 and 2, so only `q=5` is admissible. Supplier line 1017: `P=1−ℓx≡1−x`, `Q=−1`, `φ^fs=−id` | Correct. |
| F.6 `κ_(F,r,M)` | Cyclic group `C₃` | `(σ−1)(σ+2σ²)=2−σ−σ²=3−N` | Correct. |
| F.7 `Hyp(K,T)`, `ind_O` | `H=O⊕O/π²`; `c=(π³,1)` and `c=(0,1)` | `ind_O=3` for the first; `∞` for the torsion class, matching supplier line 2864 | Correct; spelling: R03. |
| F.8 `ind_Λ` | `H=Λ`, `x=T`; `H=Λ⊕Λ/(p)`, `x=(0,1)` | `{f(T)}=TΛ`; every `f` kills torsion, giving `0`. Matches RUBIN-ES line 1400 | Correct. |
| F.9 and §0.29 steps 1–2 | `m=3`, `b=5`; `m=5`, `b=2` | `s_(3,5)=[1]+3[2]=(5−[2])θ⁰_3`, and `(5−[2])θ_3=−[1]+[2]=s_(3,5)−2N_3`. `s_(5,2)` has coefficients `0` at `[3]` and `1` at `[2]` | Steps 1–2 correct; line 220 notation: R05; spellings: R03. |
| §0.18 carrier contract and Check | `ℤ/3` and `ℤ/2`, each with trivial `C₂`-action and sign `χ` | `ker(1+1)` is `0` on `ℤ/3` and `ℤ/2` on `ℤ/2`. The supplier's §0.2 covers only odd `p`, `Δ_r`, `ω^i` | Mathematics correct; attribution: R04. |
| §4.6 new Checks | `Δ=C₂`, `p=3`, sign `χ`; `[1]−[2]`; `p=2` | `V_χ(ℤ₃)=ℤ₃/2=0` for the trivial action; `V_χ(ℤ₃[C₂])=ℚ₃`, dimension 1 against 2 for the whole module. `(1−X)−(1−X)²=X−X²`, and under `X↦−X` it becomes `−X−X²`. At `p=2`, `2∉ℤ₂^×` | Correct for odd `p`: R06. |
| §4.9 Frobenius criterion | Supplier §1.7 | The finite-level criterion is stated at supplier lines 942 and 955 | Correct citation. |
| F.5 twist/replacement | Trivial/zero twists; p=3,q=7 | Trivial twist c, zero twist0; `(1−X/7)−(1−X)=6X/7`, divisible by6 | Correct; ramified inverse twist retains Euler factors. Carried from PRREVIEW~2; text unchanged. |
| F.10 logarithmic values | Odd quadratic mod3; p=2 | τ=i√3 and complex log formula gives π/(3√3); replacing logs by log absolute values gives0. log₂(−1)=log₂2=0 | Retain parity and Iwasawa branch. Carried from PRREVIEW~2; text unchanged. |
| F.11 Gamma/Gauss | p=2, n=0,1,2,3; trivial finite-field character | Γ₂ values1,−1,1,−1; negative Gauss-sum convention gives1 for trivial character | Correct signs, including n0. Carried from PRREVIEW~2; text unchanged. |
| 0.1 minimal polynomial, divided case | m=2,ℓ=2 | minpoly(i/ℚ)=X²+1=X²−ζ₂ | Correct small dyadic case. Carried from PRREVIEW~2; text unchanged. |
| 0.2 minimal polynomial, coprime case | m=3,ℓ=2 | `(X−ζ₆)(X−ζ₃²)=X²−ζ₃`; degrees1+1=2 | Correct removed root. Carried from PRREVIEW~2; text unchanged. |
| 0.3 norm, divided case | m=2,ℓ=2 | N(1−i)=2=1−ζ₂ | Correct. Carried from PRREVIEW~2; text unchanged. |
| 0.4 coprime norm | m=3,ℓ=2 | `(1−ζ₃)/(1−ζ₃²)=−ζ₃=1−ζ₆` | Correct. Carried from PRREVIEW~2; text unchanged. |
| 0.5 Frobenius | m=7,ℓ=2 | Inverse Frobenius exponent4: ζ₇^(2·4)=ζ₇; forward exponent2 gives ζ₇⁴≠ζ₇ | Retain inverse. Carried from PRREVIEW~2; text unchanged. |
| 0.6 sign | m=2,ℓ=2 | N(i−1)=2 while ζ₂−1=−2 | README's correction passes; source formula needs sign. Carried from PRREVIEW~2; text unchanged. |
| 0.7 conductor1 | p=2,3 | N(1−ζ_p)=2,3, respectively; not the real-norm square p² | Correct. Carried from PRREVIEW~2; text unchanged. |
| 0.8 p-stabilized numbers | p=5,m=3,1,5 | c₃=−ζ₃ has order6; c₁=5; c₅=1−ζ₅ | Torsion possible away from p, explicitly allowed. Carried from PRREVIEW~2; text unchanged. |
| 0.9 p-tower norms | p=5, first two levels | N(1−ζ₂₅)=1−ζ₅, then norm toℚ=5 | Correct direction. Carried from PRREVIEW~2; text unchanged. |
| 0.10 auxiliary norm | p=5,m=1,ℓ=2 | c₂=1; norm1 equals `(1−Fr₂⁻¹)c₁=0` additively | Correct zero Euler factor. Carried from PRREVIEW~2; text unchanged. |
| 0.11 nontorsion | p-power conductor | Rational norm p, versus root-of-unity norm±1 | Nonzero Kummer source certified by valuation. Carried from PRREVIEW~2; text unchanged. |
| 0.12 real norm | p=5 | `(1−ζ₅)(1−ζ₅⁻¹)=(5−√5)/2` for the chosen real embedding; conductor1 gives5, not25 | Correct real-degree convention. Carried from PRREVIEW~2; text unchanged. |
| 0.13 real distribution | p=3, p-tower | Norm of real generator at conductor9 to conductor3 is3; the conductor3 generator is3 | Correct transported norm. Carried from PRREVIEW~2; text unchanged. |
| 0.14 smoothing | m=5,a=2,4,6 | Quotients are1+ζ₅, −ζ₅⁻¹,1, each norm1 | Unit property and torsion boundary distinguished. Carried from PRREVIEW~2; text unchanged. |
| 0.15 admissible extension | p=3, q=2 | Principal cyclotomic Frobenius is−2; `(−2)²=4≠1` and it has infinite 3-adic order | Infinite admissible direction retained. Carried from PRREVIEW~2; text unchanged. |
| 0.16 Kummer class | ℚ, element p versus p^p | Valuation classes1 versus0 modulo p | Nonzero class is tied to actual unit/number. Carried from PRREVIEW~2; text unchanged. |
| 0.17 cyclotomic ES | Base fieldℚ | Initial class has valuation1; the zero family has valuation0 | Construction is not an arbitrary family. Carried from PRREVIEW~2; text unchanged. |
| 0.19 twisted sums | C₂ sign; trivial group; S₃ sign regular module | S=[1]−[s], S²=2S; trivial sum=id; sign sum in ℤ[S₃] squares to 6S, while ordinary norm has all positive coefficients | Correct without commutativity or division. Carried from PRREVIEW~2; text unchanged. |
| 0.20 Frobenius on sum | C₄,χ(g)=i | Inverse-character factor1−i⁻¹=1+i; wrong forward factor1−i | Correct. Carried from PRREVIEW~2; text unchanged. |
| 0.21 root-of-unity unit | ℤ₂,ζ=−1; ℤ₃,ζ=−1 | 1−ζ=2 is nonunit at2, unit at3 | Prime-to-p order hypothesis essential. Carried from PRREVIEW~2; text unchanged. |
| 0.22 ξ generator | ℚ(√5), χ quadratic | For ε=(1+√5)/2, character sum corresponds to ε⁻², not ε or1 | Correct unnormalised generator. Carried from PRREVIEW~2; text unchanged. |
| 0.23 ξ is unit | Nontrivial χ versus trivial prime-power conductor | Weighted prime valuation sums to0; trivial character retains valuation1 | Correct nontrivial-character hypothesis. Carried from PRREVIEW~2; text unchanged. |
| 0.24 circular line | ℚ(√5),p=3,5 | Exponent−2 is a unit in both coefficient rings; Eχ/Oξ has order1 | Correct. Carried from PRREVIEW~2; text unchanged. |
| 0.25 restriction–Kummer | ℚ₇,p=3; ℚ→ℚ(i),p=2 | Compact completion is ℤ₃⊕C₃, whereas discrete tensor has ℚ₃/ℤ₃ and its completion0. κ(−1) restricts from nonzero to0 in the degree2 extension | Correct completion; prime-to-p restriction cannot be dropped. Carried from PRREVIEW~2; text unchanged. |
| 0.26 Euler factor | Quadratic conductor5,p=3,5,11 | Factors1−χ⁻¹(p) are2,1,0 | Correct convention for p dividing conductor. Carried from PRREVIEW~2; text unchanged. |
| 0.27 span of cℚ | Same three primes | Factors2 and1 are units at3 and5; factor0 at11 generates0 instead of Oξ | χ(p)≠1 is necessary. Carried from PRREVIEW~2; text unchanged. |
| 0.28 unsmoothed system | χ₅,p=11; rational base | Initial unsmoothed class is nonzero (real convention gives2ξ); p-stabilized class0. Raw auxiliary norm atℓ isℓ, not base unit1 | Extra conductor bookkeeping retained. Carried from PRREVIEW~2; text unchanged. |
| 0.30 local functional/family | p=3, tame conductors 1,2,5; first p-step; two local factors at conductor8 | x₁=2/3, x₂=−1/3; N(2)x₂=−2/3=−x₁. Tr(x₅)=−2/15, multiplied by5 gives−2/3. Tr(x₃)=2=3x₁ cancels the 1/3 normalization. At m8 factor traces s,−s with s²=−2 sum to0 | Normalized restrictions pass; unscaled factor−1/2 fails. Semilocal trace required. Carried from PRREVIEW~2; text unchanged. |
| 0.31 replacement | q=2,p=3 | New polynomial1−X/2, old1−X, difference X/2 divisible byq−1=1; unchanged bad-support field classes | Same coefficientℤ_p; no Tate twist created. Carried from PRREVIEW~2; text unchanged. |
| 1.1 Rubin hypotheses | p=5,χ=ω² | Residual dual characterω⁻¹ remains nontrivial on C₄; quotientC₂ would lose this information | Correct enlarged tame group. Carried from PRREVIEW~2; text unchanged. |
| 1.2 unit rank | ℚ(√5),p=3 | Eχ rank1, ξ exponent−2 gives index0 in valuation units; c=0 would give∞ | Nonzero generator matters. Carried from PRREVIEW~2; text unchanged. |
| 1.3 Selmer/class dictionary | ℚ(√−5),p=2; prime above2 | Class groupC₂ becomes0 after killing the class of the prime above2 | Ordinary and p-split groups are distinguished. Carried from PRREVIEW~2; text unchanged. |
| 1.4 derivative descent | C₃ | Derivative identity gives3−(1+σ+σ²)=2−σ−σ² | Correct coefficient and norm direction. Carried from PRREVIEW~2; text unchanged. |
| 1.5 finite–singular relation | Frobenius unipotent 2×2 | Image of coinvariant[e₂] is−e₁, not e₁; identity Frobenius on rank2 has Q(1)=0 | Rank-one quotient hypothesis retained. Carried from PRREVIEW~2; text unchanged. |
| 1.6 finite Kolyvagin bound | ℚ(√5),χ₅,p=3 | Class component order1 divides unit quotient order1; scalar extension preserves1 | Headline agrees with Lean. Carried from PRREVIEW~2; text unchanged. |
| 2.1 Iwasawa hypotheses | Rank1 trivial action of τ versus rank2 | coker(τ−1) has O-rank1 versus2 | Hypothesis discriminates. Carried from PRREVIEW~2; text unchanged. |
| 2.2 norm-limit modules | L=ℚ(√6),p=3; L=ℚ(√5),p=3/11 | Local Tate roots contribute ℤ₃(1), killed byT−3; split-prime correction has rank0 at3 and1 at11 | No false torsion-freeness claim. Carried from PRREVIEW~2; text unchanged. |
| 2.3 Λ-index | H=Λ,c=T | Index(T), while empty/zero class gives0; augmentation factor isT | Correct. Carried from PRREVIEW~2; text unchanged. |
| 2.4 divisibility | char(A)=T−p, denominator errorT² | T andT−p have no common height-one factor, so T-errors cannot supply a missing factorT−p | Correct use of torsion and error support. Carried from PRREVIEW~2; text unchanged. |
| 3.1 four-term sequence | C=0,E=pℤ,U=ℤ | U/E=ℤ/p; E/C=pℤ embeds into U/C=ℤ | Correct quotient direction; E/U is not defined. Carried from PRREVIEW~2; text unchanged. |
| 3.2 trivial component | p=3,a=2 | v₃log₃2=1 and v₃(1−1/3)=−1, so product valuation0; char(X)=char(Y)=(1) | Pole cancels, not ζ alone. Carried from PRREVIEW~2; text unchanged. |
| 3.3 finite-layer comparison | Split χ₅,p=11; n=0 | Universal-norm projection of circular line0 but finite circular lineOξ≠0; ν₀=1 so Λ/(ν₀)=0 | Control error retained. Carried from PRREVIEW~2; text unchanged. |
| 3.4 characteristic equality | T andT−p | Both have μ0,λ1 but unequal ideals; after known divisibility the quotient has μ0,λ0 and is a unit | Correct use of divisibility, not totals alone. Carried from PRREVIEW~2; text unchanged. |
| 3.5 main conjecture | p=3 | X∞⁺=0 and smoothed zeta ideal(1); both characteristic sides(1) | No Vandiver module-isomorphism overclaim. Carried from PRREVIEW~2; text unchanged. |
| 4.1 integral χ-quotient | C₂ sign overℤ₂ | Minus ℤ₂ has quotientℤ₂. The inclusion1↦1+s becomes ℤ/2→ℤ₂, zero, so exactness fails on the left | Correct integral quotient. Carried from PRREVIEW~2; text unchanged. |
| 4.2 norm descent | Identity extension; full local units at oddp | Identity norm kernel/cokernel0; −1 has order2 and is absent from the pro-p component | Full/pro-p distinction retained. Carried from PRREVIEW~2; text unchanged. |
| 4.3 circular tower | p=2,m=3; conductor15,a=3 | Absolute norm toℚ of1−ζ₃i is1; nonprimitive conductor15 input has rational norm25 rather than primitive norm5 | Roots and conductors not interchangeable. Carried from PRREVIEW~2; text unchanged. |
| 4.4 Coleman sequence | Unramified quadratic at3, Frob(i)=−i; p=2 boundary | β(exp9)=6; β(exp(9i))=12i, versus iβ(exp9)=6i. Dyadic f=a+bX maps to(b,a mod2); f=1 maps to(0,1) | β is not O-linear; sign term necessary. Product root is(1−X,1). Carried from PRREVIEW~2; text unchanged. |
| 4.5 semilocal interpolation | Dyadic roots ζ₈→ζ₄ | Nζ₈=−i and N(−ζ₈)=−i; chosen signed roots follow this transition | Retain signed norm sequence. Carried from PRREVIEW~2; text unchanged. |
| 4.7 Coleman circular image | p=5,h=2−X; p=3,conductor5 | Dlog(h) has linear coefficient1/4; boundary `(1−5)/4=−1`. InvolutionT′=−T+T²+…; upstairs residue norm exponent80 versus downstairs8 | Sign, full inversion and coefficient descent retained. Carried from PRREVIEW~2; text unchanged. |
| 4.8 semilocal quotient | Λ=ℤ_p[[T]], quotient byT−p | `(Λ[1/p])/(T−p)=ℚ_p≠0`; `ℚ_p[[T]]/(T−p)=0` | Correct bounded-denominator rationalization. Carried from PRREVIEW~2; text unchanged. |
| 4.10 bounded control | Ideal(p,T)⊂Λ; local roots at3 | Double dualΛ, defect𝔽_p of orderp; ℤ₃(1) survives rationally with annihilatorT−3 | Finite defects and Tate-root kernel retained. Carried from PRREVIEW~2; text unchanged. |
| 4.11 Kolyvagin/Maschke | Δ=C₂, sign moduleℤ₂ | Lift1↦1−s projects to2, not1; Δ trivial gives factor1 | Integral multiplier #Δ necessary. Carried from PRREVIEW~2; text unchanged. |
| 4.12 real all-prime theorem | First real dyadic layer | Norm-generated circular lattice2E gives quotient order2; CM-plus intersectionE gives order1; tower factors(2) versus(1) | Correct two lattices; rationalization removes(2). Carried from PRREVIEW~2; text unchanged. |
| 4.13 adjoint/twist | One-dimensional actiona, cyclotomic valueu | Dual Tate actionu/a; witha=1,u=4 it is4, not1 | Contragredient then twist retained. Carried from PRREVIEW~2; text unchanged. |
| 4.14 odd all-prime main | p=3,exceptionalω; dyadic numerator2 | Exceptional class module0 has char(1); half times numerator2 is1. Λ/(p) would be infinite despite rational vanishing | μ-vanishing input necessary. Carried from PRREVIEW~2; text unchanged. |
| 4.15 split divisors | ℚ(√−7),p=2 | Two prime classes modulo plus relation giveℤ₂; Γ acts trivially, annihilatorT | Correct exceptional factor. Carried from PRREVIEW~2; text unchanged. |
| 4.16 trivial-zero removal | Λ/(T(T−a)),a≠0 | RemoveT to obtainT−a with value−a at0; original value0 cannot be cancelled numerically | Correct order of operations. Carried from PRREVIEW~2; text unchanged. |
| 4.17 split extension | ℤ_p⋊ℤ_p with action1+p | Coinvariant kernelℤ_p/p, abelianization𝔽_p⊕ℤ_p | Exact sequence and commutator relation agree. Carried from PRREVIEW~2; text unchanged. |
| 4.19 exceptional derivative | Rank-one lattice, μ=b,λ=4g | IndicesNχ(b) andNχ(g) againstO and4O; quotientNχ(b)/Nχ(g) | Target lattice factor4 cancels correctly. Carried from PRREVIEW~2; text unchanged. |
| 4.20 class lower bound | Quartic conductor5,p=2 | Norm(B/2)=1/10, Nχ(B/2)=1/2≤class order1 | Fractional lower bound is meaningful. Carried from PRREVIEW~2; text unchanged. |
| 4.21 odd-prime comparison | C₃ acting onℤ/9 by4 | Norm1+4+7=3 mod9; kernel/cokernel each order3, image{0,3,6} | Integral error terms retained; not a projector. Carried from PRREVIEW~2; text unchanged. |
| 4.22 both finite branches, including the new Lean theorem | Sextic χ₇; quartic χ₅; quadratic χ₃; enlarged coefficients | Sextic Norm(B/2)=1/7 gives Nχ=1=class order. Quartic B=(−3+i)/5, Norm(B/2)=1/10 gives 1=2·(1/2). Degree-two coefficient extension gives 1=4·(1/4). Quadratic B=−1/3 gives 1=2·(1/2) | Both branches and the exponent e pass; no missing headline. Carried from PRREVIEW~2; text unchanged. |
| 4.23 finite-ray/log comparison | ℚ(√5),p=3; real cubic at2 | Regulator valuation1 and Euler factor4/3 valuation−1 cancel. Nontrivial sign part of real cubic has order4 | Ordinary/real ray correction cannot be discarded. Carried from PRREVIEW~2; text unchanged. |
| 4.24 ray transfer | C₂×C₂×C₃,p=3; identity | For C₆=Gal(ℚ(√5)ℚ(ζ₇)⁺/ℚ), inertia orders are2 and3, neither6. In C₂×C₂×C₃ inertia at7 containsC₃; relative degree3 gives αβ=3 and βα=1+σ+σ². Identity gives1 | Cyclic p-Sylow suffices; total ramification overℚ unnecessary. Carried from PRREVIEW~2; text unchanged. |
| 4.25 real formula | Trivialχ versus faithful C₃-character | Trivial ray quotient rank1 and L-value pole; onℤ/9 withσ=4, norm quotient order3 | Non-p-power and faithfulness conditions retained. Carried from PRREVIEW~2; text unchanged. |
| 4.26 Gras | ℚ(√5),p=3; real conductor7 cubic,p=2 | At3 E/C completion0, class0, both orders1; middle factor1, not2. At2 nontrivial residue degree2 contributes2²=4, cancelled by enlarged circular lattice | Correct middle factor and enlarged units. Carried from PRREVIEW~2; text unchanged. |
| 4.27 integral Coleman character | p=5, ρ=ω²; k=1; χ₅ at p=11 | Untwisted basis has θ=ρω⁻¹=ω; Tate twist gives ω². Lχ(u−1)=G_p(0,χ), whereas unshifted G_p(u−1,χ)=L_p(1,χ). At11 the even ρ kills the odd local-root terms, giving zero outer terms | Finite-character twist and Mellin inversion both necessary. Carried from PRREVIEW~2; text unchanged. |
| 5.1 finite equality | ℚ(√5),χ₅,p=3 and5 | Class order1 and unit quotient order1 at both primes; χ₅(5)=0 gives factor1 | Conductor divisible byp remains covered. Carried from PRREVIEW~2; text unchanged. |
| 5.2 odd-character formulation | p=3 | Only odd tame characterω; corresponding unramified module0 and characteristic ideal(1) | Exceptional component handled. Carried from PRREVIEW~2; text unchanged. |
| 5.3 Tate/Greenberg | n=−1,0,1,2; p=3,n=2 | `(r_n,r_(1−n))=(0,0),(0,1),(1,0),(0,0)`; atn2 Selmer0 has char(1), while the bare twisted zeta has a pole | Correct critical ranges and twisted augmentation factor. Carried from PRREVIEW~2; text unchanged. |
| `classGroupTensorAction` | Identity automorphism; conjugation on ℚ(√−23), p=3 | Identity sends x to x; the three reduced forms of discriminant−23 give class group C₃, conjugation sends its generator1 to2, whereas identity would give1 | Covariant native action retained. Carried from PRREVIEW~2; text unchanged. |
| `classGroupChiComponent` | Same C₃ class module, quadratic Galois sign/trivial characters | Sign eigenspace C₃ has order3; trivial eigenspace is kernel of−2, hence0 of order1 | Carrier discriminates the character. Carried from PRREVIEW~2; text unchanged. |
| `classGroupChiQuotient` | Same module and characters | Sign relation is0, quotientC₃; trivial relation is−2, quotient0 | Agrees with components when2 is invertible. Carried from PRREVIEW~2; text unchanged. |
| `unitTensorAction` | ℚ(√5), ε=(1+√5)/2,p=3 | Conjugation sends ε to−ε⁻¹, hence exponent1 to−1 after 3-adic tensor; identity sends1 to1 | Correct action, not inverse by definition. Carried from PRREVIEW~2; text unchanged. |
| `globalUnitImage` | Global ε; rational prime3 | ε has all finite valuations0 and lies in image; 3 has a nonzero prime valuation and is excluded | Actual global units, not all nonzero field elements. Carried from PRREVIEW~2; text unchanged. |
| `unitChiComponent` | Quadratic sign on ε; trivial character | Sign line Oε; trivial line0 after odd-primary tensor | Correct global/eigen intersection. Carried from PRREVIEW~2; text unchanged. |
| `xiChi` | Quadratic conductor5; trivial group | Cyclotomic norm gives exponent−2 on ε; trivial-group sum returns the norm class unchanged | Unnormalised sum, not zero or normalized projector. Carried from PRREVIEW~2; text unchanged. |
| `chiUnitQuotient` | Quadratic conductor5,p=3/5; zero global-unit tensor | Quotient by−2 gives order1 at either prime; zero submodule modulo zero also has order1 | Headline uses the actual nonzero circular line; boundary order convention consistent. Carried from PRREVIEW~2; text unchanged. |
| `primitiveBernoulliOne` | Odd quartic conductor5, inflated to55; trivial character presented modulo3 | Inflated B₁=0 because χ(11)=1, but primitive B₁=(−3+i)/5 up to conjugation; trivial primitive conductor1 gives+1/2 rather than the modulus3 sum0 | Primitive-character operation is essential. Carried from PRREVIEW~2; text unchanged. |

## Not verifiable

- Nothing in the seeded sample. All six works it needs (RUBIN-ES, RJW-PADIC-L, GREITHER-1992, SINNOTT-1980, BELLIARD-DESCENT, RUBIN-1988) were read in legal copies fetched through the sources service. SINNOTT-1980 and RUBIN-1988 are image-only scans read through OCR, which drops the wording of Sinnott's Theorem 6.1; its page is fixed by the surrounding text (SINNOTT-1980 line 1812–1816).
- Locators outside the changed passages and the sample were not re-read this round. They are carried from the previous report, including its MORITA-1975 entry, which is still uncertified.
- The five Lean theorems are admitted by design. Elaboration, the binder check and the computed instances certify their types and the tested cases, not the formal proofs.

## Source issues

- **Error** in RUBIN-ES at III §2.1, display (2), printed p.34 (RUBIN-ES line 1597–1604): the source gives the norm of `ζ_{mℓ}−1` with no sign from the degree; it should carry `(−1)^{degree}`, since at `m=3`, `ℓ=2` the norm is `ζ₃`, while the formula gives `−ζ₃`; affects a stated result.
- **Error** in RJW-PADIC-L at (10.7), printed p.52 (RJW-PADIC-L line 3028–3030): the source says the inverse limit of the `p`-power quotients of `F^×` is `F^×⊗ℤ_p`; it should be the `p`-adic completion, which is strictly larger because `F^×` is not finitely generated; affects a stated result.
- **Error** in RJW-PADIC-L at §10.5, printed p.52 (RJW-PADIC-L line 3041–3044): the source says the norm relation multiplies by the scalar `1−ℓ⁻¹`; it should be the group-ring exponent `1−Fr_ℓ⁻¹`; affects a stated result.
- **Misprint** in RJW-PADIC-L at §13.5.2(3), printed p.71 (RJW-PADIC-L line 3995): the source says the unramified local condition holds for `n≥0`; it should be `n≤0`, as the display just above it states; affects the proof.
- **Error** in GREITHER-1992 at Lemma 4.13 proof, printed p.495 (GREITHER-1992 line 1620–1622): the source says some rational prime ramifies totally in a cyclic `F/ℚ`; it should use total ramification in the relevant relative `p`-extension, since in the sextic `ℚ(√5)ℚ(ζ₇)⁺` the inertia orders are 2 and 3; affects the proof.
- **Error** in GREITHER-1992 at Lemma 4.13 proof, printed p.495 (GREITHER-1992 line 1633–1634): the source says `F` contains no `p`-power roots of unity; it should be applied to sufficiently deep principal units, since `−1∈F` at `p=2`; affects the proof.
