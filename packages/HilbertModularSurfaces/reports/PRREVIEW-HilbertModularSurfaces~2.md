# Review of HilbertModularSurfaces (pull request #1730 at 557fdfd)

**Verdict:** needs changes

Locations abbreviate `TauCetiRoadmap/HilbertModularSurfaces/README.md` (README) and `TauCetiRoadmap/HilbertModularSurfaces/Suggested.lean` (Lean). Source ids below are the sources-cache texts: `assaf` = arXiv:2301.10302v2 (cache 2db482f3, preprint pages), `assaf-errata` (cache ed4c561d), `hirzebruch` = Hirzebruch 1973 (cache 53efdc1a, PDF pages), `voight` = Quaternion Algebras v1.0.7u (cache a9316b83; printed page = marker − 46 near p. 545), `zagier` = Zagier 1976 (cache f6416147), `lmfdb-component` (cache 75913a50). The pull-request worktree was not changed.

## Repairs of the previous review (75a5869 → 557fdfd)

| Previous finding | Status at 557fdfd | Where |
|---|---|---|
| R01 swapped embeddings ≠ dual | Repaired: dual is `βM` with `v₁(β)v₂(β) < 0`; `period_dual` states opposite digit sums; ℚ(√3) witness `(4)` vs `(3,2)` recomputed below | README 800–819; Lean 152–157 |
| R02 meromorphy does not fix ζ(−1) | Repaired: `AnalyticAt ℂ ζ (-1)` added; identity theorem plus continuity now pins the value | Lean 175–178; README 1141–1146 |
| R03 D = 1 admitted | Repaired: `siegelZetaMinusOne_spec` deleted; README states positivity for fundamental `D > 1` and keeps D = 1 as negative control | README 1158–1166 |
| R04 rationality needs rational curves | Repaired: "two distinct smooth rational curves" in 5.3(i); K3 witness kept as Check | README 1395–1412 |
| R05 determinant images / projective index | Repaired: `PΓᵢ/PΓᵢ¹ ≃ Dᵢ/{a² : a ∈ Aᵢ}` with the actual scalar groups; ℚ(√5), level (3) Check | README 362–388 |
| R06 `γ² = u⁻¹ζ` | Repaired: `γ² = uζ`; the u = 2+√3 Check gives −u = −u | README 862–877 |
| R07 Artin composite through undefined quotient | Repaired: signature group ≃ ker(Cl⁺ → Cl) → Cl⁺ → C_𝔑, Artin character only in the selective case | README 1013–1039 |
| R08 terminal case `0 < r′` | Repaired: `0 ≤ r′ < r`, terminate at `r′ = 0` | README 632–648 |
| R09 converse at q = 2 | Repaired: converse restricted to q > 2 | README 995–1011 |
| R10 integrality "rejects every wrong type" | Repaired: necessary, not sufficient; the `(5;1,1),(5;1,4)` witness kept | README 1229–1243 |
| R11 stale C6 citations | Repaired: §0.13, §§2.1–2.8, §§8.14–8.15, 8.23–8.25, 8.32–8.38, 8.56 all exist at ShimuraCompactifications' head (resolved below) | README 73, 285–290 |
| R12 tame-level contracts | Repaired: §2.4 owns the all-level analytic cusp comparison; the tame sections are cited only for agreement in their range | README 735–745 |
| R13 re-planned group and cusp targets of HilbertModularForms | **Not repaired, inverted**: the targets stay here and HilbertModularForms is now listed as a consumer, while its own head still owns them and names this roadmap as its consumer. See R01 below | README 37–39, 1803–1806 |
| R14 certificate procedure | Repaired: 6.2 owns the Hirzebruch–Zagier curves for all N and levels; 6.4 is the classification theorem | README 1430–1488 |
| R15 local embedding formula | Repaired: root-set formula `#M(e)` / `#M(e) + #img(M(e+1) → A/𝔭^e)` with dyadic and conductor-divisible cases | README 939–969 |
| R16 fundamental-unit conclusion | Repaired: generator law in `hjPeriod_ne_nil_of_isReduced` | Lean 86–96 |
| R17 gamma types without cusp data | Repaired: all-level affine stabilizer construction with the translation class τ; 7.2 restricts the numerical branch to gamma type zero | README 584–616, 1535–1566 |
| R18 weight (0,0) | Repaired: `(k₁,k₂) ≠ (0,0)` | README 1248–1255 |
| R19 build gate | Repaired: `module` header; gate build = 0; direct elaboration exit 0 with exactly four `sorry` warnings | Lean 1–4 |
| R20 padding | Repaired: 16 declarations, 4 admitted theorems, no examples; none closes under the one-tactic probe (below) | Lean |
| R21 README shape | Repaired: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, per-layer Examples and Dependencies, Assaf pages 285–312 | README 1–305, 1825 |

## R01 (P2) — The degree-two groups, cusps and form spaces have two owners, in two open pull requests that each name the other as consumer

Re-raised: r1 R13 (the repair report gave no reason for not acting; the head acts in the opposite direction).

