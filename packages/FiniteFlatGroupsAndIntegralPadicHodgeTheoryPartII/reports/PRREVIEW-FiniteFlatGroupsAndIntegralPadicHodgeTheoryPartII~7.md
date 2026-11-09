# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (pull request #1843 at 930a1af)

**Verdict:** needs changes

This is a full review of the repaired head (277 changed README lines since a5ccea4). Three of the previous review's four findings are repaired (R01 by its branch 2, R03, R04). One is not and is raised again: the four GeometricSatakeAndFusion contracts are still absent from the plan's `gaps` (R01 below). The gate, the build, the dependency check, all 15 sampled locators, the p=2 Layer 0 computations and every cross-roadmap heading I resolved pass.

## R01 (P2) — The four GeometricSatakeAndFusion contracts are not declared in the plan's gaps

Re-raised: H02

**Location.** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/README.md` lines 102, 104, 106 and 108 ("What GeometricSatakeAndFusion must provide (gap:…), extending its §4.17 / §0.29"); `packages/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/design/plan.json`, `gaps`.

**Claim.** The README uses 15 distinct `gap:` slugs; the plan declares 11. Under the review rules a contract "counts as declared when the plan's `gaps` has the same slug", so the four GeometricSatakeAndFusion contracts are undeclared, the intake will not announce them on that roadmap's job, and the targets that list them as prerequisites rest on contracts no supplier will see: §§2.1, 2.3, 3.11, 3.13, 3.14, 4.11, 4.13 and 6.2, and the Layer 3 Dependencies (line 1051).

**Witness.** Mentions at this head (`grep -o 'gap:[a-z0-9-]*'`):

| Slug | Mentions | In plan.json |
|---|---|---|
| `gap:scheme-local-model-representative` | 15 | no |
| `gap:scheme-local-model-hodge-immersion` | 8 | no |
| `gap:schubert-curve-spanned-tangents` | 4 | no |
| `gap:local-model-curve-spanned-tangents` | 4 | no |
| the other 11 slugs | 2–6 each | yes |

The plan's 11 entries name only FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicPeriodRings, SchemeAndStackFoundations (3), ReductiveGroupsPartII (4), ShimuraVarieties and PadicHodgeTheory. The four entries existed in the plan at submission and were retired in the board commit that answered the first review, when the README of that moment cited GeometricSatakeAndFusionPartII instead; the README has since returned to the contracts, the plan has not.

**Why the reason in H02 does not settle it.** The answer to the previous review says the repair job "allows retiring entries but adding none". The review rules I am given say the opposite for exactly this case: "the package may add gaps to the plan's top-level `gaps` list (nothing else in plan.json changes after the design)", and "the intake announces gaps added at the package stage on the supplier's job when the package is accepted". If the worker's job really cannot edit the plan, the restoration is a one-line human action, since the four entries are in the board history; either way the present head is inconsistent and the contracts are unannounced. The branch-1 alternative (cite GeometricSatakeAndFusionPartII and move this roadmap after it in the merge order) was tried at f55247be and reverted at c24631db; it is not what this head does, so it does not help this head.

**Repair.** Add four `gaps` entries to the plan, each with `supplier` GeometricSatakeAndFusion and `needs` equal to the sentence of README lines 102, 104, 106 and 108:
- `scheme-local-model-representative`, section 4.17;
- `scheme-local-model-hodge-immersion`, section 4.17;
- `schubert-curve-spanned-tangents`, section 0.29;
- `local-model-curve-spanned-tangents`, section 4.17.

Tested: with these four the plan's slug set equals the README's 15; nothing in the README changes.

## Previous findings

- **R01 (two owners for Definition 3.4.4 and the four local-model theorems): repaired on this side.** Line 15 now reads "The scheme geometry of these local models used here is assigned to the same roadmap through the four exact contracts below … none of them is planned here", and "KPZ26 Definition 3.4.4, is stated here in §2.1". This is branch 2 of the previous repair: the merge order is unchanged (GeometricSatakeAndFusion line 130, this roadmap 131, GeometricSatakeAndFusionPartII 205), the four theorems are consumed from GeometricSatakeAndFusion as declared contracts (a stated contract is a supplier citation under the rules), and the definition is owned at the earlier position. GeometricSatakeAndFusionPartII at 3ef4ea3 (unchanged) still states the definition at §0.6 line 309 and the theorems at §2.4 line 476, §3.1 line 571, §4.10 line 844, §4.11 line 854; under the overlap rules the citation now has to come from that later roadmap (cite this §2.1 for the definition; consume the GeometricSatakeAndFusion §§0.29/4.17 contracts for the theorems), so it is a finding on #1836, not a change to this head. The only part still owed here is the declaration of the contracts (R01 above).
- **R02 (plan gaps): not repaired**, raised again as R01 above.
- **R03 (p=2 excluded from Layer 0): repaired.** Line 26: "Layer 0 holds for every prime p, including p=2: there the Zink ring is stable under Lau's modified Verschiebung, and its Dieudonné frame has frame constant θ=2−[4]"; line 138 "For any prime p"; line 391 "For every prime p and every complete Noetherian local ring R". Frames carry a constant θ (lines 28, 183), p-frames are θ=p, and §§0.1, 0.3, 0.8, 0.10, 0.11, 0.13 carry the θ=pu₀ bookkeeping. The p=2 Checks are verified below.
- **R04 (lower-case Needs titles): repaired.** All 78 distinct parenthesized own-section titles in the 92 *Needs:* lines equal their heading text exactly (script comparison, 0 mismatches), for example "§3.14 (Very-good Dᴴ PEL representations)" at lines 982 and 1041.

## Verified sound

**Gate, build and form.**
- Worker's gate at 930a1af: `OK`, every counter 0 including build=0.
- `lake env lean TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII/Suggested.lean` from the worktree: exit 0, no output (34 s).
- Dependency check with `--movable`, full output: `depcheck: 238 roadmaps, 2323 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- The Lean file has `module`, `public import Mathlib`, the module docstring, `@[expose] public section` and an empty namespace. No declaration, so nothing to `#check`, no section variable to lose, no padding to probe.
- Outside-folder diff against origin/main: empty. The folder holds README.md, Suggested.lean and metadata.toml.
- Pins of `lake-manifest.json`: Mathlib f6090c7, Tau Ceti 358314d.

