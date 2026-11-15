<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13788#issuecomment-6902140867 -->
Review (claude) of 56db9be

Verdict: accepted
Conditional on the announced gaps: `smooth-hkr-antisymmetrisation`

No finding: nothing in the design needs a repair. The acceptance is conditional on the declared gap `smooth-hkr-antisymmetrisation` (supplier
RefinedTraceMethods §1.9), which only §6.4(d) and §7.6 use.

Files reviewed: `packages/HochschildHomologyAndHKR/design/README.md` (2276 lines, 8 layers, read in
full this round), `packages/HochschildHomologyAndHKR/design/plan.json` (8 layers, 37 targets, 1 gap)
and `packages/HochschildHomologyAndHKR/sources.toml` (9 entries). Pins from the roadmap
repository's `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. No maintainer notes were
supplied. This is a design: there is no `Suggested.lean`, and elaboration is not available (this
lane does not elaborate).

## Verification of the previous repair

| Round-14 finding | Repaired passage | Assessment |
| --- | --- | --- |
| F01 of round 14, priority P3: §1.4 used the flatness and projectivity of `A^{⊗n}`, stated only in §4.2 | §1.4, first bullet: "For every `n`, `A^{⊗n}` is a flat `k`-module when `A` is flat, and a projective `k`-module when `A` is projective. By induction on `n`: `A^{⊗0} ≅ k` (`TensorPower.algebraMap₀`) is free over itself"; second bullet: "Exactness in each degree `n`"; §4.2: "`A^{⊗n}` is `k`-projective (§1.4, first bullet)"; §4.2 *Needs:* "§§1.4, 4.1" | **Repaired.** The pattern was also repointed in §4.5 ("(§1.4)", *Needs:* "§§1.1, 1.4, 4.1–4.2"), §7.2 ("by §1.4 and `Module.Projective.tensorProduct`"), §7.6 and the Mathlib contract; plan targets 1.4, 4.2, 4.5, 7.2, 7.6 carry `target:1.4`. |

Every passage the repair changed was put through the adversarial pass (rows marked "new"). The
repaired pattern (a route input stated later than its use, or stated nowhere) was looked for by
reading every *Needs:* line against its statement and route, and mechanically in the plan: no
target has a prerequisite `target:` at or after itself (0 backward edges over 37 targets). No
further instance.

## Verified sound

### Principles and shape

- **General library.** `k` is an arbitrary commutative ring in every target; flatness,
  `k`-projectivity and smoothness are per-target hypotheses with negative controls (`ℤ[x]/(px)` in
  §4.5, `ℤ[1/2]` and the inseparable extension in §7.6, `ℚ[x]/(x²)` in §7.2).
- **No re-planning; one direction of supply.** DGAInfinity (Layers 0, 1, 8 at its README lines 263,
  293, 520), DerivedModuleAlgebra (§0.K.1 line 649, §0.5 line 1339), NoncommutativeGeometry (N1
  line 479, N1.Cyclic line 582), BanachAlgebras (Layer 6, line 1379) and ZigzagPreprojective (Layer
  7, line 1047) are on main; DerivedDeRhamCohomology, IntegralIwasawaTheory,
  LanglandsParameterStacks, KTheoryFiniteLocalFields, EulerSystemsAndKolyvaginSystems and
  RefinedTraceMethods are earlier in the merge order (lines 23, 29, 80, 90, 104, 331 of the order
  file). None is on the never-cite list.
- **Hygiene.** One scan of the README for LaTeX delimiters, `set_option`, pull-request numbers,
  round labels, machine paths, HTML anchors, "so far", "checkpoint", "handoff", "optional",
  "deferred", "for later", "to be checked", "currently": no match. No algorithm, no sorry'd data.
  No locator is flagged unverified by the author.
- **Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (with the gaps
  list), How to read the build, eight layers each ending with Examples and Dependencies, Downstream
  consumers, Worked examples, References. Every numbered subsection has a *Needs:* line; every
  definition (§§1.1, 1.2, 2.1, 2.2, 3.3, 3.5, 4.1, 4.2, 4.5, 5.1, 6.1, 7.1, 7.3, 7.4, 7.5, 8.2, 8.3)
  has at least three Checks (30 Checks blocks in all). No backticked name is presented as this
  roadmap's own.