**Location:** README 37–39 ("Owned here: The degree-two congruence groups, their determinant and index interfaces, component transport, cusp orbits and the Hilbert holomorphic-form comparison (Layers 0–1)"); §0.3 (360–388), §0.4 (390–416), §0.5 (418–445), §1.1 (457–474), §1.4 (518–548); 1803–1806 ("HilbertModularForms consumes the degree-two group, index and cusp interfaces of §§0.3 and 1.1–1.5 and the geometric form comparison of §§0.5 and 4.8").

**Claim:** These targets plan again what the open roadmap HilbertModularForms (the sibling pull request, head 5f43770, committed after this head) plans for every totally real field, and the two READMEs contradict each other about the direction of supply. A roadmap imports what another roadmap plans; two open pull requests building the same objects is an ownership defect, and the degree-two restriction of a general construction is not a separate object.

**Witness:** HilbertModularForms README.md 56–76 owns "the group `GL₂⁺(F)`, its action, the weight-k slash action", "the lattices `L_𝔟`, the groups `Γ₀(𝔫)_𝔟`, `Γ₁(𝔫)_𝔟`, `Γ(𝔫)_𝔟` and their determinant-one subgroups, the component transport, cusps and their finiteness", "Koecher's principle, the spaces `M_k(Γ)`, constant terms and cusp forms", "the invariant measure, finite dimensionality". Its §1.2 (496–547) states the determinant images, sections `ε ↦ diag(ε,1)` and the index `N(𝔫)∏(1 + N𝔭⁻¹)`; §1.3 the transport `diag(1,α)`; §1.4 (560–604) the cusp set, the level-one bijection with `ClassGroup`, the stabilizer's translation lattice and unit group, and the count `h_F Σ_{𝔞∣𝔫} #((𝒪_F/𝔤_𝔞)^×/U_𝔞)`, which is this README's `h Σ_{𝔐∣𝔑} φ_{>0}(𝔐 + 𝔑/𝔐)` of 1.4; §§2.3, 2.6, 3.2, 3.5 the form spaces, cusp forms, measure and finite dimension that §0.5 and §4.8 here define again. Its line 501 says "the sibling `HilbertModularSurfaces` reads `Γ₀¹(𝔫)_𝔟` and `Γ(𝔫)_𝔟` from here" and its Downstream consumers (2516) "HilbertModularSurfaces uses the analytic forms and congruence groups", the reverse of README 1803. Inside this README the consumed-table row at line 70 still says "the Hilbert modular forms roadmap builds the groups and the action", and §4.9 (1309) says the inputs "need the congruence subgroups and the quotient `Γ\ℍ²` of the sibling roadmaps (0.3–0.4)", so the text itself is of two minds.

**Repair and retest:** Delete the construction and theorem targets of §0.3 (groups, determinant images, sections, level index, transport, `W_ν`), §0.5 (form spaces, Koecher support, constant terms, cusp forms, finite dimension), §1.1 (cusp orbits, finiteness) and the count of §1.4, and cite HilbertModularForms §§0.1, 1.2–1.4, 2.2–2.6, 3.2, 3.5 for them in Scope and ownership and the supplier contracts; keep as owned here only what HilbertModularForms does not state: the invariants `𝔰, 𝔐` (1.2), the Γ₀/Γ₁ parametrization of Lemma 3.1.8 (1.3), the per-`𝔐` refinement of the count if §4.9 needs it, the cusp types `G(M,V)` and the all-level affine stabilizer (1.5), the projective quotient `PΓᵢ/PΓᵢ¹` (0.3) and the holomorphic two-form comparison (0.5, 4.8) stated on HilbertModularForms' spaces. Replace the Downstream consumers paragraph by the true direction and delete the two contradictory sentences at lines 70 and 1309. This creates no upward edge: a scratch copy of the README with `*Needs:* HilbertModularForms §1.4` added passed the movable dependency check (`depcheck: 204 roadmaps, 1633 edges, 0 problem(s)`; HilbertModularForms is not in the merge order and is placed after its last supplier). Retest: the ℚ(√5), level (3) Check of §0.3 still holds on the quotient `D₁/{a² : a ≡ 1 mod 3}`, which is the only new content of that section.

## R02 (P3) — The generalised index of §4.3 is written against a group it is not commensurable with

**Location:** README 1175–1177, "`[Γ¹(1) : PΓ₀(𝔑)_𝔟] = N(𝔑)∏(1 + N(𝔭)⁻¹)/[R^×_{>0} : R^{×2}]` and `[Γ¹(1) : PΓ₀¹(𝔑)_𝔟] = …`".

**Claim:** Convention 12 defines `[Γ¹(1) : Γ]` only for `Γ` commensurable with `Γ¹(1) = PSL₂(R)` in `PGL₂⁺(ℝ)²`; for a nonprincipal `𝔟` the group `PΓ₀¹(𝔑)_𝔟 = PSL(R ⊕ 𝔟)` meets `PSL₂(R)` in a subgroup of infinite index in both, so the displayed index is undefined and the formula is read only through Siegel's equal-covolume statement.

