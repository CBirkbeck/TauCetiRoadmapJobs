# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at 3533dfa)

**Verdict:** needs changes

Incremental re-review of the 74 lines changed since 3f9167c. All six findings of the previous review are repaired. One new blocking defect was introduced by the repair of the weighted fundamental lemma: the displayed identity of §4.3b copies the introductory statement of Chaudouard–Laumon II, which omits a centre-index factor that the body of that paper carries, and the new Sp₄ Check records the resulting wrong coefficient. One P3 locator note. The gate passes.

## R01 (P1) — The weighted fundamental lemma of §4.3b omits the factor `|Z_{M̂′}/Z_{M̂}|`

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1766`, §4.3b: “`J^G_{M′,M}(Y)=Σ_{s′∈sZ_{M̂}/Z_{Ĝ}}|Z_{Ĝ_{s′}}/Z_{Ĝ}|⁻¹S^{G_{s′}}_{M′}(Y)`”, and `:1776`, the Check: “the coefficient is `1/2` and the identity reads `J^G_{M′,G}(Y)=(1/2)S^{M′}_{M′}(Y)`”.

Claim: this is the identity Chaudouard–Laumon prove, and at `M=G=Sp₄`, `M′=SO₄` the coefficient is `1/2`.

Witness: the theorem actually proved is Théorème 19.1.1 (`cl-weighted-II`, published text lines 5169–5176, p. 1776), which says the map `J` is *stabilisante*. Définition 16.2.4 (line 3990) makes that `J(Ĝ)=J^E(Ĝ)`, and Définition 16.2.1 (lines 3972–3978, p. 1747) defines `J^E(Ĝ)=|Z_{M̂′}/Z_{M̂}|·Σ_{s′∈s_M Z_{M̂}/Z_Ĝ}|Z_{Ĝ_{s′}}/Z_Ĝ|⁻¹S(Ĝ_{s′})`, with `S` the recursion (13.2.1) of Proposition 13.2.4 (line 3742), the same recursion the README states. The `J^G_{M′,M}` of §19.1 (lines 5156–5168) is the one of the introduction. So the introduction's Théorème 1.4.1 (v1 line 148, published line 177) drops the factor `|Z_{M̂′}/Z_{M̂}|`, exactly as it drops the coset representative that the previous review found.

The roadmap's own instance refutes the stated form. For `G=M=Sp₄`, `M̂=SO₅`, `M̂′=SO₄`: `|Z_{M̂′}/Z_{M̂}|=|{±1}|/1=2`, so the body theorem gives coefficient `2·(1/2)=1`, i.e. `J^{Sp₄}_{SO₄,Sp₄}(Y)=S^{SO₄}_{SO₄}(Y)`, the ordinary Lie-algebra fundamental lemma with its usual coefficient 1. That is what §4.3 (Ngô) states on line 1732: `Δ_G O^κ(1_𝔤)=Δ_H SO(1_𝔥)`, no `1/2`. Arthur's coefficient `ι_{M′}(G,G′)=|Z(M̂′)^Γ/Z(M̂)^Γ|·|Z(Ĝ′)^Γ/Z(Ĝ)^Γ|⁻¹`, which Waldspurger's §4.3 equation (1) uses and §11.0a imports, equals `2·(1/2)=1` here as well. So the stated identity contradicts §4.3 at `M=G` and is off from the coefficients of §11.0a by `|Z_{M̂′}/Z_{M̂}|` whenever that index exceeds 1; §4.10b reduces the twisted weighted lemma to §4.3b, so the mismatch would break that reduction.

Repair: multiply the right side of the displayed identity by `|Z_{M̂′}/Z_{M̂}|` (finite because the connected centres agree), cite Définition 16.2.1 and Théorème 19.1.1 for the statement rather than the introduction alone, and recompute the Check: for `Sp₄/SO₄` the coefficient becomes `|Z(SO₄)/Z(SO₅)|·|Z(SO₄)/Z(SO₅)|⁻¹=2·(1/2)=1`, the identity reads `J^G_{M′,G}(Y)=S^{M′}_{M′}(Y)`, and the Check then also states agreement with §4.3 at `M=G` (the consistency Check that the last repair deleted). Keep the coset index `sZ_{M̂}/Z_{Ĝ}` and the note that indexing by `{1}` would request the undefined avatar. On the refuting instance the repaired coefficient is 1, which matches Ngô's theorem and Arthur's `ι`.

## R02 (P3) — One Chaudouard–Laumon I locator is off by a page

Location: `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md:1613`, §3.18a: “(Chaudouard–Laumon I, §§2.1, 3.2–3.4 and 4.1, pp. 5, 7–8 and 13)”.

Claim: §4.1 of the arXiv v1 text is on p. 13 and Propositions 3.2–3.4 are on pp. 7–8.

Witness: `cl-weighted-I` line 611 opens page 14 and §4.1 (“Notations”) begins at line 614 on that page; Propositions 3.2–3.4 are at lines 372–393, page 9.

Repair: write “§§2.1, 3.2–3.4 and 4.1, pp. 5, 7–9 and 14”. The other §3.18a locators (Definitions 6.1–6.3 and Proposition 6.4 p. 26, Theorem 6.9 pp. 28–29, §5.7 pp. 22–23, Theorem 11.1 pp. 57–58, §11.2 pp. 58–59, (11.6) pp. 60–61, (11.9) p. 65, Corollary 11.16 p. 70) were checked and are correct.

## Previous findings

- R01 — repaired: §11.0f now fixes `π` and `S ⊇` its finite ramification, chooses `χ` ramified at one `v∈S`, then quantifies over `σ∈T^S(m)` unramified at every place of `S`, as in `kim03` lines 211–212 and 561–579; the cancellation `σ=χ⁻¹` is a negative Check at line 4395.
- R02 — repaired: §11.0f now uses the Levi `(G_m×SL₂³)/μ₂` of the central-node parabolic of `Spin₈`, kernel `(−1,−I,−I,−I)`, rank 4, dimension 10, agreeing with `gelbart-shahidi01` lines 557–567 (p. 90) and `kim-shahidi02` lines 909–910 (p. 859); the `m=1` input is a separate Rankin–Selberg carrier.
- R03 — repaired: the index is now the coset `sZ_{M̂}/Z_{Ĝ}` with finite elliptic support, as in `cl-weighted-II` v1 lines 145–146; the Check added in this repair carries the separate coefficient defect R01 above.
- R04 — repaired: §3.18a now uses the Cartan lift, the `W`-cover, the cone `C_m`, Definition 6.3's lattice condition and the full Theorem 11.1 formula with its measures; the `SL_n` coordinate description is a stated specialization.
- R05 — repaired: the `SO₄` Check now uses two orthogonal two-dimensional constituents with determinant product 1, the dihedral control of order 10, and keeps the symplectic sum as the excluded case.
- R06 — repaired: no occurrence of “The API the” remains; all nine sentences are rewritten as prose with one subject and listed obligations.

## Verified sound

**Scope and mechanical checks.** The folder changed by 74 lines in `README.md` only (49 insertions, 25 deletions); `Suggested.lean` (44 lines, no declarations) and `metadata.toml` are unchanged, and no file outside the folder changed (`git diff --stat origin/main...HEAD` excluding the folder is empty; the worktree is clean at `3533dfa`). The gate was rerun on this head and reports every counter zero with `OK`, including `build=0`. `lake env lean` on `Suggested.lean` exited 0 with no output in 2.6 s; with no declarations there is nothing to probe for padding or lost binders, and no `TauCeti.*` module is imported. The dependency check with the supplied merge order, `--movable` and the main content checkout printed

```text
depcheck: 208 roadmaps, 1491 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The added lines contain no process words, LaTeX delimiters, pull-request numbers or machine paths.

