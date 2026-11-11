# Review of ModularCurves (pull request #2140 at 2a61d14)

**Verdict:** needs changes

Two findings: one P2 and one P3. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with `sorry` as its only warning (33). The five findings of the previous review are repaired. No stated theorem was found false. The P2 is a lemma of Layer 8.5 whose hypothesis, as written, excludes the unipotent elements of the semi-Borel that Layer 8.9 and the new `regular_quotient_gamma_primePow` apply it to. The P3 is a derivation attributed to a pinned lemma that does not give it.

## Repair of the previous review's findings (head `8a9d136`)

| Previous finding | Passage at this head | Status |
|---|---|---|
| R01, fibre of level three at `p = 2` in the second route of Layer 6.5, item 6 | README 3127–3139: "The fibre of `N = 3` at `p = 2` is a computation of its own … `A₃/2 = 𝔽₄[μ, 1/(μ³+1)]` … which leaves `𝔽₂[u] = 𝔽₂[j]`"; 3123 reads "`p ∤ N`". Recomputed below | repaired |
| R02, KM 7.6.1 statable and absent; KM 7.4.2 over `ℤ` not named | `Suggested.lean` 1118–1143 (`regular_quotient_gamma_primePow`), docstring 109–111 and 147–153; README 3742–3750 with Checks 3756–3770 | repaired; see R01 below for the lemma it rests on |
| R03, étale clause for `[Γ₁(N)]` and `[Γ₀(N)]` | `Suggested.lean` 1111–1113 and 1159–1160; README 2475–2478, 3715–3719, 3945–3948 | repaired; one sentence of the repair is R02 below |
| R04, locators of Layer 1.3 | README 1474, 1531–1532, 1558–1559, 1590, 1598, 1604–1609 | repaired |
| R05, Checks for five definitions | README 2930–2947 (6.3), 3202–3216 (7.1), 3388–3404 (7.4), 3487–3500 (8.1), 3623–3635 (8.5); each recomputed below | repaired |

## R01 (P2) — KM 7.5.2 as stated in Layer 8.5 does not apply to the semi-Borel of Layer 8.9

**Location.** `TauCetiRoadmap/ModularCurves/README.md` 3618–3620: "Prove KM 7.5.2 for a complete noetherian regular local ring with perfect residue field when the group fixes all but one regular parameter and multiplies the last by a unit." Consumers: README 3739–3750 and `Suggested.lean` 1126–1143.

**Claim.** This lemma supplies G3 for the quotients of `[Γ(pⁿ)]` by subgroups of the semi-Borel `{[[1,b],[0,d]]}`.