**Witness:** `F = ℚ(√10)`, `𝔟 = (2, √10)` nonprincipal: `SL(R ⊕ 𝔟) ∩ SL₂(R)` is the group of matrices with `b ∈ 𝔟⁻¹ ∩ R = (𝔟⁻¹ ∩ R)` and `c ∈ 𝔟`, which contains no translation by `1/2`-type elements of `SL(R ⊕ 𝔟)` and misses the translations by `b ∈ R ∖ 𝔟⁻¹`; neither index is finite.

**Repair and retest:** State the index relative to `PΓ₀¹(1)_𝔟`, which contains `PΓ₀¹(𝔑)_𝔟` with the displayed finite index, and let convention 12's "`vol(PΓ₀¹(1)_𝔟\ℍ²) = 2ζ_F(−1)` for every `𝔟`" carry the normalisation. The ℚ(√5), `Γ₀(𝔭₂)` value `5 · 1/15 = 1/3` is unchanged.

## R03 (P3) — `period_dual` carries a hypothesis its conclusion does not use

**Location:** Lean 155, `(hV : E.V = D.V)`.

**Claim:** `CuspDatum.period` depends only on `M` (Lean 126–128), so the digit sums on both sides are determined by `hM`; the statement holds for every `E.V`. The README 2.7 sentence "and `V′ = V`; multiplication by β identifies the multiplier groups" is a remark about data, not a hypothesis of the theorem.

**Witness:** `D.M = ℤ[√3]`, `E.M = √3·ℤ[√3]`, `D.V = ⟨2+√3⟩`, `E.V = ⟨(2+√3)²⟩`: periods `(4)` and `(3,2)`, sums `1` and `−1`, the conclusion `1 = −(−1)` holds although `E.V ≠ D.V`.

**Repair:** Delete `hV` (and the README's "`V′ = V`" as a hypothesis; keep it as the datum of the dual cusp). Retest: the statement elaborates unchanged without the binder.

## R04 (P3) — Docstrings cite a README section that does not exist

**Location:** Lean 65, 69, 117, 131, 165 ("`README.md`, *Pinned conventions*, 5").

**Claim:** The README's section is `## Conventions` (112); there is no "Pinned conventions" heading.

**Repair:** Replace by "*Conventions*, 5" (and 7, 12).

## Verified sound

**Gate and build.** The worker's gate at 557fdfd passes every check (build = 0, depcheck = 0, readme-ids-missing = 0). Direct elaboration with `lake env lean` from the worktree root: exit 0, exactly four `declaration uses sorry` warnings (Lean 86, 145, 152, 175). The movable dependency check returned `depcheck: 204 roadmaps, 1631 edges, 0 problem(s)` with no UPWARD, CYCLE or `moved:` line. The pull request changes nothing outside the folder (`metadata.toml` with `topic = "math.AG"` is the folder's own). No `set_option`, no sorry'd data, no `lemma`, single `import Mathlib` plus one existing `TauCeti` module.

**Lean signatures.** A scratch copy with `#check @name` for the seven non-trivial declarations was elaborated; every type agrees with the worker's `signatures.md` and with the README statements. The six "dropped `[NumberField F]`" leads (`hjStream`, `hjDigit`, `IsReduced`, `hjPeriod`, `IsOriented`, `multiplierUnits`) are definitions whose bodies use only a field and the embeddings; every theorem about them keeps `[NumberField F]`, `v₁ ≠ v₂` and `finrank ℚ F = 2` in its own binder list, so nothing was lost.

**One-tactic padding probe.** A scratch copy replacing each `sorry` by `first | (simp; done) | rfl | infer_instance | sorry` elaborated with all four theorems still admitted (the linter reports `simp` did nothing in each). Nothing in the file is padding: the 12 definitions are exactly those the four headlines need.

**Headline coverage.** README headlines: the fundamental multiplier of a reduced period (2.2), negative definiteness of the cusp cycle (2.5), cusp duality (2.7), Siegel's value (4.2) — all four stated; Hirzebruch's resolution (2.4), elliptic counts and resolutions (3.4, 3.10), Chern/Hodge formulas (4.4–4.8), rationality and classification (6.3–6.5) — each named in the module docstring with the carrier it lacks (the compactified Hilbert surface, its local charts, its Hirzebruch–Zagier divisors). `NumberField.dedekindZeta` at the pin is the `LSeries` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49), with no continuation, so the formulation through an arbitrary meromorphic `ζ` agreeing on `Re s > 1` and analytic at `−1` is the right one at this pin.

**Adversarial table.** Values were computed by exact rational arithmetic (a scratch Python script over the quadratic field, pure Python) or by hand as shown; "agrees" means the instance matches the README's stated value.