**Sources read for the changed passages** (line numbers are those of the cache texts; printed pages are those of the cited version).

| Changed target | Text and locator checked | Result |
|---|---|---|
| 3.18a cover and Cartan lift | `cl-weighted-I` §2.1 lines 211–220 (p. 5: reductive `G`, `|W|` invertible); §3.4 lines 338–359 (p. 8: `Ã_M` as pairs `(a,t)` with `a(∞)=χ_M(t)`, `W^M`-cover in the proof of Prop. 3.1); Props. 3.2–3.4 lines 372–393 (p. 9) | Matches the README's `Ã_G`, étale `W`-cover and unique elliptic Levi lift. |
| 3.18a cones and `C_m` | §5.1–5.3 lines 789–859 (pp. 18–19: `a_P`, `X_*(P)`, `⁺a_P` by positivity on `Δ̂_P`); §5.4–5.5 lines 860–900 (pp. 19–20: degree via `λ(deg m_P)=deg(E_P×^P k_λ)`, `C_m=∩(−deg(m_P)−⁺a_P+a_T^P)`) | Matches the README's definitions word for word in content. |
| 3.18a stability, general position, main theorem | Defs. 6.1–6.3 lines 1147–1166 (p. 26); Prop. 6.4 line 1171; Theorem 6.9 lines 1253–1255 (pp. 28–29: semisimple `G`, DM, smooth, finite type, `f^ξ` proper); Weyl action line 1241 | Matches, including the `wξ` compatibility in the API list. |
| 3.18a `SL₂` adjacent reductions | §5.7 lines 995–1036 (pp. 22–23: `deg(m_B̄)−deg(m_B)=long(V/(V₁+V₂))(1,−1)`) | The README's interval `d₂<ξ₁<−d₁` of length `ℓ` follows; see the table below. |
| 3.18a point count | Theorem 11.1 lines 2620–2642 (pp. 57–58) with the hypotheses at 2587–2592; §11.2 lines 2646–2656; §11.5 (11.4)–(11.6) lines 2755–2774 (pp. 60–61); §11.11 lines 2969–2974 and (11.9) lines 3002–3005 (p. 65); Cor. 11.16 lines 3222–3227 (p. 70); choice-independence remark lines 2639–2642 | The displayed formula, the double-coset and rational-form sums, groupoid cardinality, torus volume with `Ker(H_M)`, quotient-measure weighted integral without a discriminant factor, and the cancellation of measure choices all agree. |
| 4.3b statement | `cl-weighted-II` v1 lines 119–152 (pp. 3–4) and published lines 155–183 (pp. 1650–1651); Def. 13.2.2–Prop. 13.2.4 lines 3723–3763 (pp. 1740–1741); Def. 16.2.1–16.2.4 lines 3972–3995 (p. 1747); §19.1 and Théorème 19.1.1 lines 5143–5176 (p. 1776) | Coset index and recursion agree; the factor `|Z_{M̂′}/Z_{M̂}|` is missing from the README and from the introduction's statement: R01. |
| 11.0f exterior square | `kim03` Theorem 2.1 lines 209–215 (p. 140: `T^S(m)` unramified at `S`); §3 lines 463–489 (p. 148: central character of `Σ`, `L(s,Σ,r₂)=L(s,σ,∧²⊗ω₂)`); Prop. 3.1 line 502 (p. 149); Props. 3.2–3.4 and the `χ_v^{24}` computation lines 552–595 (p. 150); Theorem 3.5 lines 599–600 (p. 151) | Quantifier order, the ramification requirement and the exponents `4,4,12,8` for `m=1,…,4` all agree. |
| 11.0f triple product | `gelbart-shahidi01` Theorem 4.1 lines 445–450 (p. 87), poles and `P_i` lines 460–470, `M=(SL₂³×GL₁)/(±I)`, `L(s,Π,r₂)=L(s,ω₀)` and Cor. 4.4 lines 554–572 (p. 90); `kim-shahidi02` case `D₄−2` lines 901–912 (p. 859) | Levi, kernel, second factor, “entire unless all three monomial” and the strips-away-from-poles clause agree. |
| 11.0h multiplicity | `arthur-tifr` Theorem 2 and the `m_ψ` paragraph lines 231–247 (p. 7: `m_ψ=2` iff type `D_n` and all constituent degrees even) | The repaired `SO₄` Check and the `3+1` control agree. |