**Headline theorems.** The docstring names 21 headline groups and the missing carrier of each. At the pins: Tau Ceti has no file mentioning Zink, Dieudonné modules, p-divisible groups or parahorics (the only "Dieudonné" hit is Cartan–Dieudonné in `TauCeti/LinearAlgebra/CliffordAlgebra/CartanDieudonne.lean`); Mathlib has `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean:113`, a rational Frobenius module over a perfect field, no finiteness) and `Module.Grassmannian.functor` (`Mathlib/RingTheory/Grassmannian.lean:185`, no representing scheme). No headline is statable without a stand-in, so the empty file is correct.

**Seeded sample (15 targets), every locator read at the text.**
- §0.7: KPZ26 §5.1.1(b), lines 2092–2098, p.48 (Artin local B→R with PD kernel; Î_{B/R}=Î_B⊕[b], V⁻¹([b])=0); Hoff23 Notation 1.19–Lemma 1.21, lines 607–625, p.13; Lau14 Lemma 2.7, lines 687–705, pp.2217–2218, for every p with u₀: its (2-1) shifts logarithmic coordinates, and on the first-coordinate copy [b] it is zero, which is the README's "zero on [b]".
- §1.8: Hoff23 Construction 1.27 and Theorem 1.28, lines 692–715, p.15 (a=m²+m_F R^univ; universality); KPZ26 §5.1.19, lines 2282–2290.
- §2.0: KZ25 §3.4.4, lines 1183–1188, p.27 (J_b(R) for ℚ_p-algebras R; J_b(ℚ_p)⊂M(ℚ̆_p) for b=σ(ṫ)); Kisin17 (1.2.12), lines 644–648, p.14 (J_b≅M_b over L, inner form).
- §2.3: KPZ26 §5.2.1, lines 2298–2300, pp.52–53; KZ25 §§3.2.2–3.2.3, lines 984–997.
- §2.5: KP18 Lemma 3.2.9 and (3.2.10), lines 2139–2165, pp.172–173 (u↦[π] at line 2148; E([π]) a non-zero-divisor at line 2152); Hoff23 Lemma 2.7, lines 857–859, p.18.
- §2.9: KZ25 Definition 3.2.4, lines 998–1000, p.22; KP18 Proposition 3.2.17, lines 2279–2282, pp.175–176.
- §2.13: KPZ26 §5.2.4, lines 2351–2357, p.54 (very good for GL(L) means very good for tot(L); independence of the determining segment by Lemma 5.3.7(b)).
- §3.3: KPZ26 proof of Proposition 5.3.11, lines 2461–2467, p.56: the displayed claim is exactly the curvewise statement.
- §3.7: KPZ26 Proposition 5.3.11, lines 2458–2460, and Corollary 5.3.16, lines 2632–2635, p.60.
- §3.10: KPZ26 Lemma 5.3.7(b), lines 2412–2416, and Remark 5.3.8, lines 2439–2443, pp.55–56 (see Source issues).
- §3.12: KPZ26 §5.2.4, line 2356, and Lemma 5.3.7, line 2407.
- §4.4: KZ25 Proposition 3.3.2(1), lines 1083–1087, p.25 (T_pG∨⊗Ŵ(O_K)≅D(G)(Ŵ(O_K)) taking s_{α,0} to s̃_α); KP18 Proposition 3.3.8, lines 2439–2446, p.180 (Fil⁰).
- §5.7: Kisin17 proof of Proposition 1.1.13, lines 433–446, p.10: c=σ⁻¹(b)μ₀(E(0)), Frobenius c·μ⁻¹(E(u)), filtration induced by μ⁻¹.
- §5.18: Kisin17 Lemma 1.2.18, lines 697–703, pp.15–16, and its proof, lines 713–721: g and σ⁻¹(g₀) have the same image in π₁(G), and Γ-invariance of κ(g) gives κ(g₀)=κ(g) there, which is the README's "(π₁(G)_I)^σ".
- §6.0: KZ25 Definition 2.2.4 (line 437), Lemma 2.1.7 (336), Lemma 2.1.9 (369), Lemma 2.2.6 (444–452), Proposition 2.3.3 (526–544), pp.8–12.