| Statement | Instances and values | Result |
|---|---|---|
| 0.1 unit dichotomy | D=5: ε=(1+√5)/2, N(ε)=−1, `[R^×_{>0}:R^{×2}]`=1; D=12: ε=2+√3, N=1, index 2; `[R^×:R^{×2}]`=4 both | agrees |
| 0.2 `is_pp` | ℚ(√3): 𝔡=(2√3), every generator ±2√3(2+√3)ⁿ has mixed sign, so `[𝔡⁻¹]` is the nontrivial narrow class; ℚ(√5): h⁺=1, every component `is_pp` | agrees |
| 0.3 projective quotient | Γ₀: A₀=R^×, D₀=R^×_{>0}, quotient R^×_{>0}/R^{×2}; Γ₁ over ℚ(√5), 𝔑=(3): ε²=ε+1≢1, scalar normalisations d=±(ε−1)≢1 mod 3, so diag(ε²,1)∉PΓ₁¹ though h⁺=h | agrees |
| 0.3 level index | (2) in ℚ(√5): 4(1+1/4)=5; unit level 1 | agrees |
| 0.4 effective action | aI acts trivially; (1,1;0,1)(i,i)=(1+i,1+i); over ℚ(√3) the scalar 2+√3 lies in Γ₀ and acts trivially | agrees |
| 1.2 `𝔰, 𝔐` | 𝔟=R: (1:0)→𝔰=R, 𝔐=𝔑; (0:1)→𝔰=R, 𝔐=R; (2:0)→𝔰=2R, 𝔐=𝔑 | agrees; `assaf` line 232 (Lemma 3.1.2) |
| 1.3 `W_ν` | W_ν(a:c)=(−c:νa); W₁ swaps (1:0),(0:1) and 𝔐=𝔑↔R | agrees |
| 1.4 cusp count | D=5,(2): h⁺h(1+1)=2; D=12,R: one cusp per component; D=85: h=2 cusps per component | agrees; `assaf` line 337 (Cor 3.1.23) |
| 1.5 types, Γ₀ and Γ₀¹ rows | cusp 0 at level 𝔑≠R on 𝔟=R: stabilizer (a 0;c d), conjugated by W: v=d/a, M=𝔑 — with modulus 𝔐+𝔑/𝔐=R, V=all positive units (correct); with `assaf` v2's printed "𝔑+𝔑/𝔐" V would be units ≡1 mod 𝔑 (false); 𝔑=𝔭², 𝔐=𝔭, cusp (1:π): lower-left π((v−1)−πm)∈𝔭² iff v≡1 mod 𝔭 | README's modulus agrees; the source misprint is corrected in `assaf-errata` line 17 |
| 1.5 Γ₁ row (pinned d≡1) | cusp ∞, 𝔐=𝔑: V={a/d : d≡1}=all positive units = README's {v≡ε mod 𝔑/𝔐=R}; cusp 0, 𝔐=R: V={d/a : d≡1 mod 𝔑}={v≡ε mod 𝔑, ε∈R^×} = README with U=R^× | agrees (𝔐 and 𝔑/𝔐 exchanged relative to `assaf` line 498–504, as the README says) |
| 1.5 affine normalisation | (t,v)=(1,2+√3): s=−1/(1−v), t+(1−v)s=0; Γ₁(4) vs Γ(4) at ∞: M=R vs 4R | agrees; `hirzebruch` line 733 states that for n=2 the stabilizer is conjugate to G(M,V) |
| 2.1 `hjExpansion` | (3,1)→[3], r′=0; (3,2)→[2,2]; (5,2)→[3,2]; (5,3)→[2,3]; (6,5)→[2,2,2,2,2]; (12,5)→[3,2,3]; (12,7)→[2,4,2]; (4,2)→[2]; reversal 2·3≡1 mod 5 | all agree |
| 2.2 reduced stream | w=2+√3: digit 4, successor 1/(2−√3)=2+√3, period [4], product 2+√3; (2+√3)²=7+4√3 preserves M but its powers miss ε; w=1→successor 0; w=0→period [0] | agrees; generator law in the Lean excludes ε² |
| 2.2 multiplier ring order | M=ℤ[2√3], w=4+2√3: period (8,2), w₁w₂=7+4√3=generator of U_M^+ (2+√3∉M) | agrees with `hirzebruch` line 1177 (lemma: A_r generates U_M^+) |
| 2.3 orientation, repetition | (2+√3,1): determinant 2√3>0; V=⟨(2+√3)²⟩: k=2, cycle [−4,−4], sum −4; ℤ[1/2]+ℤ√3 excluded by `fg` | agrees |
| 2.4 rays | (2+√3)^j, j∈ℤ: slopes (2+√3)^{2j} all distinct, one V-orbit; (2),(3),(√5) in ℚ(√5): indices 5,10,6 | agrees |
| 2.5 matrices | [−3]→[−1]; [−2,−4]→((−2,2),(2,−4)), minors of −Q: 2, 4; [−2,−2]: −Q(1,1)=0; [−2]→[0]; `cycleIntersectionMatrix` on [−3], [−2,−4], [−2,−2,−5], [−2,−3,−2,−3] checked by `decide` in a scratch file | agrees; `hirzebruch` lines 1091–1096 (negative definite iff some b_j ≥ 3) |
| 2.6 cusp contributions | D=5: (−3), ℓ=1, sum −1; D=8: (−2,−4), ℓ=2, sum −2; D=12 gl: (−4),(−2,−3); sl: (−4,−4),(−2,−3,−2,−3) | agrees |
| 2.7 duality | ℤ[√3]: (4), sum 1; √3·ℤ[√3] basis (3,3−√3), quotient (3+√3)/2 ≈ 2.366, conjugate 0.634, period (3,2), sum −1; (3,6)↦(3,3,2,2,2), sums 3,−3; block rule (b,2^m)↦(2^{b−3},m+3) gives sums b−3−m and −(b−3)+m | agrees; dual periods of D=8,12,13,17,21,24,28,29,33,37,41,53,61,85 computed: sums opposite in every case |
| 3.1 elliptic elements | (0,−1;1,0): discriminant −4, fixes (i,i), order 2; identity and (1,1;0,1): discriminant 0; diag(2,1): 1 | agrees |
| 3.2 `γ² = uζ` | u=2+√3, γ=(0,−u;1,0): γ²=−uI=u·(−1); norms u² both sides; u⁻¹ζ would have norm u⁻² | agrees; source error recorded below |
| 3.3 orders | ℚ(ζ_{2q}+ζ_{2q}⁻¹): q=4→ℚ(√2), 5→ℚ(√5), 6→ℚ(√3); q=8,10 need N(ε)=1, fail; γ=ζ₁₂(1+i)/(1+√3)=ζ₁₂+ζ₁₂⁴−i∈ℤ[ζ₁₂], N_{K/F}=2/(4+2√3)=2−√3, γ²=uζ₁₂⁵, projective order 12; E/R^×↪μ₁₂ by u↦u/ū hits ζ₁₂⁷ (u=1−ζ₁₂), so ≅ℤ/12 | agrees |
| 3.4 counts | `assaf` (4.2.4)–(4.2.5) with n=2: (2/h)Σh(S)/Q(S)·m, (2/h⁺)Σh(S)·m; ℚ(√3), K=F(i): iε=((1+i)(1+√3)/2)² so Q=2, order-six sl count 2·1/2=1; ℚ(√5): ±iε not a square (N(ε)<0), Q=1, a₂=2 | agrees |
| 3.4 unit index | `[Z_K^×:S^×]=Q(K)#μ(K)/(Q(S)#μ(S))`: μ(K)∩R^×={±1}⊆μ(S) | agrees |
| 3.5 local counts | ℤ₂[i]: M(1)={1}, M(2)=∅: levels 2,4 give 1,0; ℤ₃: T(T−1)→2, T²+1→0, T²−3→1 (M(2)=∅); ℤ₃[γ], T(T−3): M(1)={0}, M(2)={0,3,6}, image {0}: 1+1=2 | agrees; `voight` lines 23163–23190 (Prop 30.6.12, Ex 30.6.14), 23194 (Lemma 30.6.16), 22923 (Prop 30.5.3(a)) |
| 3.6 level-one forms | D=28: h(−112)+h(−28)+h(−7)=2+1+1=4=4h(−7); D=44: 1+3+6=10=10h(−11); D=24: 3h(−24)=6; a₂=h(−4D) for D=13,17,29,37,41,53,61,73,89,97 → 2,4,6,2,8,6,6,4,12,4; a₃=h(−3D) → 4,2,6,8,2,10,8,4,2,4; D=21: h(−63)+h(−7)=5; D=33: h(−99)+h(−11)=3 | agrees with the worked tables |
| 3.7 rotation factors | (0,−1;1,0): derivative i⁻²=−1; diag(√3,1) mixed sign leaves (−1,−1); q=3: ζ₃≠ζ₃⁻¹ | agrees |
| 3.8 signature map | ℚ(√3): (++)↦1, (+−)↦[(√3)] in ker(Cl⁺→Cl)≅C₂; square and odd-valuation prime classes die in C_𝔑 | agrees; `assaf-errata` line 30 (item 8) |
| 3.9 local Chern data | all 13 rows recomputed: c(2;1,1)=0,ℓ=1; (3;1,1) −1/3,1; (3;1,2) 0,2; (4;1,1) −1,1; (4;1,3) 0,3; (5;1,1) −9/5,1; (5;1,2)=(5;1,3) −2/5,2; (5;1,4) 0,4; (6;1,1) −8/3,1; (6;1,5) 0,5; (12;1,5) −1,3; (12;1,7) −4/3,3 | all agree |
| 3.11 record D=5 | 2+1+1+1+1=6 points, ℓ=1+1+1+2+2+2=9 | agrees |
| 4.2 Siegel | sums for D=1,5,8,12,13,17,21,24,28,29,33,37,40,41,44,53,61,73,85,89,97: 0,1/30,1/12,1/6,1/6,1/3,1/3,1/2,2/3,1/2,1,5/6,7/6,4/3,7/6,7/6,11/6,11/3,3,13/3,17/3 | all 14 README values agree; the Lean `b % 2 = D % 2` filter with `Int.emod` admits b=−1 (emod 1) |
| 4.3 volume | D=5: 1/15; Γ₀(𝔭₂): 5/15=1/3; D=12 sl 1/3, gl 1/6; PGL-normalised sl volume 2/3 gives e=16+1/3 | agrees (R02 concerns only the wording of the index) |
| 4.4–4.5 Chern numbers | D=5: K²=2/15−1−1/3−4/5=−2, e=1/15+1+3+5/3+8/3+28/5=14; D=8: (−3,15); 13: (−3,15); 17: (−4,16); 29: (−4,28); 37: (−5,29); 41: (−6,30); 53: (−4,40); 61: (−5,41); wrong order-5 pair: (−3,15,χ=1); duplicated (3;1,1): K²=−7/3, χ=8/9 | all agree |
| 4.7 Hodge | D=5: χ=1, h11=12, σ=(−2−28)/3=−10=2+0−12; D=89: χ=4, h11=52−8=44 | agrees |
| 4.8 comparison | D=5: 1=0+1; D=12 gl: 1+1=0+2; D=21 sl: 1+2=1+2 | consistent |
| 4.9 both components | D=12 sl (−4,−4) with (3;1,1)²,(6;1,5),(2;1,1)³: K²=−4, e=16; (−2,−3,−2,−3) with (3;1,2)²,(6;1,1),(2;1,1)³: −4,16; gl (−4) with (12;1,5),(4;1,3),(3;1,1),(2;1,1)³: −3,15; gl (−2,−3): −3,15; D=21,24,28,33 all 16 rows: (18,−6,1),(25,−1,2),(15,−3,1),(15,−3,1),(19,−7,1),(26,−2,2),(19,−7,1),(26,−2,2),(20,−8,1),(26,−2,2),(18,−6,1),(25,−1,2),(21,−9,1),(28,−4,2),(19,−7,1),(26,−2,2) | all agree |
| 4.9 level (2) over ℚ(√5) | two cycles (−3), (2;1,1)², (3;1,1)², (3;1,2)²: K²=2/3−2−2/3=−2, e=1/3+2+3+10/3+16/3=14, χ=1 | agrees |
| 5.1 contractions | ℙ² blown up: (8,4,1)→(9,3,1); K3: (−1,25,2)→(0,24,2); genus-two (−1)-curve: K·C=3 | agrees |
| 5.2 tables | kodairaDims(1,−2)={−1,0,1,2}, (2,−4)={0,1,2}, (3,−7)={1,2}, (4,−4)={1,2}, (1,8)={−1,2}; minimal (2,0)={0,1}, (1,−2)=∅, χ=0: ∅ | agrees; fake planes (1,9) and Beauville surfaces (1,8) justify {−1,2}; `assaf` line 1057 (Table 1) |
| 5.3 criteria | (i): contract C₁; C₂′²=−1+m²≥0, K′·C₂′=−1−m<0, so (ii) applies; K3 witness: squares 2−3=−1, intersection 2, genus 2 | agrees |
| 6.3 D=13 | F₃ exceptional meets two (−2)-curves of (2,2,5) once each; after contraction squares −1, intersection 1+1=2 | agrees; `assaf` line 1238 (Ex 7.3.4) |
| 6.4 list | rational {5,8,12,13,17,21,24,28,33,60}, K3 {29,37,40,41,44,56,57,69,105}, elliptic {53,61,65,73,76,77,85,88,92,93,120,140,165}; χ column 1/2/3/≥4 matches the table rows for D ≤ 97 | consistent with Layer 4 values; book not readable (below) |
| 6.5 levels | `assaf` line 1146–1159 (Thm 6.5.1): the D=5,8,13,17 level lists match the README verbatim in content; D>500 general type from VII.5.1 quoted at `assaf` line 1263 | agrees |
| 6.5 D=85, 165 | `assaf` lines 1203–1213, 1229–1237: χ=4, K²=−8→0 after 8 contractions; other component K²=0→2; D=165: −20+20=0 and −10+20=10; Layer 4 gives χ=4, K²=−8 (trivial) and K²=0 (other) with the stated cycles and (2;1,1)⁴(3;1,1)⁶(3;1,2)⁶ | agrees |
| 7.2 record D=5 | nb_cusps 1, nb_ell 6, len_res 10, (14,−2,1,0,12) | agrees |
| Lean `hjPeriod_ne_nil_of_isReduced` | w=2+√3: period [4], ε=hjStream 1 = 2+√3, v₁(ε)>1, εM=M, 7+4√3 not a generator; rational w excluded by `hirr` | sound |
| Lean `cycleIntersectionMatrix_negDef` | [−4]: 2−4=−2<0; [−4,−4]: det 12>0; [−3,−3,−3] and [−4]^3 cycles: eigenvalues 3−2cos(2πj/3)>0 and 4−2cos>0 | sound; the all-2 cycles cannot arise from a reduced period |
| Lean `period_dual` | ℚ(√3) witness 1=−(−1); D=5: R and φR=R both (3), 0=−0 | sound (R03: `hV` unused) |
| Lean `dedekindZeta_neg_one_eq_siegel` | `Function.update ζ (-1) 0` keeps `MeromorphicOn` and agreement but fails `AnalyticAt`, so excluded; genuine continuation at D=5 gives 1/30 | sound |

