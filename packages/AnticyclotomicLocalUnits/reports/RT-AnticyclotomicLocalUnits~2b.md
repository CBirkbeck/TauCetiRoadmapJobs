<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1062#issuecomment-6400197668 -->
Red team round 2 pass b (claude) of 6c91827

Verdict: accepted

1. **F01** (P3) `5 ≤ p` is stronger than the stated theorem needs; the statement holds at p = 3

   Location: `packages/AnticyclotomicLocalUnits/Suggested.lean:55` ("theorem exists_auxiliaryQuadraticField (p : ℕ) (hp : p.Prime) (hp5 : 5 ≤ p)") and `packages/AnticyclotomicLocalUnits/README.md:631` ("For every prime p≥5, construct an imaginary quadratic K …").

   Claim: the existence of K with 2 split, p inert and p∤h_K needs p ≥ 5.

   Witness: at p = 3, K = ℚ(√−7): −7 ≡ 1 mod 8 so 2 splits; (−7/3) = (2/3) = −1 so (3) is prime; h = 1 so 3 ∤ 1. At p = 2 the statement is false (2 cannot both split and be inert), so the sharp hypothesis is `p ≠ 2`. Neither the proof route (README:635: the bound for p ≥ 53 and a table for small p) nor any consumer uses p ≥ 5 for this lemma; the standing p ≥ 5 is the roadmap's convention for the Lubin–Tate data, not for this field.

   Repair: in `Suggested.lean:55` replace `(hp5 : 5 ≤ p)` by `(hp2 : p ≠ 2)` and in the docstring "For every prime p at least five" by "For every odd prime p"; in README:631 write "For every odd prime p (the roadmap uses p≥5), construct …" and add "p=3: D=−7" to the worked example at README:1150. Tested: for every odd p the route's choice of d (README:635) is unchanged; at p=3 the table entry D=−7 satisfies all three clauses as computed above. Optional; the statement as written is true.

Round 2, pass b. The whole of `packages/AnticyclotomicLocalUnits/README.md` (1172 lines) and `packages/AnticyclotomicLocalUnits/Suggested.lean` (69 lines, one declaration) were read line by line at head `6c91827`. Every round-1 finding was re-tested against this head first; the full adversarial pass follows, with fresh attention to the Lean declaration added by the repair, the two rewritten supplier contracts, the new §0.3 target, and the sign correction at §5.3.

## Round-1 findings at this head