- **Plan-internal names (remark, no change needed).** In `design/plan.json`, target 1.4 is named
  `HochschildHKR.cohomology_exact` although its statement gives the long exact sequence for `HH_n`
  as well as `HH^n`, and its API entry `HochschildHKR.tensorPower_projective` states flatness as
  well as projectivity (for `k = ℤ`, `A = ℚ`, `A^{⊗2} = ℚ` is flat and not projective: the flat
  clause is the one that applies). Both statements are correct as written and the README presents
  neither name, so nothing a reader or a consumer sees is affected; the names are labels only.
- **Organisation.** Layers are named by their mathematics and ordered by their *Needs:* lines (§2.1
  needs §1.1; §3.5 needs §2.2; §4.2 needs §1.4; §5.4 needs §4.4; §6.1 needs §5.1; §7.5 needs §§6.2
  and 6.4(a); §8.4 needs §§7.1, 7.4, 7.5). The README nowhere says it follows a source.

### Adversarial table

`E_ij` are matrix units. All values computed this round.

| Statement | Instances tried and values computed | Result |
| --- | --- | --- |
| 1.4 tensor powers flat or projective (new) | `n = 0`: `A^{⊗0} ≅ k`, free, for `A = 𝔽_p` over `ℤ` too. `n = 1`: `subsingletonEquiv` on `Fin 1`. `ℤ[x]`: `A^{⊗2} = ℤ[x,y]`, basis `xⁱyʲ`. `ℚ` over `ℤ`: `ℚ ⊗ ℚ = ℚ`, flat, `Hom_ℤ(ℚ,ℤ) = 0`, not projective. Pinned instance (`Flat/Basic.lean:234`) needs `Flat S M`, `Flat R N`; here `S = R = k`. | holds |
| 1.4 degreewise exactness (new) | `k = ℤ`, `A = ℤ[x]/(px)`, `ℤ --p--> ℤ → ℤ/p` with `x ↦ 0`: degree 1 is `p` on `A = ℤ ⊕ x𝔽_p[x]`, kills `1 ⊗ x ≠ 0`; so flatness or a splitting is needed. `ℚ` over `ℤ`, cochains: `Hom(ℚ,ℤ) = 0 → Hom(ℚ,ℤ/p) = 0`, no contradiction, hypotheses stated separately. Split case: split after any additive functor. | holds |
| 4.2 `B_n(A)` projective over `Aᵉ` (new) | `A = k`: `B_n = k`, `b′_n = Σ_{i=0}^n (−1)^i = 1, 0, 1, 0`; augmented complex: `ker b′₁ = k = im b′₂`, `ker b′₂ = 0 = im b′₃`. `Mat₂(k)`: `B_n ≅ (Aᵉ)^{4ⁿ}`. Pinned `Module.Projective.tensorProduct` (`Projective.lean:240`, `R` a semiring, line 214) allows `R = Aᵉ`. `B₁`: `b′h + hb′` of `a₀⊗a₁⊗a₂` is `a₀⊗a₁⊗a₂ − 1⊗a₀a₁⊗a₂ + 1⊗a₀⊗a₁a₂ + 1⊗a₀a₁⊗a₂ − 1⊗a₀⊗a₁a₂`. | holds |
| 4.5 through §1.4 (new citation) | `A = ℤ[x]/(px)`: `ann(x−y) = pℤ` in `Aᵉ = ℤ ⊕ (x,y)𝔽_p[x,y]` (from `(x−y)(n+f) = (x−y)(n̄+f)` in `𝔽_p[x,y]`), `ann(p) = (x,y)`; after `𝔽_p ⊗ −` the differentials `x−y, p, (x,y)` are `0`: `Tor₂ = 𝔽_p`; normalised chains `V^{⊗n}`, `V = x𝔽_p[x]`: `HH₂ = HH₂(𝔽_p[x],𝔽_p) = 0`. Right action: `(m·(a⊗op b))·(a′⊗op b′) = b′b m aa′ = m·(aa′ ⊗ op(b′b))`. Induction: `n = 1` kernel of `H₀(L⊗−) → H₀(Q⊗−)`; `n ≥ 2` `H_n(M⊗−) ≅ H_{n−1}(L⊗−)`. | holds |
| 7.2 parenthetical (new citation) | `R ⊗_k R^{⊗j}`: `M = R` over `R`, `N = R^{⊗j}` over `k`. `ℚ[x]/(x²)`: differentials `0, 2x`: `HH₁ = R/(x)`, `HH₂ = xR`, `HH²(R,ℚ) = ℚ`, `Hom_R(xR,ℚ) = ℚ`, `h₂(f)(x e₂) = x f(e₂) = 0`. `𝔽_p` over `ℤ`: `δ^i = 0, 1, 0, 1`. Pinned theorem (`UniversalCoefficient/Basic.lean:212`): `∀ j < n` projective ⇒ bijective in degree `n`; `j < i ≤ n ⇒ j < n`. | holds |
| 1.1, 1.2 | `A = M = k`: `b_n = 0, 1, 0, 1` for `n = 1..4`; `δ^n = Σ_{i=0}^{n+1}(−1)^i = 0, 1, 0`; `HH₀ = HH⁰ = k`, others `0`. `b(E₁₂ ⊗ E₂₁) = E₁₁ − E₂₂`. Variant sign: `2(mab − amb)`, `mab = E₁₂`, `amb = 0` at `m = E₁₁, a = E₁₂, b = E₂₂`. | holds |
| 1.5 (sampled) | `b(1⊗x⊗1) = x⊗1 − 1⊗x + 1⊗x = x⊗1`; `b(1⊗1⊗1) = 1⊗1`, wrong action gives `1⊗x`. `E₁₁·b(E₁₂⊗E₂₁) = E₁₁ ≠ E₁₁ − E₂₂`. | holds |
| 2.1 (sampled) | `b(m⊗1⊗1) = m⊗1`. `b(1⊗x⊗x) = 2x⊗x − 1⊗x²`. `A = k`: `Ā = 0`. Pinned lemma (`DoldKan/Degeneracies.lean:180`): `f` kills degeneracies ⇔ `f ∘ Q∞ = 0`, so `im Q∞ = D_n` (take cokernels). Slot swap: `x⊗1 ↦ 1⊗x ≠ 0` in `A ⊗ Ā`. | holds |
| 2.2 (sampled) | `δg(1,1) = g(1) − g(1) + g(1) = 1`. `bφ = (a₀a₁∂a₂ − a₀∂(a₁a₂) + a₂a₀∂a₁)(0) = 0`. `ψ(ab)(y) = (ya∂b + yb∂a)(0) = (a·ψ(b))(y) + (ψ(a)·b)(y)`. `ψ′(1)(x) = φ(1,x) = 1`. `HH⁰(k[x],k) = k` against `Hom_k(k[x],k) ↠ k²`. | holds |
| 3.1, 3.2 (sampled) | `E₁₂ = [E₁₂,E₂₂]`, `E₁₁ − E₂₂ = [E₁₂,E₂₁]`; `Mat₀ = 0`. `E₁₁E₁₂ − E₁₂E₁₁ = E₁₂`. | holds |
| 3.3 (sampled) | `(a,Da)(b,Db) = (ab, aDb + Da·b)`; `D(1) = 2D(1)`. `δE₁₁(E₁₂) = −E₁₂`, `innerDerivation E₁₁ (E₁₂) = E₁₂`. | holds |
| 3.4 (sampled) | `b(1⊗a⊗c) = a⊗c − 1⊗ac + c⊗a`. `k[x]/(x²)`: `Ω¹ = R/(2x)`: dimension `2` over `𝔽₂`, `1` over `ℚ`. `𝔽_p` over `ℤ`: `b₂ = 1`, `HH₁ = 0`. | holds |
| 3.5, 3.6 | Unit: `(1,u)(a,m) = (a, m + ua + f(1,1)a)`, `u = −f(1,1)`. `t² = (0,1)`, `t³ = (0,1)(x,0) = 0`. `δf(x,x,x) = 0 − 0 + 1 − 0`. `f(1,x) = g(x) − g(x) + g(1)x = x`. Iso: `f′ = f + g(aa′) − a g(a′) − g(a)a′`. `𝔽₂` over `ℤ`: `δ¹ = 1`, `δ² = 0`, `HH² = 0`, `ℤ/4` not `ℤ`-split. | holds |
| 4.1 | `m⊗x = mx⊗1 = xm⊗1`. `(E₁₂ ⊗ op E₂₁)·E₂₂ = E₁₁`; reversed `0`. | holds |
| 4.3, 4.4 (sampled) | `(φ∘b′)(1⊗a₁⊗⋯⊗a_{n+1}⊗1) = a₁f(a₂,…) + Σ(−1)^i f(…a_ia_{i+1}…) + (−1)^{n+1} f(a₁,…,a_n)a_{n+1}`, no sign. Pinned `extMk_eq_zero_iff` (`Projective/Ext.lean:209`): zero ⇔ `f = d ≫ g`, needs `p + 1 = n`; degree `0` through `extLinearEquivCohomologyClass` (`:286`). `ℤ`: `δ¹ = id`, `HH¹ = 0`. | holds |
| 5.1, 5.2 (sampled) | `(∂_x∪∂_y)(x,y) = 1`, `(∂_y∪∂_x)(x,y) = 0`. Reversed product defect at `(E₂₁,E₁₂)`: `E₁₁ − E₂₂`. Leibniz at `(1,1)`: `af(b)g(c) − f(ab)g(c) + f(a)g(bc) − f(a)g(b)c` on both sides. | holds |
| 5.4 (sampled) | `p = 1`: `b′f̃₁ = −(a₀f(a₁)a₂⊗a₃ − a₀f(a₁)⊗a₂a₃)`; `f̃₀b′ = a₀a₁f(a₂)⊗a₃ − a₀f(a₁a₂)⊗a₃ + a₀f(a₁)⊗a₂a₃`, equal by the Leibniz rule. `f̃_q ≫ g = (−1)^{pq} f∪g`. | holds |
| 6.2 (headline) | `(1,1)`: twelve terms leave `g(a)f(b) + f(a)g(b)`. `(0,1)`: `g(a)x − xg(a)`; `Mat₂(ℤ)`: `−E₁₂`. `(1,0)`: ten terms leave `yf(a) − f(a)y`. Antisymmetrised at `(1,1)`: `f∘δg + δf∘g − g∘δf − δg∘f = δ(f∘g − g∘f)`. `k[x]`: `−δ(∂^{[2]})(x,x) = 1`. | holds |
| 6.3 (sampled) | Koszul signs of a cyclic-bar differential on `a₀⊗sa₁⊗⋯⊗sa_n` are `(−1)^{i−1}` on inner faces and `(−1)^{n−1}` on the last: one sign per degree away from `(−1)^i`, `(−1)^n`. `𝔽_p` over `ℤ`: classical `HH₂ = 0`, derived `𝔽_p` (supplier §1.10). | holds, convention is the supplier's |
| 6.4 | Cycle: last term of `σ∘(cycle)` has sign `(−1)^n(−1)^{n−1} sgn σ = −sgn σ`. Derivation modulo boundaries: `1⊗ab − a⊗b − b⊗a = −b(1⊗a⊗b)`. `π∘ε = 2 dx∧dy` at `n = 2`. | holds |
| 7.1, 7.3 | `F∘b = r₀·δf` needs `r_{n+1}r₀f = r₀f·r_{n+1}`. Pinned `pairingDual_ιMulti_ιMulti`: `det(f_j(v_i))`; `e₂*∧e₁*`: `−1`. | holds |
| 7.4 (sampled) | `τ₂(∂_x∧∂_y)(dx∧dy) = det I₂ = 1`. Inseparable `R`: `D(a²−u) = 2aD(a) = 0`, `Der = R∂`, `T² = 0`. `Ω¹` on `d` generators: `⋀^n = 0`, `n > d`. | holds |
| 7.5 | `Σ_σ sgn σ Π_i D_{σ(i)}(r_i) = det(D_j(r_i))`. `δ(D₁D₂)(a,b) = −(D₁aD₂b + D₂aD₁b)`. Pairings with `1⊗x⊗y − 1⊗y⊗x`: `2` and `1`. `n = 2`: `δf = af(b,c) − af(b,c) − bf(a,c) + bf(a,c) + cf(a,b) − f(a,b)c = 0`. | holds |
| 7.6 (headline) | `ℤ[1/2]`: `C^n = ℤ[1/2]`, `HH^n = 0 = T^n`, `n ≥ 1`. Inseparable: `t² = 0`, `HH² = R`, `T² = 0`. `𝔽₂[x,y]`: `[⟨∂_x,∂_y⟩] = 2Ψ₂ = 0`, `Ψ₂` pairs to `1`. Well-definedness: `h_n[D₁∪⋯∪D_n](ε(r₀dr_I)) = r₀det`, alternating. | holds under smooth, `k`-projective and the gap |
| 8.1 (sampled) | `Y_i = −t_i`: same ideals, same kernels. `m = 0`: `Rᵉ = k`. `k[x]/(x²)`: `t(x⊗1 + 1⊗x) = 0`. | holds |
| 8.2, 8.3 | `b′ι(e₁∧e₂) = X₁⊗X₂⊗1 + 1⊗X₁⊗X₂ − X₂⊗X₁⊗1 − 1⊗X₂⊗X₁ = t₁(1⊗X₂⊗1) − t₂(1⊗X₁⊗1)`. Unsigned: defect `2(X₂⊗X₁⊗1 + 1⊗X₂⊗X₁ − 1⊗X₁X₂⊗1)`. Pinned `rank_subsingleton` (`Dimension/Basic.lean:168`): rank `1` over the zero ring. | holds |
| 8.4, 8.5 (headlines) | `(∂_I∪)(ι(e_J)) = δ_{IJ}`. `(X₁², X₂)`: `det = 2X₁`. `m = 0`, `g = 2`: `2`. §8.4 needs §6.4(a) only: no gap. | holds |

