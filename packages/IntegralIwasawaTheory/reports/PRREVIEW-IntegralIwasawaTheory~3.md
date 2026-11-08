# Review of IntegralIwasawaTheory (pull request #1306 at 78ec69e)

**Verdict:** needs changes

This is an incremental re-review of the 131 lines that changed since 5d2ed25. All seven findings of the previous review are repaired. The rewritten §8.4 states its quadratic presentation without the hypothesis it needs (P2). Two of the requested locator repairs introduced page slips (P3). The gate passes at this head, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only `sorry` warnings.

## R01 (P2) — §8.4: the equal-rank (quadratic) presentation needs every ramified place in S∪T

Location: `TauCetiRoadmap/IntegralIwasawaTheory/README.md` line 1054: "Under tame ramification in T and torsion-free `O^×_{H,S,T}`, prove `ritterWeiss_projectivePresentation` … The required presentation is the map `V^θ→B^θ` between projectives of equal rank on each component … deduce … that ∇ is quadratically presented".

Claim: the only hypotheses stated are DKSW's (B) (tame at T) and (C) (torsion-free smoothed units). Under those, `V^θ` and `B^θ` are projective, but they have equal ranks only under condition (A): every finite place ramified in H lies in S∪T. Without (A) the cokernel ∇ has extra rank from the ramified places outside S∪T. Then the padding step "`V^θ⊕Q` free, so `B^θ⊕Q` has the same constant rank" fails, and so does the appeal to `TauCeti.isQuadraticallyPresented_of_finite_maximalSpectrum`. The divisor/class sequence in the preceding paragraph does assume `S∪T⊇S_∞∪S_ram`, but the presentation paragraph does not carry that hypothesis over.

Witness: dksw lines 251–255 and 262 (Theorem 2.2: the sequence is "a quadratic presentation" only "if we additionally assume (A)"). dksw lines 1299–1323 (Lemma 4.5: X gains a factor `W*_w` for each ramified w∉S∪T, and X = `X_{S,H}` only under (A)). dk line 1466 makes the same restriction.

Repair: add `S∪T⊇S_ram` (DKSW condition (A)) to the hypotheses of the equal-rank presentation and of the `TauCeti.IsQuadraticallyPresented` deduction. Without (A), state only the projective presentation with its excess rank, which is the `R^r→R^{r+s}` case that §8.5 already treats with `Fitt^s`. I checked the repair against the source: under (A), Lemma 4.5 gives X = `X_{S,H}`, and the rank comparison in the proof of Proposition 4.13 (dksw lines 1504–1509: `O*⊗ℂ ≅ X_{S,H}⊗ℂ ≅ ∇⊗ℂ`) gives equal ranks on every component. The Q-padding argument then goes through. DK's own sets (dk lines 1168–1170) satisfy (A).

## R02 (P3) — Washington 1975, Lemma 4 is on p. 184; the repair moved it to p. 185

Location: `README.md` line 669 (§5.5): "(Washington 1975, Lemma 4 and proof, p. 185; …)".

Claim: the previous review's R06 asked for p. 185, and that request was wrong. Lemma 4 and its whole proof are on printed p. 184. The earlier text, p. 184, was right.

Witness: washington1975 lines 349–365. PDF page 9 starts at line 349, with the running head "184 Lawrence C. Washington" at line 350. Lemma 4 is at line 358 and its proof ends at line 365. The p. 185 head first appears at line 390.

Repair: change it back to "Washington 1975, Lemma 4 and proof, p. 184".

## R03 (P3) — three repaired page ranges stop a page short

Location and witness:
- (a) Line 174 (§1.3): "(RJW, proof of Lemma 12.18, p. 185.)". The proof starts on p. 185 (rjw line 3664), but the total-exponent and phase argument this paragraph cites is on p. 186 (lines 3674–3694; p. 186 begins at line 3669).
- (b) Line 347 (§2.4): "Proposition 3.2.15 and Corollary 3.2.16, p. 82". Corollary 3.2.16 is on p. 83 (sharifi line 2483; p. 83 begins at line 2480). Line 414 already has "pp. 82–83".
- (c) Line 782 (§6.3): "AWS notes, §2.5, p. 21" is cited for the Mellin relation `a(T)=u(1+T)⁻¹−1`. That relation, `g_k(T)=f_k(υ(1+T)⁻¹−1)`, is on p. 22 (sharifi-aws line 704; p. 22 begins at line 679). Only `f_k` is on p. 21 (line 671).