**p=2 repair checked against Lau14.**
- Lemma 1.6, lines 207–217: Ŵ(R) is V-stable iff p≥3 or pR=0; v(1)∈Ŵ(ℤ/pʳ) iff p≥3 or r=1. This is README line 138 "V preserves Ŵ(R) exactly when 2R=0" and the ℤ/4 clause of line 152.
- Lines 227–234: u₀=v⁻¹(2−[2]) for p=2, ṽ(x)=v(u₀x); Lemma 1.7, lines 237–253: Ŵ(R) is ṽ-stable. README lines 26 and 138.
- §2A, lines 546–559: frames with constant θ, φ(a)=θφ₁(a), I+pS⊂Rad(S), strict = u=1. README lines 28 and 183.
- Lemma 2.5 and line 672: D_R is a lifting frame with θ=p (p odd) and θ=2u₀=2−[4] (p=2). README lines 145, 187, 198.
- Theorem A (lines 71–73), Corollary 5.5 (1741–1742, admissible topological rings with countable base, so complete Noetherian local rings with perfect residue field), Corollary 5.6 (1745–1747, Cartier duality). README line 391.

**Cross-roadmap citations resolved at the current heads.**
- GeometricSatakeAndFusion (#1235): §0.29 "Equal-characteristic Schubert models and coefficient comparison" (line 808, affine Schubert varieties over 𝔽_q((t)), so "extending its §0.29" for the Schubert tangent contract is the right section), §0.31 (848), §0.37 (973), §4.17 (2130), §4.18 (2152).
- On content main 39d3d60: ModularCurves §0G (line 901); SchemeAndStackFoundations §§0.6, 1.15, 2.3, 4.1, 4.4, 4.7, 4.8, 4.12 (lines 678, 2502, 3330, 5066, 5194, 5339, 5383, 5613); ReductiveGroupsPartII §§RG2.1.5, RG2.2.4, RG2.3.3, RG2.3.5, RG2.3.7, RG2.4.3 (lines 2446, 3408, 4151, 4664, 5201, 5992) with *division-algebra-building* and *parahoric-kottwitz-characterization* present.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879): §§R07.2.10, R07.2.27, R07.4.20, R07.4.25 headings (lines 3390, 4159, 6372, 6565).
- The worker's `roadmaps resolve` lists no missing cross-roadmap id; its two Lean-name leads `Crystalline.fontaineEnvelope_initial` and `Crystalline.fontaineEnvelope_periodPDEnvelope` are DerivedDeRhamCohomology §PD.7 supplier names, as resolved in the previous round.
- The other 40-odd citations (PrismaticCohomologyPartIII §6.0, AbelianSchemesAndArithmeticModuli §§A4.CR.7.2 and A4.10, CrystallineCohomology §CR.7.1, PadicPeriodRings §§3, 4.1, 4.3, VectorBundlesAndIsocrystals Layers 1 and 6, PadicHodgeTheory §5.5, ShimuraVarieties §7.0i, PELModuli §M2.15) were resolved in the previous round at the same heads; the change set touches none of them.