| Id (report) | Status | Witness at 6c91827 | New error introduced? |
|---|---|---|---|
| r1a F01 (P2) auxiliary field absent from the acceptance test | **Repaired** | `Suggested.lean:55–67` states `exists_auxiliaryQuadraticField (p) (hp : p.Prime) (hp5 : 5 ≤ p)` with degree two, `IsTotallyComplex`, `(2)=P*Q` for distinct primes, `(p)` prime, `¬ p ∣ classNumber`; README:631 names it and lists the same five clauses; Checks at README:639–641 (ℚ(√−7) positive, ℚ(√−15) at p=5 negative). | None found; the signature matches BKO21 line 339 (a)–(c) clause for clause. One P3 on the hypothesis `5 ≤ p`: S01. |
| r1a F02 (P2) coordinate gap duplicated SelmerIwasawaCohomology §3.0 | **Repaired** | README:74–78 cites §3.0 with `iwasawaAlgebra_mvPowerSeries_equiv`, `iwasawaAlgebra_isRegular_augmentation`, `iwasawaAlgebra_twist`; the gap `quadratic-coefficient-coordinates` now asks only the naturality comparison and §4.5 agreement (README:78, plan.json entry identical); §0.5 *Needs:* repointed (README:257). Checked at #869 head `1fa1c7d`: `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1318,1322,1332,1342` state the three names with `Tw_κ(γ)=κ(γ)γ`, so `Tw_κ(σ−κ(σ))=κ(σ)(σ−1)` as README:76 says. | None. |
| r1a F03 (P2) derivatives defined on pure tensors only | **Repaired** | README:297 defines δ̃, δ̃_n on finite presentations `Σ_i u_i⊗a_i⊗v⁻¹` of `Ũ∞*` and restricts to Δ-invariants; projected-generator rule and the order-three tensor Check at README:306,317. Recomputed: z=(1⊗1+ζ⊗ζ⁻¹+ζ²⊗ζ⁻²)/3 has dz=ζz and multiplication image (1+1+1)/3=1. | None. |
| r1b F01 (P2) norm-control gap compound, clause (iv) owned here | **Repaired** | README:88 `needs` now ends with "identifying these coinvariants with the norm image in Z(K_n)_ψ" (plan.json entry identical); README:199–201 states finite-level freeness of rank `[K:ℚ_p]p^(2n)` as this roadmap's target with Win80 §§5.2–5.5.3 and the exceptional condition. Checked: Win80 line 296 (Lemme 5.5.1) gives rank d·p^{nr}, r=2 ⇒ d·p^{2n}; Win80 line 98 defines the exceptional character as the action on μ_p, i.e. the tame cyclotomic character as README:201 says; Win80 line 192 (Lemme 5.2) gives exactly clauses (i)–(iii) of the retained gap, with injectivity of σ−1 unconditional. | None. The README restricts §0.3 to nontrivial ψ although Win80 (i) also covers ψ trivial when r=2; forced by the route (coinvariants = norm image fails for ψ trivial, Win80 line 305–306), so not a narrowing defect. |
| r1b F02 (P2) duality asked from PMIA | **Repaired** | README:80–82 new subsection "From TauCetiRoadmap.CompletedCohomologyPartII" with `D_t(M)=Hom_cont,O(M,Φ/O)`, inverse-precomposition action, §3.2 biduality; gap reduced to finite-free limit commutation (README:72); §2.3, §2.4, §7.4 *Needs:* and Layer 2/7 dependency lists updated (README:454,468,1043,1051). Checked at #1035 head `92dc4a1`: `TauCetiRoadmap/CompletedCohomologyPartII/README.md:807–815` (D_t, left action `(g f)(m)=f(g⁻¹m)`) and `:836–838` (M≅D_tD_tM for compact inverse limits of finite ϖ-primary modules; V≅D_tD_tV discrete). CompletedCohomologyPartII precedes this roadmap in ORDER.txt. | None. |
| r1b F03 (P3) LFR cited for normal basis | **Repaired** | README:66 reads "pro-p property and ramification"; normal basis is credited to Mathlib at README:50 and in §0.3/§3.3 *Needs:* ("Mathlib normal basis"). `IsGalois.normalBasis` at pinned `Mathlib/FieldTheory/Galois/NormalBasis.lean:120,127`. | None. |
| r1b F04 (P3) §5.3 sign locator | **Repaired** | README:756: "The displayed Honda-type and parameter signs in part (ii) are interchanged: the proof's Frobenius εp gives type p−εX² and parameter εp." Re-read BKO21 lines 573–588: statement pairs ±2p with ∓p, proof has ϕ_q=±p. LT.4 design README:757 states the same convention (a_q=2sp ⇒ Frobenius [sp], parameter sp). | None. |

No round-1 finding was marked `not actionable in this package`; nothing is re-raised.

## Verified sound

Counts: declarations read 1 of 1; README targets read 50 of 50 (§§0.1–0.5, 1.1–1.5, 2.1–2.5, 3.1–3.7, 4.1–4.5, 5.1–5.9, 6.1–6.5, 7.1–7.4, 8.1–8.5) plus the Conventions, Examples and Worked examples; Checks tested with computed values 98 (every Check bullet, the Conventions table and the four worked examples); source locators opened this round 31 (BKO21 lines 249–309, 339–362, 366–395, 516–550, 573–600, 785–797; Rubin87 lines 112–130, 316–330, 505–522; Win80 lines 98–125, 185–198, 285–330), all supporting the claim they are cited for, and the printed pages agree (BKO21 page = PDF page + 941; Win80 + 87); sibling citations resolved 23 roadmaps (every roadmap named in the README exists on main, at an open head, or as a board design package) and 57 section/node citations; pinned declarations resolved 30 (24 Tau Ceti at `a91d3aaf`, 6 Mathlib at `6b7abb3c`).