Repair: (a) "pp. 185–186"; (b) "pp. 82–83"; (c) "pp. 21–22".

## Previous findings

- R01 — repaired: the `StarkSystems` block and its docstring paragraph are gone from `Suggested.lean`. README line 1694 keeps `exteriorBidual`, `toExteriorBidual`, `toExteriorBidual_ιMulti` and `toExteriorBidual_natural` as targets.
- R02 — repaired: line 1694 now reads "This roadmap owns these as targets, in the namespace `TauCeti.StarkSystems`", and line 1703 says the same for `TauCeti.RubinStark`. No Lean name conflicts with these, and EulerSystemsAndKolyvaginSystems (lines 77, 3958–3959, 4075) uses the same names.
- R03 — repaired: lines 301, 332, 334, 347, 414, 464, 470, 472 and 523 cite 3.2.13–3.2.21 with the source's numbering, and line 312 has "Definition 3.3.5, p. 86". The p. 83 page of Corollary 3.2.16 at line 347 is R03(b) here.
- R04 — repaired: lines 483 ("p. 11 … pp. 12–13"), 814 ("pp. 21–22"), 951 ("pp. 21–23"), 1096, 1098, 1110, 1118, 1130, 1138 and 1147 all match sharifi-aws running heads. Line 782, not in R04's list, is R03(c) here.
- R05 — repaired: References line 1757 now has the Katz entry (LNM 350, 69–190, Corollary 4.4.2, p. 152).
- R06 — repaired as requested: line 153 has "Lemma 12.18, p. 185", line 172 "pp. 185–186" and line 312 "p. 86". But the Washington item of R06 was mistaken (R02 here), and line 174 now stops a page short (R03(a) here).
- R07 — repaired: `Suggested.lean` line 95 has no `hp`. The docstring now covers every prime-power conductor, and README line 191 reads "For every prime p and `a≥1`".

## Verified sound

**Gate, elaboration, dependency check.**
- I re-ran the gate command from the brief at 78ec69e. Every check is 0 and it ends with `OK`, exit 0, matching the worker's gate.md.
- Dependency check: `depcheck: 240 roadmaps, 2436 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/IntegralIwasawaTheory'` is empty. The folder holds README.md, Suggested.lean and metadata.toml. The long list of outside files in the change summary is the merge of main between the two heads, not a change of this pull request.
- `lake env lean TauCetiRoadmap/IntegralIwasawaTheory/Suggested.lean` gives five `declaration uses sorry` warnings (lines 83, 95, 114, 123, 136) and nothing else, exit 0.
- I put `#check @name` for all 11 declarations in one scratch copy and elaborated it once. The types match the worker's signatures.md, and none lost a binder. Each matches its README statement:
  - §1.5: every prime, `0<a`;
  - §3.3: an arbitrary number-field `ℤ_p`-extension;
  - §5.6: every abelian E and every p;
  - §7.4: odd p, through `VandiverCondition`.

**The `module` header (78ec69e).** The header, together with a plain `import Mathlib` and no `public section`, makes every declaration module-private: `#print` shows `private def …HasIwasawaGrowth`. Four `Suggested.lean` files on main use the same form (CFSGBasicProperties, FiniteGroupExtensionSplitting, HeegaardFloer, PositiveScalarCurvature), the gate accepts it, and no rule requires exported names. Not a finding.

**One-tactic probe on the changed statements.** In a scratch copy, `simp [indexRealUnits]` on `primePowerHasseUnitIndex_one` leaves `realUnits K ⊔ torsion K = ⊤`, and `exact?` fails. `simp_all [VandiverCondition]` fails on `vandiver_propagation`, and `simp [cyclotomicUnits, realCyclotomicUnits]` leaves both index equations open. None of these is padding. The four padding declarations from the earlier review are deleted.