**Adversarial calculations.** Rows for statements the diff leaves untouched are carried forward from the review at 3f9167c (report r3), whose values are repeated; rows marked *new* were computed for this head.

| Statement | Instances tried | Values computed on the two sides / competing models | Result; change |
|---|---|---|---|
| 1.1 crossed-module cohomology (r3) | Identity module; `[μ₂→1]` over ℝ; inversion of C₂ on C₃ | Identity: singletons. `[μ₂→1]`: H⁰ has 2 elements, cokernel's H⁰ has 1. Semidirect H⁰ has 6 elements, nonabelian. | Pass. |
| 1.2 torus duality (r3) | Split G_m; norm-one torus | H¹=0 and torsion coinvariants 0; norm-one: both C₂, invariant lattice 0. | Pass. |
| 1.3 stable classes (r3) | Regular GL₂, quadratic algebra | H¹ of centralizer torus 0; one rational class. | Pass. |
| 1.11 Kottwitz map (r3) | Norm-one torus; PGL₂; compact SU₂/ℝ | Orders 2 and 2; 2 and 2; two H¹ classes to a trivial target. | Pass. |
| 2.4 orbital normalization (r3) | Central γ | Oγ(f)=f(γ), Dγ=1; doubled centralizer measure gives f(γ)/2. | Pass. |
| 2.7 product normalization (r3) | Scalars c, c⁻¹ | Product 1; one factor alone gives c. | Pass. |
| 3.4 companion section (r3) | X²−3X+2 | Trace 3, determinant 2. | Pass. |
| 3.11 Picard dimension (r3) | Pic(ℙ¹); nodal curve; two components | `−1=0+0−1`, `0=1+0−1`, `0=2+0−2`. | Pass. |
| 3.13 δ and codimension (r3) | t²−ε, t²−ε² | δ=0 and δ=1; moving-node codimension 1. | Pass. |
| 3.14 support inequality (r3) | Abelian fibre dim 1; point | 2 and 2; 0 and 0. | Pass. |
| 3.15 purity (r3) | Point; BC₂; BG_m | 1; no positive cohomology; nonzero H². | Pass on DM scope. |
| 3.18 shift and twist (r3) | r=2, q=3 | Shift 4; Frobenius on (2) is 1/9. | Pass. |
| 3.18a cover degree (*new*) | `Sp₄`, char 7, eigenvalues `1,2,−1,−2` | Differences `−1,2,3,3,4,1` all nonzero mod 7; `|W(C₂)|=2²·2!=8`; orderings `4!=24`. | Pass. |
| 3.18a general position (*new*) | `Sp₄`, `ξ=(√2,√3)`; `SL₂`, `ξ=0` | Borels: `ξ∉ℤ²`. Klingen Levis `GL₁×SL₂`: `X^*(M)=ℤe_i`, values `±√2,±√3`. Siegel Levis `GL₂`: `X^*(M)=ℤ(±e₁±e₂)`, values `±√2±√3`. None integral. `ξ=0` projects to `0∈X_*(B)`. | Pass. |
| 3.18a `SL₂` stability interval (*new*) | Saturated eigenlines of degrees `d₁,d₂`; split `(d,−d)` with `ξ₁=1/2` | `⁺a_B={H₁>0}`, `⁺a_B̄={H₁<0}`; conditions `ξ₁<−d₁` and `ξ₁>d₂`; length `−d₁−d₂=long(V/(V₁+V₂))` (CL I (5.6)); for `d₁=d₂=−1` the interval `(−1,1)∋1/2`. Split: `d+1/2<0` and `−d−1/2<0` sum to `0<0`. One line only: half-line `ξ₁<−d₁`. | Pass. |
| 3.18a elliptic stratum (*new*) | `M=G` | `F(G)={G}`, `⁺C_{G,m}=a_T`, `C_m=a_T`; `a_G=0`, `vol(a_G/X_*(G))=1` by the §11.11 convention; `v_G≡1`. | Pass. |
| 3.18a count formula (*new*) | Theorem 11.1 term by term; one object with 2 automorphisms; measure rescaling | Displayed `vol(a_M/X_*(M))⁻¹·vol(a,t)·Σ_hΣ_X J^G_M(Ad(h⁻¹)X,1_{D₀})` identical to lines 2623–2627; cardinality `1/2`; `a_M` measure ×2 gives `2/2=1`; torus measure ×3 gives `3·(1/3)=1`. | Pass. |
| 4.3b coset index (*new*) | `G=M=Sp₄`, `s=diag(−1,−1,−1,−1,1)` | `Z_{M̂}=Z_{Ĝ}=1`, coset quotient `{s}`; `Ĝ_s=SO₄∈E(s)` containing `M̂′=SO₄` as its full Levi; `{1}` would give `Ĝ_1=Ĝ∉E(s)`. | Pass. |
| 4.3b coefficient (*new*) | Same instance | README/intro: `|Z(SO₄)/Z(SO₅)|⁻¹=1/2`. Body (Def. 16.2.1): `|Z_{M̂′}/Z_{M̂}|·1/2=2·1/2=1`. §4.3 (Ngô) at `M=G`: 1. Arthur `ι_{M′}(G,G′)=2·(1/2)=1`. | Fail; R01. |
| 4.3b torus Levi and recursion (*new*) | `M=T`; `H=M′` | `M̂′=T̂=M̂`, theorem void; `Z_{M̂′}/Z_{M̂′}=1`, `S^{M′}_{M′}=J^{M′}_{M′,M′}`. | Pass. |
| 4.6 spherical transfer (r3) | Unit; off-support | 1 and 1; 0 and 0. | Pass. |
| 4.7a JL sign (r3) | n=2, r=1; split | −1 and −1; +1. | Pass. |
| 5.2 normalized induction (r3) | GL₂, q=4 | δ_B=1/4, δ_B^{1/2}=1/2, inverse 2. | Pass. |
| 6.8 unramified BC (r3) | Root 2, degree 2; blocks 2+1 | 4 and 4; parities 1, 0. | Pass. |
| 6.16 central complement (r3) | Torus; zero test | 0 noncentral, 1 and 1; 0 and 0. | Pass. |
| 6.17 twisted distribution (r3) | Full Levi; G_m with inversion | I=J; `1−θ=2`, factor √2 vs 1. | Pass. |
| 6.28 coefficients and character (r3) | G₄, G₂,₂; Steinberg | `ι=1/4`, `τ(H)ι=1`, `τ(G)ε=1`; −1 and −1. | Pass. |
| 7.3 alternating trace and frame (r3) | H⁰,H¹ one-dimensional; scalar 2 | 1−1=0 vs (1,1); 1/2 vs 2. | Pass. |
| 7.10a correspondence (r3) | E³, scalar 2 | 3 and 3; 6 and 6. | Pass. |
| 8.2/7.10a Haar idempotent (r3) | vol 1/4, dim 3 | 3/4 vs 3. | Pass. |
| 8.9 constant term (r3) | Modulus 4, value 1/2, Weyl 4 | 2 vs 1. | Pass. |
| 8 Fourier coefficient (r3) | C₂ | `(1+1)/2=1`, `(1−1)/2=0`. | Pass. |
| 9 raw cohomology (r3) | Zero vs identity differential | Euler 0 with H⁰=H¹=E vs both 0. | Pass. |
| 10 trace recognition (r3) | Bases 1/2, 1/3 | `−1/6`; shifted `−2^{−N−1}3^{−N−1}`. | Pass. |
| 10.23 monodromy (r3) | q=3, F=diag(1,1/3) | `FNF⁻¹=N/3`; dim ker N 1 vs 2. | Pass. |
| 10.28 pair factors (r3) | Roots 2, 3 | Root 6, factor `(1−6q^{−s})⁻¹`, ε=1. | Pass. |
| 10 inner-form comparison (r3) | Trivial, Steinberg | −1, +1, sum 0. | Pass. |
| 11.0a threshold and weight (r3) | GL₄, e_F=1; rank-one hull | `p>17`; weights 1, 0, 1. | Pass. |
| 11.0f exterior-square hypotheses (*new*) | `σ=χ⁻¹`, symplectic `π`; `σ∈T^S(m)` | `σχ=1`, `∧²Sym³V=Sym⁴V⊕1`, `6=5+1`, pole survives; `σ_v` ramified so `σ∉T^S(1)`. With `σ` unramified at `v`: `ω_σ|_U=1`, `ω_π|_U=1`, so `ω_{Σ_χ}²|_U=χ^{2m}` (even `m`) or `χ^{4m}` (odd `m`): `χ⁴,χ⁴,χ¹²,χ⁸`; each exponent divides 24, so `χ^{24}|_U≠1` forces each ≠1; `w₀ω=ω⁻¹≠ω`. | Pass. |
| 11.0f `D₄` Levi (*new*) | `Spin₈`, central node | Roots of `M`: `e₁−e₂, e₃−e₄, e₃+e₄`, type `A₁³`; `Z(M)°=λ(G_m)`, `λ=(1,1,0,0)`; `X^*(M/M_der)=ℤ(1,1,0,0)`, `⟨χ₀,λ⟩=2`, so `λ(t)∈M_der` iff `t=±1`; on the weight `(½,½,½,½)`, `λ(−1)` gives −1, `α₁^∨(−1)` gives +1, `α₁^∨α₃^∨α₄^∨(−1)` gives −1: `λ(−1)=(−I,−I,−I)`. Kernel of `G_m×SL₂³→M` is `⟨(−1,−I,−I,−I)⟩`. `j` kernel `{(1,I,I,I),(−1,−I,−I,−I)}`; image = equal-determinant triples, dim `12−2=10`, rank `6−2=4`. `α₂`-coefficient-1 roots: `12−3−1=8`; coefficient-2: 1. | Pass. |
| 11.0f triple-product twist (*new*) | Twist `σ` by `χ` with `χ_v^4|_U≠1` | New `ω₀χ²`; square `ω₀²χ⁴|_U=χ⁴|_U≠1`, so `ω₀χ²≠1` too and `L(2s,ω₀χ²)` is entire and nonzero on `Re s≥1/2`. `m=1` input: roots `zac,zad,zbc,zbd` (4) vs 8 for three rank-two inputs. | Pass. |
| 11.0h converse theorem range (*new*) | `n=6` | Kim Theorem 2.1 needs `m<n−1=5`, i.e. `m≤4`, as stated. | Pass. |
| 11.0h exterior-square and tensor parameter checks (r3) | Roots 1,2,3,4; (1,2),(3,5) | Product `13824=24³`; roots 3,5,6,10, determinant 900. | Pass. |
| 11.0h `SO₄` multiplicity (*new*) | Dihedral order 10, `j=1,2`; `3+1`; `Sp₄` | `diag(ζ^j,ζ^{−j})` and `[[0,1],[1,0]]` preserve `x₁x₂`; dets 1 and −1 (sign); `ζ^j≠ζ^{−j}` so irreducible; sum: det `1`, symmetric rank 4, both degrees even, `m_ψ=2`. Symplectic pair: symmetric-form space 0. `3+1`: odd summand, `m_ψ=1`. `Sp₄` (type C): 1. | Pass. |
| 11 packet multiplicity (r3) | C₂ | 0 and 1. | Pass. |
| 12 tower degree (r3) | n=1 | 0, sign 1, twist 0. | Pass. |
| 12.5 period equivariance (r3) | `[[1,1],[0,1]]` | Inverse transpose `[[1,0],[−1,1]]`. | Pass. |
| 12.14 sectors and heights (r3) | C₃; rank two | Dimension 1 vs 0; shifts 2 and 1. | Pass. |
| 13 oldforms (r3) | q=3, index 48, dim 4 | 1/12 raw vs 4 normalized. | Pass. |
| 14 signed comparison (r3) | Two equal terms | 0 vs (1,1). | Pass. |
| 15 ledger and Satake export (r3) | 2,−1,3,5,7; roots 2,3 degree 2 | −210 vs 210; `X²−13X+36`. | Pass. |