Lean versus README (`exists_auxiliaryQuadraticField`): the type carries `p`, `Nat.Prime p`, `5 ≤ p` and existentials for the field and number-field instances; the five conjuncts match README:631. Carriers at the pin: `NumberField` (`Mathlib/NumberTheory/NumberField/Basic.lean:42`, a `Prop` class over `[Field K]`), `IsTotallyComplex` (`…/InfinitePlace/TotallyRealComplex.lean:209`), `classNumber : ℕ` (`…/ClassNumber.lean:64`, positive by `classNumber_pos`, so `¬ p ∣ classNumber` is not vacuous), `Ideal.IsPrime` (proper by definition, so neither factor of (2) nor (p) can be the unit ideal; in a domain the zero ideal is prime but `P*Q=(2)≠0` excludes it). Degree two plus totally complex is exactly "imaginary quadratic"; `(2)=P*Q` with `P≠Q` prime is exactly "2 splits" (ramification would give `P=Q`); `(p)` prime is exactly "p inert". The universe `Type` is fine for an existential. No sorry'd data, no `set_option`, no `lemma`, one `import Mathlib`, one module docstring in the required form, namespace `TauCetiRoadmap.AnticyclotomicLocalUnits`, one `/-! ## Layer 4 … -/` section comment. No padding: the one declaration is the §4.1 headline the round-1 repair added; it is not one tactic from the library (it needs Dirichlet's class-number formula with an explicit `L(1,χ)` bound, or a table).

Headline theorems: the module docstring lists, layer by layer, every headline of README (§§0.3, 0.5, 1.1, 2.2–2.5, 3.6–3.7, 4.1 assembly, 4.5, 5.9, 6.4–6.5, 7.2–7.4, 8.2–8.5) and names the missing carrier for each; I confirmed at the pins that no Lubin–Tate formal O-module, division tower, Coleman interpolation, signed point module or integral modular parametrisation exists (`TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/` has only the elliptic formal group and its points; no file mentions Lubin–Tate). The one other statable auxiliary existence (§5.1: a curve over ℚ with good reduction and a_p=0) is not a headline: its substance is the declared gap `supersingular-trace-classes`, and the lift to ℚ is immediate; I do not raise it.

Policy: `git diff --stat origin/main...HEAD` touches only `packages/AnticyclotomicLocalUnits/` (README, Suggested.lean, `design/plan.json` gaps, metadata, sources.toml, four reports). No pull-request numbers, process words, lowercase `lemma`, `set_option` or algorithmic targets in README or Lean (grep). All nine gap slugs occur with identical `needs` in README and `design/plan.json`; none has supplier `none`. Every target has a locator.

Dependency check, run read-only with `--movable`, output exactly:

```text
depcheck: 52 roadmaps, 593 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. Supplier existence this round: on main — LocalFieldsRamification Layers 0–3 (`README.md:59,267,561,705`), ProfiniteArithmetic §1.3 (`:403`), PadicMeasuresIwasawaAlgebras §§1.7, 4.2–4.5, 5.2 (`:909,2409,2485,2530,2620,3367`; `exists_completedCoordinate` at its `Suggested.lean:650`), ClassFieldTheory §§2.5–2.6, Layers 5–8 (`:416,460,920,1220,1312,1433`), EllipticCurves Layers 1, 3, 4, 5 (`:423,683,793,1154`), ModularCurves Layers 5, 8, 9 (`:1279,1648,1803`), ModularForms 10B (`:1068`; genus formula `g = 1 + d/12 − ε₂/4 − ε₃/3 − ε∞/2` at `:1116`), SchemeAndStackFoundations §3.2 (`:4671`, scheme Riemann–Hurwitz), ImaginaryQuadraticClassNumber H1.3, H2.1–H2.3 (`:35,53,57,67`). At open heads — SelmerIwasawaCohomology §3.0 (#869), CompletedCohomologyPartII §§3.1–3.2 (#1035), IntegralIwasawaTheory §7.1 with `colemanSeriesBasis`, `colemanNorm`, `colemanTrace`, `localUnitNormLimit`, `colemanInterpolation` (`:830–843`) and §7.2 (`:856`, E=ℚ_p; the general norm-control contract is a declared gap on it) (#1306), ColemanPowerSeries Layer 1 (`:4931`) (#1309), ArithmeticGaloisDuality R02.1.2 with Tate's `lim¹` sequence (`:555,564`) and R02.1.3 with `W[pⁿ]=p^{−n}T/T` (`:641,704`) (#858), ModularCurvesPartII §§3.2, 3.9, 5.2, 5.3, 9.9–9.11, 12.1 (`gammaZeroPrime_mass`, exceptional edges exactly at p≡3 mod 4 and p≡2 mod 3), 13.2, 13.7, 16.6 (`:970,1202,1757,1785,2960,2994,3011,3365,3369,3511,3663,4512`) (#913), EllipticCurveModularity R29.5–R29.6 (`:1465,1599`) (#1018), PadicHodgeRegulators §1.4 (`dualExp`, kernel `blochKatoG`, ordered adjunction, log χ ↦ 1) and §1.7 (`:507–514,556`) (rev 1498). Board design packages — LubinTateFormalModulesAndQuasiCanonicalLifts: every node the README names (LT.0–LT.2, LT.4/unramified-honda-comparison, LT.4/elliptic-honda-comparison, LT.5–LT.6, LT.7/bko-quasi-fields, LT.7/ringclass-galois, LT.7/lattice-neighbors, LT.8/bko-character-data, LT.8/quadratic-directions, LT.8/bko-fields, LT.8/field-generator-comparisons, LT.8/sign-generator-comparison, LT.9) is a node of its `design/README.md`; NonordinaryCMSpecialValues NCM.0–NCM.5 including NCM.0/auxiliary-prime (`design/README.md:122–138`: l ≥ 5 split, l∤p·h_K·N(f), p∤(l−1), matching BKO21 line 388–390) and NCM.5/unramified-cm-coefficients, NCM.5/scalar-tensor-character-comparison; InertAnticyclotomicCMMainConjecture (consumer only; cites this roadmap 15 times, cited by nothing here). Ownership: `roadmaps grep` over today's index for Rubin's conjecture, signed anticyclotomic local units and Coates–Wiles derivatives returns only bibliographic mentions (ComplexMultiplicationAndExplicitReciprocity cites BKO21 §3.0.1 for CM L-factors; its `cmHeckeCharacter.test_inert_baseChange` records ψ((7))=−7, agreeing with φ((p))=−p here) and the Rubin–Brumer–Stark element; no second owner of the height-two signed units, the primitive modular point or the trace system.

The computed pass (p=5, π=−5, O=ℤ₂₅, Λ=O[[T]] unless stated; every row carries values):

| Statement | Instances and computed values | Result |
|---|---|---|
| Conventions: π/p bases | [−5](−w₁)=[−1][−1][5]w₁=w₀; [−5]w₁=−w₀; v_n=[(−1)^n]w_n gives [−5]v_{n+1}=[(−1)^{n+2}][5]w_{n+1}=v_n | signs as stated |
| Conventions: degrees, conductors | [Θ_n:Φ]=1,25,625; [Ψ_n:Φ]=1,5,25; Δ order 24, Δ′ order 6; orders 1,5,25 ↦ c=0,2,3 ↦ Ξ⁺,Ξ⁺,Ξ⁻; exact order p^r trivial on 1+p^{r+1}O (=p^rΓ) but not on 1+p^rO, so conductor exponent r+1 | table correct; BKO21 line 250–252 agrees |
| Conventions: cyclotomic tame character | χ_cyc=N∘κ on inertia, N(x)=x^{1+p} on 𝔽₂₅ˣ, so χ_cyc|Δ=ω⁶; 6≢1 mod 24 | ω nonexceptional; μ_{p^∞}⊂Φ∞ (Art_Φ(−p) acts on μ_{p^∞} through Art_{ℚ_p}(p²), trivially), so the exceptional clause is genuinely needed |
| §0.1 | inversion fixes the quotient Gal(Ψ_r/Φ), c(χ⁻¹)=c(χ); level zero has only χ=1, c=0 | partition exhaustive and disjoint |
| §0.2 | e_ω on ω-vector 24/24=1, on η≠ω 0/24=0; e_ω²=e_ω; Ũ∞≅(lim P_n)⊗O since O≅ℤ_p² transports a compatible family to a pair | consistent |
| §0.3 (general) | d=2, r=2: A_ψ≅O, coinvariant rank 2·25^n=2,50,1250; Z(Φ_n)=ℤ_p×P_n and the ℤ_p part has trivial Δ-action, so Z_{∞,ψ}=(lim P_n)_ψ for ψ≠1; ψ⊗O=ω⊕ω^p so U∞≅Z_{∞,ψ} | rank two over Λ₂ (Rubin87 line 116) |
| §0.3 negative model | M=O, γ₊↦6, γ₋↦1: level-0 coinvariants O/5O, 25 elements, all 5-torsion | excluded by nonexceptionality |
| §0.4 | (d·x)(v)=d(x(κ(d)⁻¹v)); for x=m⊗v⁻¹ with dm=ω(d)m: d·x=κ(d)⁻¹ω(d)x=x on U∞* | inverse twist as stated; a=2 gives factors 1/2 and 2 |
| §0.5 | σ−1 on U∞* ↔ κ(σ)⁻¹(σ_U−κ(σ)) on U∞; ratio (σ^{6}−κ^{6})/(σ−κ) at σ=κ is 6κ^5, a unit; in S=σ−1 coordinates ((1+S)^6−1)/S has constant term 6 | quotients agree and are generator-independent |
| §1.1 | identity family: f=1, N_F(1)=1, derivative 0; v′=bv ⇒ f∘[b⁻¹](bv_n)=u_n; Z=X+X² formal inverse −Z+2Z²+… | consistent |
| §1.2 | h=f′/(fλ′): from f([π]X)=∏_w f(X[+]w), λ′([π]X)[π]′=πλ′, λ′(X[+]w)·∂(X[+]w)/∂X=λ′(X): Σ_w h(X[+]w)=πh([π]X); at X=v_{n+1}: Tr_{n+1/n}δ_{n+1}=πδ_n; f_{du}=f_u∘[κ(d)] so δ_n(dx)=dδ_n(x) | trace relation and equivariance hold |
| §1.3 | δ_χ=π^{−n−1}Σχ(g)gδ_n (BKO21 line 291); level n+1 sum = π·(level n sum), π^{−n−2}·π=π^{−n−1}; χ(g)=ζ₅ gives covariance ζ₅⁻¹=ζ₅⁴ | level-independent, χ⁻¹-covariant |
| §1.4 | Σ_{w≠0}h(w)=πh(0)−h(0); δ_1=π^{−1}(π−1)h(0)=(1−π⁻¹)δ=6δ/5; at level n: Tr_{Φ_n/Φ}δ_n=π^nΣ_Δ dδ_0, consistent | Euler factor 6/5 |
| §1.5 | ξ*: δ_1=6/5≠0 so ξ*∉V^{*,−}; W=O[ζ₅]: ζ₅⊗1−1⊗ζ₅≠0 maps to 0 under multiplication | same-parity/opposite-parity as stated |
| §2.1 | F(Φ)≅pO by λ (convergent on pO since 1>1/(p−1)); F(Φ)/πF(Φ)≅pO/p²O, 25 elements; F[π^k] killed by p^k since π^k=±p^k, so Cartier dual lands in μ_{p^k}; Tr_{𝔽₂₅/𝔽₅}(1)=2, Tr(3)=6=1 | consistent |
| §2.2 | a_n=n−⌊(n−1)/2⌋=1,2,2,3 (Haz77 line 37); n=0 excluded; F[π]∩F(Θ∞)=F[π]^Δ=0 since Φ₀∩Θ_n=Φ | consistent; ramified-base estimate correctly kept as own target |
| §2.3 | values on Q⊗π⁻²,Q⊗π⁻¹: 1/25, −1/5; ×π: (−5)(1/25)=−1/5, (−5)(−1/5)=1≡0; 1/5,3/5 trace to 2/5,1/5 | nonzero, transition-compatible (BKO21 lines 522–528) |
| §2.4 | untwisted eigenvalue κ(σ): after inverse twist κ⁻¹κ−1=0 | correct direction |
| §2.5 | m→m+1: πA/π^{m+2+k}=A/π^{m+1+k}; m=k=0: −A/5; BKO21 line 545 has the same π^{−m−1−n} factor for y∈F(Θ_n) | formula as in the source, restricted to Ψ_n and V* |
| §3.1 | λ_χ=p^{−m}Σχ⁻¹(g)λ(y)^g (BKO21 line 537); base point a: 5a/5=a; order-5 χ: aΣζ^i=0 | consistent |
| §3.2 | A_0⁺=0, A_0⁻=F(Φ); A_1⁺=0, A_1⁻=F(Ψ_1); pO⊂O tensors to ×p on Φ/O with kernel of 25 elements | consistent |
| §3.3 | orbit dimensions 1 / 1,4 / 1,4,20; Ramanujan sums integral so p^n e_S∈ℤ[G_n] for Galois-stable S | integral projector route valid |
| §3.4 | ranks (A⁻,A⁺): (1,0),(5,0),(5,20),(105,20) at n=0..3 (python); p^n e_{Ξ⁺}y∈A_n⁻ and p^n e_{Ξ⁻}y∈A_n⁺ | sum and unbounded ranks |
| §3.5 | [π](gz−z)=0 ⇒ gz−z∈F[π]∩F(Ψ∞)=0 | saturation |
| §3.6 | plus point (support Ξ⁻) against plus unit (zero on Ξ⁻): termwise 0; BKO21 line 547–549 states the same orthogonal complement | consistent |
| §3.7 | ambient rank 2, two positive quotient ranks ⇒ signed ranks ≤1; A_n⁻ ranks 5,105 unbounded | consistent (BKO21 line 550) |
| §4.1 | BKO21 line 339: (2/D_K)=+1 ⇔ −D_K≡1 mod 8 ⇔ 2 splits; p inert; p∤h_K. Route: m≡7 mod 8, 1≤m<8p, −m=dc² with c odd ⇒ d≡1 mod 8, (d/p)=(−m/p)=−1, p∤c. Bound √(8p)(2+log 8p)/π: 52.7612 at p=53, 48.94 at p=47 (so the table is needed), ratio to p decreasing (0.995, 0.782, 0.313 at 53, 100, 1000). Euler criterion D^{(p−1)/2}≡−1 for all 13 pairs; D≡1 mod 8; h=1,2,3 | theorem true; S01 on the hypothesis only |
| §4.1 negative Check | ℚ(√−15) at p=5: disc 0 mod 5, (5)=𝔭² | fails inertness as stated |
| §4.2 | exact order l^r ⇒ conductor l^{r+1} (l-part of (ℤ/l^{r+1})ˣ is ℤ/l^r); Δ average over 24, Δ′ trace 6 terms | consistent with NCM.0 design README:30 |
| §4.3 | finite coefficient π^{−n−1}: −1/5, 1/25 at n=0,1; supplied dualExp(log χ_cyc)=1 | consistent |
| §4.4 | φ((p))=−p (canonical character: ε(p)=(−D/p)=−1 for p inert), removed factor 1−(−5)/25=6/5; signs +,+,− for c=0,2,3 | consistent with NCM.0/canonical-root-sign |
| §4.5 | all coordinate derivatives in 5O ⇒ tensor derivative in 5W; unit derivative ⇒ some coordinate valuation 0 | consistent |
| §5.1 | #E(𝔽₅)=6, #E(𝔽₁₁)=12 for y²+y=x³; #E(𝔽₇)=8 for y²=x³−x (python): a_p=0; conductors 27, 32; a_{25}=0²−10=−10 | consistent |
| §5.2 | c_E∈ℤ_pˣ at p∤N (AU96 Theorem A); t+t² derivative 1; t^5 derivative 0 | consistent |
| §5.3 | ϕ_q=±p (BKO21 line 583–586); counts 1+25∓10=16,36; −5≡1 mod 6, ≡2 mod 7 | sign correction right; stable ≠ fixed |
| §5.4 | N(±2p)=(p+6−4(−3/p)−3(−1/p))/12 = m+d+e checked symbolically; values (1,2,0),(1,0,2),(2,2,2),(1,0,0),(5,2,2) at p=5,7,11,13,47; 12m+4d+6e=p−1 all cases; m=⌊(p−1)/12⌋ for p≡1,5,7,11 mod 12 | formulas correct |
| §5.5 | 2g−2=μ/6−e₂/2−2e₃/3−c≤μ/6; μ=36,48, g=1 for N=27,32 ⇒ different 0 | bound correct; X₀(27), X₀(32) have genus 1 so f_E is unramified there |
| §5.6 | mμ>μ/6 ⇔ m≥1 ⇔ p≥13; p=47: 3μ vs displayed μ(3−3/2−1−1/2)=0 | stronger bound correct |
| §5.7 | fibre over j=0 has ≥μ/3 points (indices 1 or 3), over 1728 ≥μ/2; 12>6, 24>8 | correct |
| §5.8 | Frob=−p ⇒ Ā(𝔽_{p²})=Ā[p+1]≅(ℤ/(p+1))², exact order M=p+1 exists; φ(p+1)≤(p+1)/2<p so p∤φ(M); φ(6)=2, φ(8)=4; ζ₃-stable cyclic order-27 subgroup would be an ideal of ℤ[ζ₃] of index 27 with cyclic quotient, but ℤ[ζ₃]/(λ³) has exponent 9; likewise ℤ[i]/(1+i)⁵ has exponent 8 | levels 27, 32 remove the stabilisers as claimed |
| §5.9 | (p+1)²=36≡1 mod 5 keeps the disk isomorphism; λ(Q)∈5O∖25O ⇔ Q∉[5]F(Φ) since [p]F(Φ)↔p²O | consistent |
| §6.1 | #(O/p^s)ˣ/#(ℤ/p^s)ˣ=p^{2s−2}(p²−1)/(p^{s−1}(p−1))=p^{s−1}(p+1): 6,30,150 | consistent |
| §6.2 | Gal(Ψ′∞/Φ)≅Oˣ/ℤ_pˣ≅ℤ/(p+1)×ℤ_p, torsion Δ′; fixed field of Δ′ in Ψ′_{s+1} has degree p^s=[Ψ_s:Φ] | consistent |
| §6.3 | level 0: all p+1 index-p overlattices of Ot are non-O-stable since O/p is a field (p inert), so T_px_0=Σ_{Δ′}dx_1=y_0; s≥1: p outward + 1 inward; lines (1,a), (0,1) distinct | Hecke relation as stated |
| §6.4 | a_p=0: Tr_{Ψ′_{s+1}/Ψ′_s}x_{s+1}=−x_{s−1}; Tr_{Ψ_1/Φ}y_1=Tr_{Ψ′_2/Φ}x_2=Tr_{Ψ′_1/Φ}(−x_0)=−6Q=−y; Tr_{Ψ_{s+1}/Ψ_s}y_{s+1}=−Tr_{Ψ′_{s+1}/Ψ_s}x_s=−y_{s−1} using Ψ′_{s+1}=Ψ′_sΨ_s, Ψ′_s∩Ψ_s=Ψ_{s−1} | relations hold; the rectangle (LT.9) is the needed input |
| §6.5 | λ_χ(y_s)=−p⁻¹λ_χ(y_{s−2}) for χ through Ψ_{s−1}; descent stops at s′∈{r+1,r+2} where the exact-order-p^r sum over G_r of a G_{r−1}-function vanishes; total traces T_n=−pT_{n−2}, T_1=−y: −y, 5y, −25y | parity and total trace correct |
| §7.1 | Ĥ⁰(G_n,O[G_k])=O/p^{n−k}, H¹=0 (induced module, O torsion-free); h(O[G_k]/O[G_{k−1}])=p^{−2}; h=p^{2(n−1)}·p^{−(n−1)}=1,25,625 at n=1,3,5 (python) | Rubin87 line 508 agrees |
| §7.2 | Oy=F(Φ) by primitivity; N⊇p^{(n−1)/2}Oy so |Ĥ⁰|≤|O/p^{(n−1)/2}|=p^{n−1}; |H¹|=|Ĥ⁰|/h≤1 | vanishing; y=5y′ would only give 625 |
| §7.3 | invariants of 0→A⁻→A⁻⊗Φ→D⁻→0 with H¹(Γ⁻,A⁻)=0: F(Φ)⊗Φ/F(Φ)≅Φ/O; π-torsion of Φ/O has 25 elements | consistent |
| §7.4 | D⁻=Hom(X⁻,Φ/O) (§3.6), (D⁻)^Γ≅Φ/O ⇒ X⁻/(γ−1)≅O ⇒ X⁻ cyclic, Λ/I with positive rank ⇒ I=0; kernel of split Λ²→Λ projective rank 1, free over local Λ; Λ/(T) has residual dimension 1 but rank 0 | consistent |
| §8.1 | δ(q(ξ*))=f(0)δ(e); unit ⇒ f(0) unit ⇒ f unit (`isUnit_iff_constantCoeff`); coefficient-of-T sends T↦1 yet T is not a unit | augmentation linearity essential |
| §8.2 | V^{*,+}→X⁻ injective (∩=0), image ⊇Λq(ξ*)=X⁻; v−w∈ker q=V^{*,−} ⇒ sum is all of V*; det 1 vs det p with cokernel 𝔽₂₅[[T]] (infinite) | integral decomposition (BKO21 line 791–797) |
| §8.3 | χ=1: δ_1(ξ*)=6/5≠0; exact order 25 orbit dimension 20 | consistent |
| §8.4 | δ_χ(rv_ε)=r(χ⁻¹)δ_χ(v_ε); δ_χ kills V^{*,−ε} for χ∈Ξ^ε so vanishing on v_ε kills all of V*, contradicting §8.3; generator change multiplies by aug of a Λ-unit | consistent (BKO21 line 308) |
| §8.5 | n=2: plus corank 20 (order-25 characters), minus corank 5 (χ=1 and four order-5), 20+5=25; degree-5 trace: λ_1(Tr y)=5a | consistent |
| Lean `exists_auxiliaryQuadraticField` | p=5: K=ℚ(√−7) satisfies all conjuncts; p=2: false (so `hp` cannot be dropped to `p≠2` further); p=3: true (S01) | true as stated |

Cosmetic, not findings: README:983 lists "ModularCurvesPartII §9.11 (gap:good-model-hecke-comparison)" twice; README:191 cites the coefficient gap as "§5.2" while README:265 cites "§§1.7, 5.2" (the plan names section 5.2; both are consistent with the contract at README:72).

## Not verifiable

- Lean: not built. The board checkout carries no toolchain or `.lake`, and this pass runs no Lean; the `#check @exists_auxiliaryQuadraticField` audit could not be repeated here. The repair report's elaboration (exit 0, one sorry warning) is the only build evidence; I instead read each carrier at the pinned Mathlib sources listed above, and the signature needs no section variable (it has none).
- Wiles78 and Kato93: uncertified by the manifest; cited by locator only. The formulas used were checked against Rubin87 line 322–323 (p-adic basis, factor p^{−n−1}) and BKO21 line 545 (π-adic basis, factor π^{−m−1−n}); the sign change between the two is the (−1)^n basis change of BKO21 line 272–274.
- BKO21 (3.6)–(3.7): the extraction drops the conjugation bar, so the overline on φ in §4.4 is checked only through the Euler-factor value 1+1/p.
- Ownership against open pull requests was checked with the sibling checkouts the brief lists, the board package index and the `roadmaps grep` service over today's index; design-stage packages other than LubinTateFormalModulesAndQuasiCanonicalLifts, NonordinaryCMSpecialValues and InertAnticyclotomicCMMainConjecture were not opened.
- The declared gaps are contracts; their mathematical adequacy was checked (each is a stated theorem with hypotheses, none asks for something already at the pins or in an earlier roadmap, each slug matches plan.json), their future proofs were not.

## Source issues

- none

(The four entries registered in round 1 — BKO21 Lemma 5.1(ii) sign pairing, BKO21 Lemma 5.2(ii) bound vanishing at p=47, Rubin87 Lemma 4.2 continuity-versus-augmentation, BKO21 Theorem 5.8 proof's maximal-ideal step — were re-read at BKO21 lines 573–600 and 793–797 and stand; no new mistake was found in the 31 locators opened this round.)

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c91827", "job": "RT-AnticyclotomicLocalUnits~2b", "model": "fable", "worker": "fable-rt50"} -->

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6c91827", "job": "RT-AnticyclotomicLocalUnits~2b", "model": "fable", "worker": "fable-rt50"} -->