### Sources: the seeded sample

No locator is flagged unverified by the author. Read this round in the cached extractions:

| Target | Locator read | Outcome |
| --- | --- | --- |
| 1.5 | Ginz05 lines 2160–2166 | The centre acts on the coefficient factor; an `A`-module structure for commutative `A`. Supports. |
| 2.1 | Ginz05 lines 894–932 (§4.5) | Reduced bar complex, its terms and Corollary 4.5.2; the standing field of the source is said in the README. |
| 2.2 | Ginz05 lines 1120–1128 (§5.7) | Reduced cochains as `Hom_k(Ā^{⊗n}, M)`. Supports the definition; the homotopy equivalence over every `k` is the roadmap's own route. |
| 3.1 | Ginz05 lines 941–953 | Commutator quotient and `HH₀`. |
| 3.2 | Ginz05 lines 1066–1069 | Degree-zero cocycles are the central elements. |
| 3.3 | Ginz05 lines 398–411, 1075–1085 | Derivations, inner derivations, the four-term sequences (3.1.1) and (5.4.1). |
| 3.4 | Ginz05 lines 1914–1926 (§8.1) | Kähler differentials as the quotient by degree-two boundaries. |
| 4.2 | Ginz05 lines 747–783; HKR62 lines 433–447 | Bar complex, homotopy, its check on two factors; the resolution `Y` with right-linear homotopy, projective for `K`-projective `R`. |
| 4.4 | Ginz05 lines 984–988; HKR62 lines 337–351 | Cohomology defined as `Ext` over `Aᵉ`; derivations as `Ext¹`. |
| 5.1, 5.2, 5.4 | Ginz05 lines 1335–1350; HKR62 lines 479–495 | Cup product, Leibniz rule, agreement with the Yoneda product; the product on `Hom_S(Y,R)` and the product formula. |
| 6.3 | Ginz05 lines 958–976 | `M ⊗_{Aᵉ} A^{⊗n}` identified with `M ⊗ A^{⊗(n−2)}`; the boundary with last term `(−1)^n a_n m`. |
| 7.4 | Ginz05 lines 1130–1140; HKR62 line 548 | Polyvector fields; Theorem 5.2. Mat86 §25 not readable. |
| 8.1 | HKR62 lines 264–279; Ginz05 lines 2187–2197 | The regular sequence by citation and the Koszul computation; the unproved diagonal claim. As the README describes them. |