**Headline theorems.** The list is unchanged from the previous review:
- §11.7 integral determinant main conjecture;
- §3.3 growth;
- §5.6 Ferrero–Washington;
- §§1.5–1.6 Hasse and circular-unit indices;
- §4.4 abelian Leopoldt;
- §2.6 weak Leopoldt;
- §1.8 Sinnott;
- §9.2 Mazur–Wiles;
- §9.7 finite CM Fitting;
- §7.4 Vandiver;
- §12.5 Brumer–Stark.

Five are stated on native carriers. The docstring names the rest as not statable, each with its missing carrier, and nothing is forced through a stand-in. `bakerBrumer_algebraicNumbers` is a supporting target, not a headline, and it needs Iwasawa's logarithm on `ℂ_p^×`, which is not at the pins.

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4, both matching lake-manifest.json):
- `TauCeti/Algebra/MonoidAlgebra/CharGroupRing.lean`: `Set.jointEval` (l. 134), `Set.charGroupRing` (148), `Set.charGroupRing.proj` (172), `Set.jointEval_injective` (260) and `Set.charGroupRing.proj_univ_bijective` (267). The hypotheses are a `CommRing` domain O, a finite commutative G and `HasEnoughRootsOfUnity O (Monoid.exponent G)` (l. 212, 238), which is what README lines 37 and 43 say.
- `TauCeti/Algebra/Module/Presentation/Quadratic.lean`:
  - `QuadraticPresentation` (l. 87): size ≥ 1, `range rel = ker gen`, no injectivity field, so "Neither file asserts injectivity" is correct;
  - `IsQuadraticallyPresented` (100);
  - `fittingIdeal_eq` (133, needs `Module.Finite`);
  - `baseChange` (249) and `baseChange_rel` (264);
  - `isQuadraticallyPresented_of_finite_maximalSpectrum` (358): finite flat `P₀`, `P₁` with the same `rankAtStalk` r at every maximal ideal.
- `TauCeti/NumberTheory/LocalField/Logarithm.lean`: `valuation_log` (264) and `exists_mem_maximalIdeal_pow_eq_log` (270). `ExpLog.lean`: `log_exp_of_mem_maximalIdeal_pow` (312) and `exp_log_of_mem_unitFiltration` (355). All take `absoluteRamificationIndex K p < (p - 1) * i` with `[FinitePadicExtension K p]`, as README lines 37 and 558 say.
- Mathlib `NumberField.IsCMField.realUnits` (CMField.lean:269) and `indexRealUnits` (358). The abbrev needs only `[Field K]`, so README line 197 ("defined for every number field") is right.

**Cross-roadmap citations resolved.**
- LinearFormsInLogarithms is an open pull request by another author that adds a new roadmap folder (head 4ff34d9). Its §8.10 and `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` (its Suggested.lean l. 658) match the new contract at README line 51 word for word: the `‖ℓ_i‖<p^{−1/(p−1)}` disc, algebraic `exp`, ℚ-independence, algebraic `β₀,β_i`, and the `exp(1)=0` warning (its §8.10). §§8.1–8.9 are the exponential and proof steps, as line 9 says.
- EulerSystemsCyclotomicMainConjecture (README line 225 at its head) consumes §4.2 exactly as now written: `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers`, at every prime, with the disc form taken from §4.2's supplier. That keeps a single owner for each object.
- EulerSystemsAndKolyvaginSystems: see R02 above.
- PadicMeasuresIwasawaAlgebras §6.1 (main) is still cited only for the lattice comparison.
- Overlaps: none. No other open pull request changes this roadmap.