**Pinned declarations opened** (paths relative to the pinned library roots, Mathlib f6090c70, Tau Ceti 358314d4): `NumberField.dedekindZeta` (Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49, an `LSeries`); `Int.IsFundamentalDiscr` (Mathlib/NumberTheory/FundamentalDiscriminant.lean:41, admits 1); `Subgroup.IsArithmetic` (ModularForms/ArithmeticSubgroups.lean:102), `IsCusp`, `CuspOrbits` (ModularForms/Cusps.lean:57, 151); `Units.fundSystem` (NumberField/Units/DirichletTheorem.lean:475); `Pell.IsFundamental` (Pell.lean); `hurwitzZeta_neg_nat`, `riemannZeta_neg_nat_eq_bernoulli` (LSeries/HurwitzZetaValues.lean); `completedLFunction_one_sub` (LSeries/DirichletContinuation.lean); `FractionalIdeal.dual`, `Submodule.traceDual` (RingTheory/DedekindDomain/Different.lean:229); `GenContFract.of`, `IntFractPair.stream` (Algebra/ContinuedFractions/Computation/Basic.lean:125, 185); `Matrix.PosDef` (LinearAlgebra/Matrix/PosDef.lean:164, Hermitian plus positivity on nonzero vectors, over ℤ equivalent to real positive definiteness). Tau Ceti: `NumberField.IsTotallyPositive`, `isTotallyPositive_iff`, `.mul`, `.inv`, `isTotallyPositive_sq`, `totallyPositiveUnits`, `finiteIndex_totallyPositiveUnits` (NumberTheory/NumberField/TotallyPositive.lean:71, 76, 96, 102, 107, 130); `NarrowClassGroup`, `mk`, `toClassGroup_surjective`, `toClassGroup_ker`, `instFinite`, `card_eq_card_classGroup_mul_card_ker` (NarrowClassGroup/Basic.lean:83, 96; Finite.lean:38, 59); `narrowEquivNarrowClassGroup` (Global/RayClass/Narrow/Basic.lean); `PlumbingGraph`, `intersectionMatrix`, `intersectionForm`, `IsNegativeDefinite`, `blowUpVertex` (LowDimTopology/Plumbing/IntersectionForm.lean:89, 108, 171, 150; BlowUp.lean); `Toric.Fan` with `finite_cones` (Geometry/Toric/Algebraic/Fan/Basic.lean:83–89); `BinaryQuadraticForm`, `IsReducedForm`, `reducedForms`, `hurwitzClassNumber` (NumberTheory/BinaryQuadraticForm/Basic.lean:94, Reduced.lean:76; HurwitzClassNumber.lean:84); `Scheme.Modules.eulerCharBelow`, `Scheme.genus` (AlgebraicGeometry/Cohomology/EulerCharacteristic.lean, Genus.lean:64); `TauCeti.Hodge.hodgeNumber` (Geometry/Hodge/Dimension.lean:73); `TauCeti.ModularForm.apply_I_eq_zero_of_not_dvd`, `apply_ρ_eq_zero_of_not_dvd` (NumberTheory/ModularForms/EllipticPoints.lean); `Subgroup.integerCuspWidth` (ModularForms/SturmBound.lean); `NumberField.units_sq_index_eq` (Units/ElementaryTwoQuotient.lean). Every declaration the supplier contracts name exists at the pins.