Also read for the headlines: Ginz05 lines 1351–1380, 2086–2090, 2140–2157; HKR62 lines 205–214,
520–550; AV20 lines 66–76, 235–244. All nine cited works have one manifest entry each, and each
`cited_for` list matches the sections where the README cites the work. `sources.toml` was not
changed by this review and no `needs-references.toml` was written.

### Pinned declarations

All 258 backticked dotted identifiers of the README were checked against the pinned sources by
script, and the leads it left by hand: every Mathlib and Tau Ceti name resolves.
Opened this round: `Mathlib/LinearAlgebra/TensorPower/Basic.lean:75`, `:201`;
`Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean:814`; `Mathlib/RingTheory/Flat/Basic.lean:121`,
`:166`, `:173`, `:182`, `:234` (anonymous instance; the name `Module.Flat.instTensorProduct` is the
one Mathlib's own docstring uses at `Mathlib/RingTheory/Flat/Stability.lean:88`);
`Mathlib/Algebra/Module/Projective.lean:91`, `:161`, `:188`, `:240`;
`Mathlib/LinearAlgebra/TensorProduct/RightExactness.lean:395`;
`Mathlib/CategoryTheory/Abelian/Projective/Ext.lean:139`, `:209`, `:224`, `:234`, `:255`, `:286`;
`Mathlib/Algebra/Homology/DerivedCategory/Ext/Linear.lean:88`;
`Mathlib/AlgebraicTopology/DoldKan/Degeneracies.lean:180`;
`Mathlib/RingTheory/Smooth/Basic.lean:71` (the field `projective_kaehlerDifferential`);
`Mathlib/RingTheory/Derivation/Basic.lean:278`; `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean:29`,
`:162`, `:182`; `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:418`;
`Mathlib/Algebra/Homology/Opposite.lean:428`; `Mathlib/Algebra/Homology/Embedding/Basic.lean:226`;
`Mathlib/Algebra/Azumaya/Defs.lean:39`; `Mathlib/RingTheory/MvPolynomial/Ideal.lean:63`;
`Mathlib/RingTheory/Regular/RegularSequence.lean:190`; `Mathlib/LinearAlgebra/Dimension/Basic.lean:168`;
`TauCeti/Algebra/Homology/UniversalCoefficient/Basic.lean:212`, `:234`;
`TauCeti/Algebra/Homology/Ext/ProjectiveResolution.lean:107`;
`TauCeti/LinearAlgebra/ExteriorPower/Basic.lean:145`;
`TauCeti/RingTheory/HochschildCohomology/Dual.lean:75`, `:84`. `TauCeti.StarkSystems.toExteriorBidual`
is at neither pin and the README does not say it is: it is IntegralIwasawaTheory §12.6's carrier,
cited under that roadmap's contract.

### Duplication, citations and overlaps

Resolved now, on main and at the open heads the roadmap tool serves:

| Citation | Where it resolves | Agreement |
| --- | --- | --- |
| RefinedTraceMethods §1.1 | "1.1 Cyclic objects and the cyclic bar", target "The cyclic enhancement of supplied derived Hochschild chains" | on ordinary flat `A` the underlying object is `(C_•(A/k), b)`; `k = ℤ`, `A = 𝔽_p` differs. |
| RefinedTraceMethods §1.9 | "1.9 Antisymmetrization and the smooth HKR comparison" | `ε_n` (sum over `σ⁻¹`, the same chain), `π_n`, `π_nε_n = n!`, `ε₁` inverse to `π₁`; the smooth statement only for `ℚ ⊆ k`. |
| RefinedTraceMethods §1.10 | "1.10 Derived HKR, circle tensors and a nonflat example" | `HH₂(𝔽_p/ℤ) = 𝔽_p`. |
| KTheoryFiniteLocalFields §4.0 | "4.0 Genuine equivariant and cyclic foundations", target "Cyclic homology foundations" | derived chains on DGAInfinity Layer 8; the smooth HKR comparison without a named map. |
| EulerSystemsAndKolyvaginSystems §6.1 | "6.1 Exterior biduals of Selmer modules" | "This map is an isomorphism for finite projective X". |
| IntegralIwasawaTheory §12.6 | "12.6 Rubin's lattice and the higher-rank consequence away from 2" | owns `exteriorBidual`, `toExteriorBidual` in `TauCeti.StarkSystems`, arguments `R, r, M`, by flipping `pairingDual`. |
| LanglandsParameterStacks §1.17; DerivedDeRhamCohomology Layer 2 | headings present | scope deferrals. |
| DGAInfinity Layers 0, 1, 8; DerivedModuleAlgebra §§0.K.1, 0.5; NoncommutativeGeometry N1, N1.Cyclic; BanachAlgebras Layer 6; ZigzagPreprojective Layer 7 | main | headings present. |

The citation resolver, run on the README at this head, lists no cross-roadmap citation and no Lean
name found nowhere.

Ownership by object, searched at main and at the open heads: "polyvector" has no match anywhere;
no other roadmap states the bar resolution of an algebra over its enveloping algebra, `HH^n ≅ Ext`,
or the cohomological HKR theorem (the "bar resolution" and "Kostant" matches are group bar
resolutions and unrelated Kostant theorems). `HH₁ ≅ Ω¹` appears in RefinedTraceMethods §1.9 and
KTheoryFiniteLocalFields §4.0 on derived chains; §3.4 here is the classical complex of every
commutative `R` and says so. CyclicHomologyLieHomologyAndQuasiFreeAlgebras §4.1 characterises
quasi-free algebras by `Ext²_{Aᵉ}(A,M) = 0` directly in Mathlib's `Ext`, leaves Hochschild chains
to KTheoryFiniteLocalFields and RefinedTraceMethods, and states no Hochschild cochain complex, bar
resolution or `HH²` classification.

`scratch/overlaps.md`: no other pull request changes this roadmap, no dropped id, no id only an
open revision defines, no closest roadmap by results. There is no `HochschildHomologyAndHKR` folder
on main, and the name is in neither the open-pull-request list nor the board-packages index: no
second copy.

Overlap check: read CyclicHomologyLieHomologyAndQuasiFreeAlgebras, SpectralSequencesAndConvergencePartII, RefinedTraceMethods, CohomologyOfGroups (open), DGAInfinity, NoncommutativeGeometry, DerivedModuleAlgebra (main); shared: antisymmetrisation and derived chains, owners RefinedTraceMethods §1.9 and KTheoryFiniteLocalFields §4.0, imported; braces, bracket and DG Hochschild cochains, owner DGAInfinity Layers 0 and 8, imported; Koszul complex and commutative square-zero extensions, owner DerivedModuleAlgebra §§0.K.1 and 0.5, imported or cited; the normalised quotient over `ℂ`, owner NoncommutativeGeometry N1, cited; quasi-free algebras and cyclic homology, owner CyclicHomologyLieHomologyAndQuasiFreeAlgebras, not stated here; the other two share only the name Hochschild–Serre. Nothing has two owners.

### Supplier order

```text
candidate: HochschildHomologyAndHKR is not in the merge order yet; checked as if placed after RefinedTraceMethods (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2259 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Inside the roadmap every edge runs forward (checked on the plan's 37
targets). §8.4 needs §6.4(a), not §6.4(d), §7.2 or §7.6: the polynomial case does not use the gap.

### Gap

`smooth-hkr-antisymmetrisation` (supplier RefinedTraceMethods, §1.9). Precise: one statement with
its hypotheses (every commutative `k`, every smooth commutative `A`, every `n`). Minimal:
RefinedTraceMethods §1.9 at its head has `π_nε_n = n!`, the degree-one case and the smooth statement
only for `ℚ ⊆ k`, which give nothing when `n! = 0` (`𝔽₂[x,y]`, `n = 2`); KTheoryFiniteLocalFields
§4.0 asserts an isomorphism without naming the map; §8.4 here covers polynomial algebras only.
Declared in both places with the same slug: the README's "Gaps the named suppliers must provide"
and the plan's `gaps` (`supplier` RefinedTraceMethods, `section` §1.9, `neededBy` 6.4 and 7.6); the
plan's targets 6.4 and 7.6, and no other, list `gap:smooth-hkr-antisymmetrisation`.

### Headline theorems and Lean

Headlines of the summary: normalisation over every `k` (2.1, 2.2); the low degrees and the `HH²`
classification (3.1–3.6); `HH^n ≅ Ext^n` for `k`-projective `A` and `HH_n ≅ Tor_n` for `k`-flat `A`
(4.4, 4.5); cup equals Yoneda up to sign (5.4); the homotopy formula and graded commutativity
(6.2); the cohomological HKR theorem with `[⟨D₁,…,D_n⟩] = n!·Ψ_n` (7.6); polynomial algebras (8.4,
8.5). There is no `Suggested.lean` at the design stage, so the padding probe, the binder audit and
the import check do not apply yet.

### Copyright and arrangement

- **Wording.** 22 passages set beside the sources at their locators: Ginz05 at lines 398–411,
  747–783, 894–932, 941–953, 958–976, 984–988, 1033–1069, 1075–1085, 1120–1128, 1130–1140,
  1335–1350, 1351–1380, 1914–1926, 2086–2090, 2140–2166, 2187–2197; HKR62 at lines 264–279,
  337–351, 410–447, 479–495, 522–550; AV20 at lines 66–76 and 235–244, against §§1.5, 2.1, 2.2,
  3.1–3.4, 4.2–4.4, 5.1, 5.2, 5.4, 6.1, 6.3, 6.4, 7.4–7.6, 8.1, 8.2. Nothing is shared beyond
  formulae and standard names.
- **Arrangement.** Ginz05 has the largest share (45 of 117 source mentions). Its sections run §3
  derivations, §4 bar complexes, §5 Hochschild theory defined as `Tor` and `Ext` with the low
  degrees, §6 Gerstenhaber structures, §8 Kähler differentials, §9 HKR. The roadmap builds the
  complexes from simplicial modules, normalises before the low degrees, and puts both before the
  bar resolution; Layers 2, 6 and 8 have no counterpart section. No one-to-one run.
- **Reuse.** No table, figure, exercise list or data set is taken from a source.

Source independence: 22 passages compared with 3 sources (Ginz05, HKR62, AV20), none shared; largest share Ginz05, 45 of 117 locators; contents compared with Ginz05: independent. Loday98, Weibel94, CE56, Ger63 and Mat86 could not be read (settled uncertified).

## Not verifiable

- Loday98, Ger63, Weibel94, CE56, Mat86: settled uncertified; their section and theorem numbers
  were not checked against the texts. In the sample this covers the Loday98 locators of 2.1, 2.2,
  3.1, 3.2, 3.4, 4.2, 5.1, 5.2 and 6.3, the Weibel94 locators of 3.3, 4.2 and 4.4, the CE56 locators
  of 3.3, 4.4 and 5.4, the Ger63 locator of 5.1 and 5.2, and the Mat86 locator of 7.4. The
  statements were recomputed instead.
- Lean elaboration and the one-tactic probe: no Lean file at this stage, and this lane does not
  elaborate.
- The closed form of `s(p,q)` (§5.3) for `p, q ≥ 1` and the signs `ν_n` (§6.3) for `n ≥ 1`: the
  design states their existence; they depend on Mathlib's shift conventions and on DGAInfinity
  Layer 8's chain differential.
- The declared gap is a contract on RefinedTraceMethods §1.9, not a statement that exists today.

## Source issues

- **Error** in Ginz05 at §6.6, identity (6.6.3), p. 29 (line 1368): the source says the graded commutator of cup products is `d(f∘g) − df∘g − (−1)^p f∘dg`; it should be, for the coboundary of line 1058, `g∪f − (−1)^{pq} f∪g = df∘g + (−1)^q(d(f∘g) − f∘dg)`; affects a stated result.
- **Misprint** in Ginz05 at §6.6, formula (6.6.2), p. 29 (line 1363): the source says the inner cochain takes the arguments `a_i,…,a_{i+q}`; it should be `a_i,…,a_{i+q−1}`, `q` arguments; affects nothing.
- **Misprint** in Ginz05 at §5.2, p. 22 (lines 1049–1053): the source recalls the chain boundary with the inner terms unsigned; it should carry `(−1)^j` on the `j`-th inner term, as at lines 973–976; affects nothing.
- **Misprint** in Ginz05 at §5.3, p. 22 (line 1068): the source says the set of `m` with `am = ma` is the centre of the module `A`; it should be the centre of the bimodule `M`; affects nothing.
- **Misprint** in Ginz05 at §3.1, p. 9 (line 404): the source says `ad m` is a map `M → M` giving a derivation of `M`, for `m ∈ m`; it should be a map `A → M`, a derivation from `A` to `M`, for `m ∈ M`; affects nothing.
- **Gap** in Ginz05 at §9.3, proof of Theorem 9.1.3, p. 46 (lines 2193–2196): the source says the diagonal ideal of `A ⊗ A` is generated by a regular sequence when `X` is smooth; it should be claimed only after localising at points of the diagonal; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "56db9bec8c6037f5b5536fd1ff097dbfd64e2211", "job": "REV-DESIGN-HochschildHomologyAndHKR~15", "model": "fable", "worker": "chris-x81"} -->