**Seeded sample, where it falls in the changed passages.**
- 1.2: RJW Definition 11.6 is on p. 176 (rjw line 3272, running head 176 at line 3263). Lemma 12.18 is on p. 185 (line 3659) and states `D⁺=⟨−1,γ_{n,a}⟩` and `D=⟨ζ⟩D⁺` for odd p, as the README does.
- 3.2: Sharifi (3.2.1) and Remark 3.2.12 are on pp. 80–81 (lines 2414, 2425). Lemma 3.2.13 is on p. 81 (line 2430) and gives `ω_{n,m}Y_m=Y_n` once every ramified prime is totally ramified in `F_∞/F_m`, which is the README's choice of m. The proof of Theorem 3.2.14 on p. 82 (line 2466) gives `|A_n|=|X/Y_m|·|Y_m/ω_{n,m}Y_m|`, the README's cardinality formula. The generators `σ_vτ^{−1}` and `ω_mX_∞` (line 2449) match "pairwise differences … and `ω_mX_∞`".
- 8.4: DK (P1)–(P4) are on pp. 39–40 (dk lines 1442–1466). DKSW Theorem 2.2 and equation (7) are on pp. 7–8 (lines 251–262). DKSW §4.5 begins on p. 40 (line 1425), and Proposition 4.13 is on p. 42 (line 1494). The missing hypothesis is R01.
- 0.5, 5.4, 6.1, 7.1, 8.6, 9.4–9.6, 10.5, 11.5, 11.7 and 12.3 are untouched by the diff. The previous review's verification of them stands.

**Other locators in changed lines, checked:**
- sharifi Definitions 3.2.18–3.2.19 and Propositions 3.2.20–3.2.21 are all on p. 83 (lines 2490–2503). Proposition 3.3.9 is on pp. 87–88 (line 2606; p. 87 begins at line 2603).
- Sharifi Lemmas 4.2.17 and 4.2.19 are on pp. 106–107 (lines 3293, 3307). Lemma 4.2.17 covers 2-power conductors (m ≥ 3, m ≢ 2 mod 4), and its proof is exactly the README's `F(12)` mechanism.
- DKSW: §3.1 and Lemma 3.1 are on p. 22 (lines 742, 776); §3.2 and Theorems 3.2–3.3 are on p. 24 (lines 817, 827, 836).
- AWS: §2.5 notation (`E_n`, `U_n`) is on p. 22 (lines 711–716), supporting line 312. §4.3 ends on p. 49 (line 1725), and Lemma 4.3.4's proof runs to p. 49.