**Cross-roadmap citations resolved** (all at the heads this brief names or on main): ShimuraVarieties P.6, 0.1, 0.4, 1.2, 2.5, 2.7, 2.8 (#933 head, README 202, 214, 269, 361, 595, 629, 648); ShimuraCompactifications 0.13, 2.1–2.8, 8.5–8.12, 8.14–8.15, 8.23–8.25, 8.32–8.38, 8.56 (#1053 head, README 656, 1175–1339, 3182–3294, 3344, 3372, 3511–3557, 3686–3767, 4104; 8.56 carries the translation class and cocycle `τ_{gh} = τ_g + a_gτ_h` in the tame range, which §1.5 here extends to all levels); HilbertModularVarietiesAndShimuraCurves H0.3, H1.1, H1.10, H5.2, R18 (#1005 head, README 246, 353, 526, 1308, 1573); AutomorphicBundles B3.Hilbert.0a = §7.2 (#1069 head, README 221; it sits after this roadmap in the merge order, and a scratch `*Needs:*` on it only moves this roadmap, so the table row is not an upward edge); NeronModelsAndSemistableAbelianVarietiesPartII §6.1 (#870 head, README 9793, which proves the Castelnuovo–Zariski equivalence inside that target); GlobalNumberFields Layers 2 and 11 (Completed, README 279, 571); ImaginaryQuadraticClassNumber H1.3, H1.4, H2.2 (main, 35, 43, 57); SchemeAndStackFoundations §§5.9–5.10 (main, 7129, 7175); ComplexKahlerGeometry K6.0, K6.1, K7.2 (main, 1245, 1274, 1444); ComplexManifolds Milestone 4 (main, 238); FuchsianOrbifolds Layers 1, 3, 6 item 1 (main, 215, 263, 344); AnalyticToricGeometry Layers 0, 2, 3 (Completed, 186, 302, 361); ClassFieldTheory Layers 10–13 (main, §4 build plan). HilbertModularForms §§0.1, 1.2–1.4, 2.3, 2.6, 3.2, 3.5 at #1724 head 5f43770 (README 332, 496, 549, 560, 704, 796, 931, 1045) were read for R01. The worker's 22 resolver leads are the 16 Lean names of this file (all declared) and LMFDB field names, none a defect. Ownership against the open pull requests the brief lists was checked for the cusp cycle, the local Chern data, the Siegel sum and the surface invariants: no other readable roadmap declares the proposed fully qualified names or builds these objects.

**Seeded source sample.** 0.2: `lmfdb-component` line 90 (components ↔ narrow classes). 0.4: `assaf` lines 145–159 (§2.2). 1.5: `assaf` lines 463–535 (Lemma 3.3.5, Prop 3.3.8 and its proof (3.3.10)), `assaf-errata` line 17. 2.1: `hirzebruch` §2.5 line 1183 ((19)). 2.4: `hirzebruch` lines 1246–1259 (Theorem), 1035–1106 (§2.4). 3.1–3.2: `assaf` lines 605–645 (§4.1, Lemma 4.1.1). 3.11 and 3.4: `assaf` lines 686–722 ((4.2.2), Prop 4.2.3), `voight` lines 30540–30560 (Prop 39.4.12), 23896 (Cor 31.1.10), 22731 (Lemma 30.3.14). 4.4–4.5, 4.9: `assaf` lines 1005–1037 (Thm 6.2.3), 1038–1049 (§6.3). 5.2: `assaf` line 1057–1067 (Table 1). 5.3: `assaf` lines 1080–1088 (Props 6.4.1–6.4.2). 6.4: `assaf` lines 1260–1263 (§7.4). 7.1: `assaf` lines 167–175 ((2.2.4)). Every locator supports the statement as written, with the source defects listed below.

## Not verifiable

- **van der Geer, Hilbert Modular Surfaces (1988):** Springer, paywalled. Prop I.1.1, Lemma II.3.2, II.§2, II.§6, IV.2.1, IV.2.5, IV.6.1, V.§§1–4, VII.2.2, VII.2.8, VII.2.9, VII.3.3, VII.5.1 and the tables were checked only through Assaf et al.'s quotations.
- **Dasgupta–Kakde (2021):** not obtained (arXiv search rate-limited, the Acta Arithmetica landing page is in no licence class); Lemma 3.6 and Corollary 3.12 were checked only as quoted at `assaf` line 317. Listed in `needs-references.toml`.
- **Prestel (1968), Hamahata (1995), Hartshorne (1977), Cox (1989), Fulton (1993), Hirzebruch–van der Geer (1981), Siegel (1969), Beauville (1996 English edition):** paywalled or not found by the service; the roadmap cites them by locator. Hamahata's four theorems were checked through `assaf` Theorem 6.5.1 only.
- **Zagier (1976) formula (17):** the display is absent from the OCR (`zagier` lines 441–447 give only its context: m = 1, b₁(4) = 1/240); the finite sum itself was verified numerically for the 21 discriminants above.
- **LMFDB knowls `hmsurface.hmsurface`, `.cusps`, `.elliptic_point(s)`:** the cached fetches are browser-challenge pages; only `hmsurface.component_ideal` and `nf.narrow_class_group` were readable, so 7.3's column-by-column coverage is not certified.

## Source issues

- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13 (line 631): the source says `γ² = u⁻¹ζ` when `det γ = u`; it should be `γ² = uζ` (γ = (0,−u;1,0) gives `γ² = −uI`); affects a stated result; the author errata (item 5) keep `u⁻¹`.
- **Error** in assaf at Lemma 4.1.1(b), preprint p. 13 (line 632): the source says the nonsquare-determinant projective order satisfies `q ≤ 6` in degree two; it should allow `q = 12` over ℚ(√3) (the unit `ζ₁₂(1+i)/(1+√3)`); affects a stated result.
- **Misprint** in assaf at Proposition 3.3.8(b), preprint p. 10 (line 490): the source says the congruence modulus is `𝔑 + 𝔑/𝔐`; it should be `𝔐 + 𝔑/𝔐` (the cusp `0` at level `𝔑 ≠ R` has all positive squares); affects a stated result; corrected in print at the author errata, item (3).
- **Error** in assaf at Proposition 6.4.1(i), preprint p. 22 (line 1082): the source says two curves of square −1 meeting positively force rationality; it should require smooth rational curves (two blown-up genus-two curves on a K3 refute it); affects a stated result.
- **Error** in assaf at (4.3.19), preprint p. 17 (line 872): the source says the signatures map through a quotient `Cl⁺ R / Cl R`; it should say through the kernel of `Cl⁺ R → Cl R`, since `Cl R` is a quotient, not a subgroup; affects the proof.
- **Error** in assaf at (6.2.2), preprint p. 20 (line 1007): the source says `vol = −[Γ(1):Γ] d_F^{3/2} ζ_F(2)/π^{2n}`; for n = 2 it should be `+[Γ(1):Γ] d_F^{3/2} ζ_F(2)/(2π⁴)` (D = 5 gives 1/15, the printed form −2/15); affects a stated result.
- **Misprint** in assaf after Table 1, preprint p. 21 (line 1067): the source says the case χ = 2, K² = 0 leaves "K3, Enriques, or honestly elliptic"; Enriques surfaces have χ = 1 and should be omitted; affects nothing.
- **Error** in assaf at Example 7.3.2, preprint p. 25 (line 1218): the source says ℚ(√11) has `h = h⁺ = 2`; it should say `h = 1`, `h⁺ = 2` (ε = 10 + 3√11 has norm 1); affects nothing.