**Witness.** `h = [[1,1],[0,1]]` (README's own Check, 3765) sends `X(Q)` to `X(P+Q) = F(X(P), X(Q))`. If this were `u·X(Q)`, reducing modulo `X(Q)` gives `X(P) ∈ (X(Q))`, false for a regular system `X(P), X(Q)`.

**Repair.** State the hypothesis the application satisfies: `A` complete noetherian regular local with parameters `x₁,…,xₙ`, and a finite group `H` acting faithfully by automorphisms trivial on the residue field and fixing `x₁,…,x_{n−1}`. Conclusion: `A^H` is regular with parameters `x₁,…,x_{n−1}, N(xₙ) = ∏_h h(xₙ)`, and `A` is free over `A^H` on `1, xₙ, …, xₙ^{|H|−1}`. No condition on `h(xₙ)` is needed: `h` induces an automorphism of the discrete valuation ring `A/(x₁,…,x_{n−1})`, so `h(xₙ)` is a unit multiple of `xₙ` modulo the fixed parameters. Tested on the witness in its simplest form: `A = k[[x,y]]`, characteristic `2`, `y ↦ y + x`; `N(y) = y² + xy`, `A^H = k[[x, y² + xy]]` (integral over it, same fraction field by degree `2`), `A = A^H ⊕ A^H·y`, two generators, regular. Add this instance to the Checks of Layer 8.5; the literal form of 3619–3620 rejects it.

## R02 (P3) — the étale clause over `Ell/ℤ` is not obtained from the pinned lemma by `RelRepData.isPullback`

**Location.** README 3717–3719: "the clause for `[Γ(N)]` being the pinned `hasProperty_etale_gammaRelRepData` over a base on which `N` is invertible, from which the statement over `E/S` follows by the base change `RelRepData.isPullback`"; likewise 2475–2478, "it is the last clause of `firstMainTheorem_gammaOne`".

**Claim.** The clause "étale over every `E/S` of `Ell/ℤ` on whose base `N` is a unit" follows from the pinned statement by `isPullback`.

**Witness.** `ModularCurve/ModuliProblem.lean:170`: `isPullback (f : X ⟶ Y)` compares `D.rep X` and `D.rep Y` for one `D` over one `B`. `ModularCurve/Comparison.lean:361` is about `gammaRelRepData B N` with `N` invertible on `B`; the clause is about `gammaRelRepData (Spec ℤ) N`.

**Repair.** Either add the conjunct `∀ X, IsUnit ((N : ℕ) : Γ(X.base, ⊤)) → Etale ((gammaRelRepData (Spec intRing) N).rep X).hom` to `firstMainTheorem_gamma`, as in the other two theorems (the expression elaborates in a scratch copy), or replace the sentence by the step that is used: the representing scheme is `X.drinfeldBasisScheme N` (`gammaRelRepData_rep`, `Gamma/Full.lean:327`), formed from the curve `E/S`; identify it for `(S, S → Spec ℤ, E)` in `Ell/ℤ` and for `(S, 𝟙, E)` in `Ell/S`, and apply the pinned lemma with `B = S`. At 2475–2478 say the same change of base for `gammaOneRelRepData`, since the transport along `isIso_gammaOneToGammaOneNaive` needs `N` invertible on `B`. Tested: for `N = 1` both forms give the identity of `S`; for `S = Spec 𝔽_p`, `p ∣ N`, neither hypothesis holds.

## Verified sound

### Gate, dependency check, elaboration, probes

- Gate at `2a61d14` (`gate.md`): every scanner `0`, `build=0`, `OK`. The diff against `origin/main` outside `TauCetiRoadmap/ModularCurves` is empty; the folder holds the same five files as on main.
- Dependency check output: `depcheck: 236 roadmaps, 2159 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. Suppliers named are on main: JacobianChallenge, AlgebraicVectorBundles L0B–L0C and L2A, StableReduction Layer 2, AlgebraicCurves Layers 7–9 and 12, EllipticCurves Layers 3 and 5.
- `lake env lean` on `Suggested.lean`: exit `0`, 33 `declaration uses sorry` warnings, the `#check` output, no other message.
- One-tactic probe on a scratch copy: `isSepClosed_residueField_strictHenselization` by `infer_instance` fails (the field is not an instance); `smoothOfRelativeDimension_one_yOne_structureMap` by `infer_instance` fails; the étale clause of `firstMainTheorem_gammaOne` does not close by applying `hasProperty_etale_gammaOneNaiveRelRepData`. No padding found. Every declaration of the file was read in source against its README statement; the only section variables are `(p) [Fact p.Prime] {k} [Field k]` of the deformation section and `{R P P' H} [Group H] [Finite H]` of the quotient namespace, and every further hypothesis is an explicit binder (`exists_universalDeformation`: `[IsAlgClosed k] [CharP k p]`; `hasProperty_finite`: `[IsNoetherianRing R]`; `regular_quotient_gamma_primePow`: `[Fact p.Prime] [NeZero (p ^ n)] [Group H] [Finite H]`).
- Description: 45 **Further sources** paragraphs counted; 33 `sorry` warnings; the generated merge-order block gives the order with #1808 and #1187.

### Adversarial table

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 items 1, 8 (sample) | `D' ⊆ D`, degrees `d', d`; Stacks | Divisors 19.4 (0B8V): `h₂ = hh₁`, `B/hB` flat; Picard Schemes of Curves 3.3 (0B9F): degree `d₂ − d₁`; 3.1 (0B9D): (1) ⇒ (2) ⇔ (3); 19.9 (062Y) flat, locally of finite presentation, no noetherian hypothesis; 19.2 (062T), 19.1 (056Q), 19.3 (0B8U), 3.2 (0B9E) | locators exact | none |
| 0.6 (sample) | `Z = S ⊔ S`, `X = 𝔸¹_Z`; `Z = ∅`; Conrad | `T ↦ 𝒪(T)²`, `𝔸²_S`; one point, `S`; `conrad-rgs` line 2438: `X → S` finite flat finitely presented, `Y → S` affine of finite presentation, and the group form | locator exact | none |
| 0.8 KM 1.11.4 (sample) | `(a,b) ↦ ζ^a`, `ζ^p = 1`, `R = 𝔽_p[X]/(X^p − 1)` | `∏_{a,b}(T − ζ^a) = ∏_a (T^p − ζ^{ap}) = (T^p − 1)^p = T^{p²} − 1`; `∏_a (T − X^a)` has `T^{p−1}`-coefficient `−∑X^a ≠ 0`; Conrad line 493 (2.3.1: constant rank, étale quotient); `Ces15` line 1324 (4.2.3) | true; locators exact | none |
| 1.1 (sample) | `y² = x³` over `𝔽₅` | `1 + 2 + 2 + 0 + 0 = 5` affine points, `6` with infinity, `5` nonsingular | true | none |
| 2.3 (sample) | degree `1`; `φ = [m]` | `φ̂ = φ⁻¹`; `φ̂ = [m]`, `[m][m] = [m²]`; `φ φ̂ φ = φ[n] = [n]φ` and `φ` an epimorphism give `φ φ̂ = [n]` | true | none |
| 2.6 (sample) | `α = 0`; `α = [n]` | `0 − 0 + 0 = 0`, `0 ≤ 0`; `tr = 2n`, `deg = n²`, `n² − 2n·n + n² = 0`, `4n² ≤ 4n²` | true | none |
| 3.4 (sample) | Loeffler 3.3.2 | Loeffler line 666: Zariski-local equation from a local basis of `π_*Ω¹` | locator exact | none |
| 3.6 (sample) | empty rigidifier; pinned predicate | `ModularCurve/Regular.lean:118` quantifies over étale surjective `δ`; `Scheme/Regular/Dimension.lean:66`: nonempty, regular stalks, every nonempty open of dimension `d` | README agrees with the pin | none |
| 5.1 item 6 (headline) | `a = 1` | `b³(1 − 1 − 8b + 36b − 27b − 16b²) = b⁴(1 − 16b)`; open in `𝔸¹`, dimension `1` against `2` for `Spec ℤ[a,b,Δ⁻¹]` | true | none |
| 6.2 (sample) | `g = [[a,b],[c,d]]`, pinned action | `NaiveLevel.lean:552–569`: first point `(g 0 0)P + (g 1 0)Q`, second `(g 0 1)P + (g 1 1)Q`; `[[1,b],[0,d]] ↦ (P, bP + dQ)`; `[[a,b],[0,d]] ↦ (aP, bP + dQ)`; `g ≡ 1 mod d` fixes `((N/d)P, (N/d)Q)` | seven items consistent | none |
| 6.3 Checks | `Frob ∘ j` over `𝔽_p`; `y² = x³ − x`, `y² = x³ − 4x` | `f(T^p) = T` forces `p·deg f = 1`; `4` is not a fourth power in `ℚ` | true | none |
| 6.4 quotient smoothness (headline) | `ℤ_(2)[x]`, `x ↦ −x`; `k[s,t][x]`, `x ↦ x + as + bt`, `(ℤ/p)²`; `k[ε][t]`, `t ↦ (1+ε)t` | `ℤ_(2)[x²]`; `k[s,t][N(x)]`, `N` additive of degree `p²`, smooth; `εt` invariant, killed by `ε`, not in `εM` | regular base needed and present | none |
| 6.4 kernel base change | `ℤ →² ℤ`, `R = 𝔽₂`; diagonal `ℤ → ℤ²` | `ker(f ⊗ R) = 𝔽₂` against `0`; cokernel `ℤ`, both sides `0`; `ker(f⊗D/𝔭)/im = Tor₁(coker, D/𝔭)` | true | none |
| 6.5 item 6 (headline, sample) | level three at `p = 2` | `u ≡ μ¹²/(μ³+1)³`; `u(μ/(μ+1)) = μ¹²(μ+1)⁹/((μ+1)¹²(μ²+μ+1)³) = μ¹²/(μ³+1)³`; `|{aμ/(cμ+1)}| = 3·4 = 12 = [𝔽₄(μ):𝔽₄(u)]`; `27 = 1` in `𝔽₂`; `Ces15` lines 1059, 1095 | true; both routes cover every `R` | none |
| 7.1 PD-1 Checks, PD-2 (sample) | `[−1]` on one level; ordinary against supersingular; `y² + xy = x³ + t` over `𝔽₂(t)` | `[2]` invertible on `E[p]`, `p` odd; `[2] ≠ 0` on `E[4]`; `p` points against `1`; `j = 1/t`, point `(0, √t)`, two points of `E₀[2]` | true | none |
| 7.4 Checks | `T ↦ T²`; constant family | `T ↦ cε` induces `c²ε² = 0`; `T ↦ 0` and `T ↦ ε` agree | determines its object | none |
| 7.5 (sample) | ST-1, ST-2 against Layers 7.4, 8.3 | used only through ST-3 with PD-5; base category as in 7.4 | consistent; Katz not read | none |
| 8.1 Checks (sample, headline `axiomaticRegularity`) | trivial; empty; sections of `E[p]` | `W(k)[[T]]`, rank `1`; rank `0`, fails 4A; `[p](X) = X·g`, `g(0) = p`, in `(p,T,X)²`, quotient not a domain | discriminates | none |
| 8.5 (sample, headline) | `y ↦ −y`; `(x,y) ↦ (−x,−y)`; `y ↦ y + x`, characteristic `2` | `k[[x,y²]]`, 2 generators; `k[x,y]/(x²,xy,y²)` of dimension `3 > 2`; `k[[x, y²+xy]]`, 2 generators, not a unit multiple | Checks true; lemma hypothesis too narrow | R01 |
| 8.8 (headline) | `N = 1`; `N = 4`; `𝔽_p`, `p ∣ N` | rank `1`; `16 − 4 = 12`; `k[X]/(X^{p²−1})`, clause empty | true; one derivation misattributed | R02 |
| 8.9 `regular_quotient_gamma_primePow` (headline) | `n = 0`; `p = 2, n = 1`; full semi-Borel; `{±1}` scalar, `p` odd | `H = 1`, rank `1`; `6/2 = 3`; `p^{4n}(1−1/p)(1−1/p²)/(p^{2n}(1−1/p²)) = pⁿφ(pⁿ)`; `{1, −1}` is not a product subgroup (no `h` with entries `1, −1`) and its quotient is the cone of 8.5, correctly excluded | true; entries `0 0 = 1`, `1 0 = 0` match the pinned action | R01 |
| 9.4 (sample, headline) | `N = p`; `N = 4` | `(N²/φ(N))∏(1 − 1/p²)`: `p + 1`; `16·(3/4)/2 = 6`; `Ces15` lines 1375–1386 (4.2.7(c)), 2615 (5.13); Conrad lines 1761–1767 (4.2.3(4)), 1308–1325 (3.3.4) | true; locators exact | none |

### Library declarations opened at the pin

`ModularCurve/FullLevel.lean:86, 124, 131`; `ModularCurve/NaiveLevel.lean:511, 552, 563`; `LinearAlgebra/Matrix/GeneralLinearGroup/ZModProdAut.lean:56, 71` (column-vector action, so `φ ∘ g` is the row-vector convention); `ModularCurve/Comparison.lean:351, 361`; `ModularCurve/Gamma/Full.lean:318, 327`; `ModularCurve/ModuliProblem.lean:164, 170, 188`; `ModularCurve/Regular.lean:118`; `Scheme/Regular/Dimension.lean:66`; `ModularCurve/Ell.lean:98`. Fifteen locations in nine files.

### Cross-roadmap citations and overlaps

- `citations.md`: no cross-roadmap citation is unresolved; the five names listed are declared in `Suggested.lean` (lines 480, 512, 555, 570, 725).
- `overlaps.md`: no id cited here is dropped by an open pull request or defined only by an open revision. The six ids this pull request drops have their old → new place in §Labels (rows 4525–4529 and the sentence on `0A.k` at 4463). #1187 and #1808 conflict with this head; the generated block gives the order.
- Ownership: `regular_quotient_gamma_primePow` occurs only in this folder; `KatzMazurQuotientData`, `RegularityAxioms`, `IsHenselization`, `CoarseModuliData` occur only here, on main in this folder, and in the copies carried by #1187 and #1808.

## Not verifiable

- Katz–Mazur: no legal copy found by the sources service. Every KM locator is cited by locator only, including those of the sampled sections (1.1.1, 1.2.2, 1.2.3; 1.6.2–1.11.5; 2.6.1–2.6.3; 4.12 and p. 505; 7.4.2; 8.2.1; 5.2.1; 7.5.1–7.5.3; 6.6.1) and KM 7.6.1. The wording of KM 7.5.2 was therefore not compared with README 3618–3620; R01 is about the statement as the README gives it.
- Katz, *Serre–Tate local moduli*, Theorem 1.2.1 (Layer 7.5): resolves only to a paywalled page; three author-page addresses tried, none found.
- EGM (5.12), (12.15)–(12.26), (10.10)–(10.21), (4.45), (5.18), (5.19) of the sampled Layers 2.3, 2.6 and 7.1: no legal copy found.
- Silverman `AEC`: settled as uncertified.
- Deligne–Rapoport, SGA 3, Igusa, Lazard, Mazur, Oort, Tate–Oort, Oda, Scholze, Kottwitz–Wake, Rydh, SGA 1 and Buzzard's lecture were not read in this review.

## Source issues

- none