**Adversarial pass.** The rows for the changed statements below were computed for this review. The last rows carry forward, from the previous review's table (at 5d2ed25), the statements this diff leaves untouched.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `primePowerHasseUnitIndex_one`, `hp` dropped | p=2, a=1 (K=ℚ); p=2, a=2 (ℚ(i)); p=3, a=1; p=2, a=3 | ℚ: `maximalRealSubfield=⊤`, realUnits = {±1} = all units, index 1. ℚ(i): units {±1,±i} = torsion, index 1. ℚ(ζ₃): units μ₆ = torsion, index 1. ℚ(ζ₈): Q=1 by Sharifi Lemma 4.2.17 (m=8 ≢ 2 mod 4) | holds for every prime as stated. `ha` is unused (a=0 forces K≅ℚ, index 1) but matches the README's a≥1; not raised |
| §1.5 non-prime-power Check, `F(12)` | ζ=ζ₁₂ | `(1−ζ)/(1−ζ⁻¹)=−ζ=ζ₁₂⁷`; gcd(7,12)=1, so it generates μ₁₂=μ(F(12)); 7 is odd, so it is not in μ², and u∉μE⁺; Q=2 | Check correct; agrees with the source proof |
| §4.2 power decomposition | general K=ℚ_p(α) | `v_K(α^e)=e·v_K(α)=v_K(p^{v_K(α)})`, so `α^e=p^t w`; `w^{q−1}∈U¹`; `(1+x)^p−1` has valuation ≥ min(j+e, pj) → ∞, so `α^N=p^k u` with `u∈U(K,i)` and `k=t(q−1)p^m` | correct |
| §4.2 disc bound | ℓ∈𝓂_K^i | `‖ℓ‖=p^{−v_K(ℓ)/e}≤p^{−i/e}`; `p^{−i/e}<p^{−1/(p−1)}` ⇔ `(p−1)i>e` | correct, with exactly the Tau Ceti depth hypothesis |
| §4.2 Check, p=2, α=−1 | i=2 and i=1 | e=1, q=2, so i≥2; m=1: N=2, α²=1, u=1, ℓ=0. i=1: `v₂(−1−1)=1`, so −1∈U(ℚ₂,1); 2·log(−1)=log 1=0 gives log(−1)=0, but exp(0)=1≠−1 | Check correct; depth condition necessary |
| §4.2 kernel test terms | α=3 in ℚ₃; α=ζ_p; α=6 in ℚ₅ | α=3: e=1, q=3, `α^N=3^N`, u=1, log=0. ζ_p: e=p−1, i≥2, N=(p−1)²p^m, so ζ^N=1. 6⁴=1296=1+5·259, v₅=1, so u∈U(ℚ₅,1) at N=4 and ‖ℓ‖=5⁻¹<5^{−1/4} | p-power, torsion and generic terms behave as stated |
| `bakerBrumer_algebraicNumbers` via §8.10 with β₀=0 | `ℓ_j=N_j log_p α_j` | `Σβ_j log_p α_j=0` ⇒ `Σ(β_j/N_j)ℓ_j=0`; the ℓ_j are ℚ-independent (`LinearIndependent.units_smul_iff`); §8.10 gives `β_j/N_j=0` | correct |
| LinearFormsInLogarithms contract, disc warning | ℓ=1 in `ℂ_p` | `|1/n!|_p→∞`, the series diverges, `NormedSpace.exp 1=0` (algebraic); β₀=−1, β₁=1: −1+1·1=0 with β₀≠0 | warning correct |
| Tau Ceti character-ring contract (line 43) | G=C₂: O=ℤ₂ and O=ℤ₃ | ℤ₂: `a+bσ↦(a+b,a−b)` is injective with cokernel ℤ/2, not an isomorphism (2∣#G). ℤ₃: inverse `(x,y)↦(x+y)/2+((x−y)/2)σ` | matches `Set.jointEval_injective` and the `p∤#Δ` criterion |
| §8.4 Q-padding | V, B of ranks `a_𝔪, b_𝔪`; Q of rank `n−a_𝔪` | `rank(B⊕Q)_𝔪=b_𝔪+n−a_𝔪`, which equals n iff `a_𝔪=b_𝔪`; `coker(f⊕id)=coker f=∇`; exact and surjective | correct only when the ranks agree, i.e. under (A): R01 |
| §8.4 without (A) | ramified w∉S∪T | dksw Lemma 4.5: `X=ker(∏_{S_H}ℤ×∏W*_w→ℤ)≠X_{S,H}`; §2.2 (dksw line 300) needs `Fitt^s`, s=#{ramified v∤2 outside Σ∪T} | ranks differ, so the statement as written overclaims: R01 |
| §3.2 transition, n=m | ν_{m,m}=1 | `#A_m=#A_m·#(H_m/H_m)=#A_m` | Check correct |
| `primePowerCircularUnitIndex`, `zpExtensionLayer`, `HasIwasawaGrowth` shift, `classNumberGrowth`, `ferreroWashington`, `VandiverCondition`/`vandiver_propagation`, §§0–12 Checks | unchanged | values as in the previous review's table: p=2, a=1,2 and p=3 indices 1=h(ℚ); n=0 layer = K; shift (p^rμ, λ, ν+rλ); E=ℚ, p=2 gives (λ,ν)=(0,0); 37 ∣ 7709321041217; §8.2 numbers mod 37; §12.6 sign module 2ab(1−c); and the rest | carried forward; these statements are untouched by the diff |

## Not verifiable

- Katz, *p-adic properties of modular schemes and modular forms*, Corollary 4.4.2, p. 152 (the new References entry): the sources service resolves DOI 10.1007/978-3-540-37802-0_3 only to a paywalled Springer page. It is recorded as uncertified and cited by its locator.
- Everything outside the changed passages (NSW, Burns–Kurihara–Sano, Kolster 1989, Greenberg, Yamashita, Ribes–Zalesskii, Sinnott 1980, Taylor, Wiles, Washington 1978) is as recorded in the previous review. This incremental review did not re-read those texts.

## Source issues

- none