**Ownership against open pull requests.**
- GeometricSatakeAndFusionPartII (#1836, 3ef4ea3): see Previous findings, R01.
- J_b (§2.0): HeckeStacksAndLocalShtukasPartII (#1844) and AdmissiblePairsAndPadicHodgeStructures (#1511) consume the algebraic σ-centralizer from BunGAndNewtonStrata §1.13 (merge order 186), later than this roadmap (131). This roadmap is the earliest owner; the later roadmaps should cite §2.0. No change here.
- DiamondsAndVStacksPartII (#1830) and RelativeFarguesFontainePartII (#1825) mention none of Zink rings, displays, very-good embeddings or σ-straightness.
- `scratch/overlaps.md`: no pull request changes this roadmap, no cited id is dropped by an open revision, no cited id is defined only by an open revision.

**Declared gaps.** The 11 plan entries match 11 README contracts by slug and supplier. The 4 README contracts without entries are R01. Each of the 15 contracts names its supplier and section, states hypotheses, and asks for nothing an earlier roadmap provides (PadicHodgeTheory §5.5 stops at K/ℚ̆_p finite; Part I §R07.4.20 at finite K/ℚ_p; SchemeAndStackFoundations §4.12 has only global flattening; GeometricSatakeAndFusion §4.17 is v-sheaf only).

**Adversarial table.** Every value below was computed by me at this head.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.1 Check, V at p=2 | R=ℤ₂ | ghost(V(1))−ghost(2)=(−2,0,0,…); coordinates z₀=−2, 2z₁=−z₀² gives −2, 4z₂=−(z₀⁴+2z₁²)=−24 gives −6, 8z₃=−(256+32+144) gives −54; all ≡2 mod 4, valuation stays 1, so not decaying | holds | none |
| §0.1 Check, ṽ(1)=2−[2] | R=ℤ₂ | −[2] has ghost (−2,−4,−16,−256); coordinates (−2,−4,−16,−256), valuations 1,2,4,8 → in Ŵ(2ℤ₂); 2∈δ(ℤ₂) | holds | none |
| §0.1 "V preserves Ŵ(R) iff 2R=0" | R with 2≠0; R an 𝔽₂-algebra | coordinates of V(1)−2 are 2·(unit), nonzero in R, infinitely many, not in ∩mⁿ unless 2=0; for 2R=0, W(k)→W(R) is functorial and V-stable | holds (Lau14 Lemma 1.6) | none |
| §0.3 θ for D_R at p=2 | ℤ₂; ℤ/4; 𝔽₂ | θ=FV(u₀)=F(2−[2])=2−[4]; ghost (2−4,2−16,2−256)=(−2,−14,−254)≠(2,2,2); [4]=0 in W(ℤ/4) and W(𝔽₂), so θ=2 there | holds | none |
| §0.13 Check, D̂(μ_{2^∞}) over ℤ₂ | M=M₁=Ŵ(ℤ₂) | Φ₁=φ, Φ=θφ satisfies Φ|M₁=θΦ₁; rank(M₁/ÎM)=1=dim; over 𝔽₂, θ=2 gives (F,V)=(2,1) as in §0.5; Φ=2φ would need θ=2, false over ℤ₂ | holds | none |
| §0.4/§0.7 φ₁ on [b] at every p | Lau14 (2-1) | ṽ on log vectors: [a₀,a₁,…]↦[0,w₀(u₀)a₀,…]; so ṽ⁻¹[0,a₁,…]=[w₀(u₀⁻¹)a₁,…]=(2-1), and (2-1) on [x,0,0,…] is 0 | holds | none |
| §0.5 at p=2 | 𝔽₂; F=4 on ℤ₂ | (F,V)=(2,1),(1,2), FV=2, 2M⊂FM⊂M; F=4 needs V=1/2∉ℤ₂ and 4ℤ₂⊅2ℤ₂ | holds | none |
| §0.6 pairs | S², M₁=Se₁⊕Ie₂; d=0; d=h | lower-left entry of e₁↦e₂ is 1∉I; d=0: M₁=IM; d=h: M₁=M | holds | none |
| §0.10 j | d=0 at p=2; d=h | j=θ=2−[4] on φ*M; j=id | holds | none |
| §1.3 c | Z=0; Z=Vε | c=[[1,0],[V⁻¹Z̄,1]] = 1, then 1+εE₂₁ | holds | none |
| §2.0 J_b | b=diag(p,1); b=[[0,1],[p,0]]; uTu⁻¹ | off-diagonal x with pσ(x)=x has v(x)=1+v(x), so x=0; slope-1/2 class gives D^×; u diag(2,1) u⁻¹=[[2,−a],[0,1]] and entrywise σ gives −σ(a)≠−a | holds | none |
| §2.5 unit | K=ℚ_p, E=u−p, p≥3 | φ(E([p]))=[p^p]−p; log coordinates of [p^p]/p have exponents p^{n+1}−n−1≥2, so [p^p]=py with y∈Ŵ(pℤ_p), and y−1↦−1 in W(k) is a unit | holds | none |
| §2.7 Check | c=1+εE₂₁, t=E₁₁; torus mod 3 | ct c⁻¹=E₁₁+εE₂₁ (E₂₁E₁₁=E₂₁, E₁₁E₂₁=0); diag(2,1)E₂₁diag(1/2,1)=(1/2)E₂₁, 1/2≡2≠1 mod 3 | holds | none |
| §2.9 Check | line K(e₁+te₂), t≠0 | E₁₁(e₁+te₂)=e₁∉K(e₁+te₂) | holds | none |
| §3.10 Checks | n=0; n=2 | GL(0) trivial, kernel G_m; diag(a,b)E₂₁=bE₂₁ vs E₂₁diag(a,b)=aE₂₁, commute iff a=b | holds | none |
| §3.15 Check | ξ=(1,−1), D=K, m=1 | ψ((1,0),(0,1))=−1, ψ((0,1),(1,0))=1 | holds | none |
| §4.11 Mathlib contract | B=ℤ₃[[T]], I=(3) | B/I=𝔽₃[[T]], ∩Tⁿ(B/I)=0; 3·B[1/3]=B[1/3] contracts to B since B/I has 3-torsion | holds | none |
| §5.7 c | E(0)=ap | residual matrix cμ₀⁻¹(E(0))=σ⁻¹(b); with μ₀(p) instead, residual σ⁻¹(b)μ₀(a⁻¹) | holds | none |
| §5.18 Kottwitz equality | G_m, g=p; general g | crystal lattice pW, κ=1 both ends; κ(σ⁻¹g₀)=κ(g) in π₁(G)_I and σκ(g)=κ(g) give κ(g₀)=κ(g) (Kisin17 lines 719–721) | holds | none |
| §6.0 adapter | G_m μ=1; GL₂ μ=(1,0); unramified rank-2 torus | p: κ=ν=1, pW⊂W; p⁻¹W⊄W; diag(p,1): det valuation 1, length 1, slopes (1,0); t^{(1,0)}σ(t^{(1,0)})=t^{(1,1)} | holds | none |
| R01 declaration | README slugs vs plan slugs | 15 vs 11; undeclared mentions 15, 8, 4, 4 | defect | R01 |
| Previous R01 ownership | ORDER 130/131/205; #1836 lines 309/476/571/844/854 | this roadmap earlier than #1836; contracts on GSF declared in README; the later roadmap owes the citation | no change here | note |
| Needs titles | 78 parentheticals vs headings | 0 mismatches | holds | none |

## Not verifiable

- RZ96, Proposition 1.21, used by §5.3: the manifest records it as `uncertified`; §5.3 cites it through Kisin17's proof of Theorem 2.2.3 (Kisin17 line 1455), read in the previous round. I did not read RZ96.
- I did not reopen Zhu17, vanHoften24, Zhou20, Wintenberger97, RG71, deJong95 or Anschuetz22 this round: none carries a sampled locator and the change set does not touch their citations; they were checked against the cached texts in earlier rounds.

## Source issues

- **Misprint** in KPZ26 at Remark 5.3.8, printed p.56 (KPZ26 line 2440): the source says part (b) amounts to "if this embedding is good at x, then the diagonal embedding is very good at x"; it should be "very good at x" in the hypothesis, as in Lemma 5.3.7(b); affects nothing.
- **Misprint** in Kisin17 at proof of Proposition 1.1.13, author p.10 (Kisin17 line 440): the source writes σ(c) as b times the inverse of υ₀(E(0)); it should be υ₀(σ(E(0)))⁻¹, since E(0)∈W need not be σ-fixed; affects nothing, as both are b times an element of G(W).