**Prose repairs.** The nine rewritten API sentences (lines 1070, 1259, 2047, 2131, 3087, 3835, 3856, 3930, 4605, 4908) each now have a subject and a verb and list the same obligations as before; no mathematical content changed and no prospective Lean name was introduced. The §3.18a `*Needs:*` line gained only the clause “for the type-A specialization” on §3.8.

**Ownership and suppliers.** The changed passages add no supplier citation; the citation resolver still finds every cross-roadmap citation, and its two Lean-name leads (`CohCorr`, `rgammac`) are the planned EtaleDualityAndPerverseSheaves API names resolved in the previous review, unchanged here. The weighted Hitchin truncation of §3.18a and the weighted lemma of §4.3b remain owned here: the sibling checkouts named in the brief were searched by object (truncated Hitchin fibration, `ξ`-stability, weighted orbital integral, weighted fundamental lemma) in the previous round and nothing in the 74 changed lines introduces a new object; ownership against open pull requests whose files the brief does not give was not checked.

## Not verifiable

- The five locator-only texts of the previous review remain uncertified and are untouched by this change: `wald-weighted-twisted` Theorem 3.8; `arthur-classification` Theorems 1.5.1, 1.5.2, 2.2.1 and Chapters 6–8 (the survey `arthur-tifr` was read for Theorem 2); `henniart09`; `jacquet-shalika90` §8 Theorem 1; `hiraga-saito12` Theorem 4.14.
- Chaudouard–Laumon I was read in the arXiv v1 text the README cites; the Compositio pagination was not compared.
- The cone-and-lattice definitions and the Sp₄ Check were verified by hand computation on the root data; the properness and point-count theorems themselves are cited, not re-proved.

## Source issues

- **Error** in cl-weighted-II at Théorème 1.4.1 (introduction), printed p. 1651 (arXiv v1 p. 4): the source states the weighted fundamental lemma without the factor `|Z_{M̂′}/Z_{M̂}|` that its own Définition 16.2.1 (p. 1747) and Théorème 19.1.1 (p. 1776) include; it should carry that factor, giving coefficient 1 at `M=G`; affects a stated result.
