# Review of ArakelovGeometryAndAbelianHeights (pull request #1000 at f2895a4)

**Verdict:** accepted

No P1 or P2 finding. The gate passes (every scanner, the dependency check and the targeted build), the dependency check shows no UPWARD or CYCLE line, every cross-roadmap citation resolves at main or at the cited open head, the fifteen sampled targets agree with their sources at the stated locators, and the adversarial table below carries computed values on both sides for every sampled target and every headline. The four findings are P3 notes the author may take or leave.

## R01 (P3) — README carries ~248 backticked Lean names that `Suggested.lean` does not declare

Location: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md`, API bullets and Check labels throughout, e.g. line 165 (`HermitianBundle.module`), line 183 (`HermitianBundle.trivial_rank: rank Ō_K = 1 …`), line 965 (`AbelianVariety.faltingsHeight`), line 1556 (`AbelianVariety.thetaHeight`); line 149 ("Lean names in the numbered sections specify the intended library interface").

Claim: the API bullets and many Checks name Lean declarations of this roadmap's own.

Witness: `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/Suggested.lean` declares nothing (docstring and an empty namespace, 38 lines); the worker's citation scan lists 248 such names found nowhere at the pins. The house rules state that an API bullet carries a backticked name only when `Suggested.lean` declares it and that a Check never names a Lean counterpart; the sentence at line 149 redefines the convention rather than following it.

Repair: keep every API bullet and Check as prose (drop the backticked labels, or write "the determinant line", "the component height" in words); delete the sentence at line 149. If names must stay as an interface for consumers (FaltingsFinitenessAndIsogenyTheorems, ShimuraCompactifications and EllipticCurvePeriodsAndModularParametrizations cite `GroupScheme.IsSemiAbelianFamily`, `SiegelModuli.ToroidalCompactification`, `AbelianVariety.faltingsHeight`), at least remove them from the Checks, which the rule excludes outright.

## R02 (P3) — `mulHeight_algebraMap` is not the supplier's name

Location: README.md line 71, "`mulHeight_algebraMap`: for a finite extension `L/K` … `H_rel,L(x) = H_rel,K(x)^[L:K]`".

Claim: DiophantineApproximationAndTranscendence §0.2 supplies a declaration of that name.

Witness: `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md` line 43 names the same statement `mulHeight_pow_finrank` (and `mulHeight₁_pow_finrank` for scalars); `mulHeight_algebraMap` occurs nowhere in that README, in the pinned Mathlib or in Tau Ceti.

Repair: write `mulHeight_pow_finrank` (statement unchanged; the zero-tuple clause and the `(x,1)` reduction are exactly DAT's).

## R03 (P3) — two locators do not carry the statement cited

Location: README.md line 737 (§2.2 source list, "Pazuki, Theorem 1.1, p. 2") and line 70 ("Wu, Arithmetic Heights, §2, Lemma 2.5 and Definition 2.7, p. 4").

Claim: Pazuki's Theorem 1.1 states the covolume identity `‖dz₁∧⋯∧dz_g‖²_Fal = det Im τ`; Wu's notes are a source for relative-height scaling and absolute-height invariance.

Witness: pazuki12 lines 68–79 (Theorem 1.1) compare theta and Faltings heights and mention `det Im τ_σ` only inside the inequality; the covolume identity appears in the proof of Lemma 5.4 (pazuki12 line 817) and in Faltings–Chai V.4.5. The Wu text (wu lines 5–21) is a week-08 student seminar handout on Mordell–Weil, not a textbook; the fact is standard (Bombieri–Gubler, *Heights in Diophantine Geometry*, §1.5; Hindry–Silverman, Part B §2).

Repair: cite Pazuki Lemma 5.4 (or only Faltings–Chai V.4.5 and Deligne §1.10) in §2.2; replace the Wu locator by a textbook locator, or drop it since DAT §0.2 is the supplier of record.

## R04 (P3) — Scope does not name the owner of general compactifications

Location: README.md lines 9–11 (Scope and ownership, "The principal Siegel compactifications over `Spec ℤ` and their descended ample powers are targets of §5.0").

Claim: §5.0a–§5.0b are this roadmap's targets.

Witness: PELModuli (#966) line 244 defers toroidal and minimal compactifications to ShimuraCompactifications; ShimuraCompactifications (#1053, merge order line 143, after this roadmap at line 124) lines 337–345 import this roadmap's §2.0 and §§5.0a–5.0b for the principal Siegel case. The split is consistent but unrecorded here.

Repair: add one clause to Scope: general PEL toroidal and minimal compactifications belong to ShimuraCompactifications, which is later in the merge order and imports the level-one principal Siegel case stated in §5.0.

## Verified sound

**Gate and build.** The worker's gate at f2895a4 passes every check (`gate.md`: set_option 0, latex 0, residue 0, stray-files 0, build 0). I elaborated `Suggested.lean` myself with `lake env lean` from the worktree: exit 0, no output. The file has no declarations, so the `#check @name` comparison is vacuous and there is no padding. No change outside the roadmap folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 209 roadmaps, 1464 edges, 0 problem(s)`; no UPWARD or CYCLE line for this roadmap, no `moved:` line.

**Headline theorems and statability.** Headlines from the Summary and layers: the isogeny formula with its half-log-degree bounds (§§4.2–4.4), `h(A^t) = h(A)` for arbitrary reduction (§4.3), the modular-height identity `h_L̄(x_A) = m·h_st(A)` (§5.5), Northcott and the lower bound for principally polarized moduli points (§5.6, §6.4), the theta comparison (§5.8), `h_st(E) ≤ h(j)/12 + 3` (§5.9), Zarhin `h_st((A×A^t)^4) = 8h_st(A)` (§6.2) and Bost's bound (§6.5). Each needs the Faltings height of an abelian variety over a number field. At the pins: Tau Ceti has `AbelianVariety` over a field (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` line 95) and isogenies, and only the predicates `WeierstrassCurve.IsGlobalMinimal`/`IsSemiGlobalMinimal` for elliptic curves (`TauCeti/AlgebraicGeometry/EllipticCurve/GlobalMinimalModel.lean` lines 98, 130); no Néron model, no invariant-differential lattice, no analytification or period lattice, no minimal-discriminant ideal; Mathlib has `ModularForm.discriminant` and `Height.logHeight` but no uniformization of an elliptic curve by `ℂ/Λ`. So no headline, not even the elliptic case of §2.9/§5.9, is statable, and the docstring's account is accurate. Hermitian line bundles over `O_K` and their degree (Layer 1) could be defined on native carriers, but Layer 1's results are API and comparisons, not headlines, so their absence is not a defect.

**Adversarial table** (statement; instances; values computed on each side; result).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: `‖α‖²_Fal = (i^{g²}/2^g)∫α∧ᾱ > 0` | g=1, ℂ/(ℤ+iℤ); g=2, E×E; general g | g=1: dz∧dz̄ = −2i dx∧dy, (i/2)(−2i)=1; g=2: α∧ᾱ = 4·vol, i⁴/4·4(Im τ)² = (Im τ)² > 0 while (i/2)²·4(Im τ)² = −(Im τ)²; general: i^{g²}(−2i)^g(−1)^{g(g−1)/2}/2^g = 1 | correct; Faltings's printed `(i/2)^g` (faltings83 lines 109–124, image p.351; p.354) is negative for g ≡ 2,3 mod 4 as the README says |
| Conventions: `h_Del = h_Fal + (g/2)log π`, `h_un = h_Fal − (g/2)log 2` | g=1 | ‖·‖²_Del = π^{−g}‖·‖²_Fal (deligne85 image p.26: `(1/(2π)^g)∫|α∧ᾱ|`); shift = −½ log c per embedding over [K:ℚ] embeddings: +0.5724, −0.3466 | correct; gaudronremond14 line 1906 `h_F = h − ½ log π` agrees |
| §1.3 degree | ℚ(i), 𝔞=(1+i), s=1+i; weight nonexample | index 1, Σ_σ log‖s‖ = 2·½log 2 → deg = −log 2; once per place: log 4 − log 2 ≠ 0 | correct; faltings83 image p.354 has `Σ ε_v log‖p‖_v` with ε_v ∈ {1,2} |
| §1.3 rescaling | rank r, c; rank 0 | det norm e^{−rc}: Δdeg = r[K:ℚ]c; zero bundle 0, no slope | correct |
| §1.4 independence | ℚ, s→2s; ℚ(√2), a=1+√2 | log 2 − log 2 = 0; finite 0, log|1+√2|+log|1−√2| = log 1 = 0 | correct; pinned `NumberField.prod_abs_eq_one` (ProductFormula.lean:98) |
| §1.5 dual, lattice index | L=𝔞s; ℤ ⊂ ½ℤ | ‖s^∨‖=‖s‖⁻¹, deg^ L^∨ = log N𝔞 + Σlog‖s‖ = −deg^ L; 0 and log 2 | correct |
| §1.6 base change | (ℤ,2|·|) to ℤ[i] | −2 log 2 = 2·(−log 2); `Ideal.absNorm_algebraMap` (RelNorm.lean:486) | correct; yuanzhang18 line 67 |
| §1.7 principal divisors, `O(D)` | (2) over ℚ; general (𝔞,λ) | log 2 − log 2 = 0; O((2)) = ½ℤ with 2|·|, ‖½‖=1, ‖2‖=4; deg^ O(𝔞,λ) with s ∈ 𝔞⁻¹: log|Ns| + log N𝔞 + Σλ_v − log|Ns| | correct; matches szpiro85 image p.14 Prop 1.1 (`exp(−λ_σ/ε_σ)`) and gilletsoule90 image p.131 §3.4.3 |
| §1.8 Green sign, vertical fibre | ℂ, z; Spec ℤ | dd^c(−log|z|²) = −δ₀; d̂iv(p) = (V_p, −2log p) so (V_p,0) ≡ (0, 2log p), both of degree log p | correct; gilletsoule90 lines 1235–1239 |
| §1.9 ĉ₁ | (ℤ, r|·|); FS on ℙ¹ | (0, −2 log r) of degree −log r = deg^; −log(|z|²/(1+|z|²)) + log|z|² = log(1+|z|²) smooth | correct |
| §1.10 point height | [1:2], FS, over ℚ and ℚ(i); Green shift c | ½ log 5 both ways (cycle doubles, degree doubles); shift ½·c·d·[K:ℚ] | correct; zhang21 lines 2390, 2405 |
| §1.11 stack degree | [Spec O_E/(ℤ/2)], Φ≡2 | ½·[E:ℚ]·2/2 = [E:ℚ]/2 | correct; aghmp18 lines 3337–3345 (p.80) |
| §1.12 sup height | [a:b] coprime | log max(|a|,|b|) = `mulHeight_eq_max_abs_of_gcd_eq_one` (Height/NumberField.lean:502) | correct |
| §1.13 ampleness | O(−1) at [1:2]; roots of unity | −log 2, unbounded below; h=0 for infinitely many without a degree bound | negative controls hold |
| §1.14 `deg^ = Height.logHeight` | finite and infinite parts; [1:1], [1:0] | ∏ᶠ_𝔭 max|x_i|_𝔭 = N(𝔟)⁻¹ (`absNorm_mul_finprod_finitePlace_eq_one`, NumberField.lean:199); Σ_v mult(v) log max (`mulHeight_eq`, :127); FS − sup ∈ [0, ½[K:ℚ]log(n+1)]: 0 vs ½log 2; 0 vs 0 | correct |
| §1.15 norm | N_{ℚ(i)/ℚ}(1+i); half-class torsion in ℚ(√2) | module 2ℤ, ‖2‖ = |1+i||1−i| = 2, degree −log 2 = deg^(𝔭); ½(a,−a) is nonzero 2-torsion in ℝ²/ℤ(a,−a) | correct |
| §2.1 sesquilinearity | ℂ/(ℤ+iℤ) | ⟨i dz,dz⟩ = (i/2)∫dz∧(−i dz̄) = −i; ⟨dz,i dz⟩ = i | correct |
| §2.2 covolume | ℤ+τℤ; ℤ^g+τℤ^g; basis (Ω₁|Ω₂) | det[[1,Re τ],[0,Im τ]] = Im τ; det Im τ; |det Ω₁|² det Im τ | correct |
| §2.3 isogeny norms | [n] | deg n^{2g}, [n]^*α = n^gα, norm² ×n^{2g} | consistent; raynaud85 image p.205 `∫|u^*ω∧u^*ω̄| = d∫|ω∧ω̄|` |
| §2.4/§2.9/§3.1 11.a2 | τ ≈ ½+1.14939i, Δ_min = −11⁵ | q ≈ −7.30·10⁻⁴, |Δ| ≈ 7.43·10⁻⁴, y⁶ ≈ 2.306; 12·deg = 11.9895 + 6.370 − 22.055 = −3.696; h ≈ −0.3080 | matches LMFDB −0.30800984 (stable = relative, semistable) |
| §2.4 model nonexample 27.a3 | X=4x, W=8y+4 | W² = 64(y²+y)+16 = X³+16; dX/(2W) = dx/(4y+2) = ω_N/2; index 2 → +log 2 | correct |
| §2.5 product sign | g,h | i^{(g+h)²} = i^{g²}i^{h²}(−1)^{gh}; reordering costs (−1)^{gh} | cancels, isometry |
| §2.6 duality identity | E, α=[n]; Tate curve q=π⁵ | n² = deg; pairing 5, both lines ℤ·dt/t | consistent; raynaud85 image p.207 Thm 2.1.1 |
| §2.7/§2.10 Deligne norm | dz on ℂ/(ℤ+iℤ) | (2π)⁻¹·2 = 1/π; ‖dz⊗dz‖² = 1/π² | correct; yuanzhang18 lines 401–416 (Lemma 2.1, p.12) |
| §2.9 formula | derivation | 12 log#(ω̄/O_Kω) = log NΔ_min − log|NΔ_ω|; |σΔ_ω|‖ω‖¹² = (2π)¹²|Δ(τ)|y⁶; sum gives −12[K:ℚ]log 2π | correct; double-count nonexample 12 log 2π |
| §3.3/§3.4 | 27.a3; K(A[12]) | correction a positive multiple of (log 3)/[L:ℚ]; level 3 away from 3, level 4 away from 2 | correct; deligne85 image p.27 `h ≥ h_geom`, equality iff semistable |
| §3.6 | K(A[15]); #GL₂(ℤ/12) | [K′:K] ≤ #GL_{2g}(ℤ/15); 96·48 = 4608; (log p)/[K′:ℚ] ≤ h − h_st | matches deligne85 image p.35 Lemme 1.23 verbatim in content |
| §4.1 different | [n] on g-dim; μ_p and ℤ/p quotients | Fitt₀ = (n^g), Ann = (n) for g>1; (p) vs (1) | correct; raynaud85 image p.204 §1.3 |
| §4.2 isogeny formula | derivation; [n] | deg^𝒜 = deg^ℬ + log#(O_K/𝔡) − ½[K:ℚ]log d; g log|n| − g log|n| = 0 | matches faltings83 line 394 (Lemma 5, p.358) and raynaud85 image p.205 Prop 1.4.1 |
| §4.3 dual differents | μ_{p^n}; E/F, [p]; coefficient comparison | n v(p) + 0 = v(p^n); #coker = #E[p](F)p^{[F:ℚ_p]}; log_q h¹(M_{K_r}) = v(d)r + O(1) | raynaud85 image p.207: `𝒟_u𝒟_{u′} = (d)` with no semistability hypothesis; p.211 sequence (5) |
| §4.4 bounds | d = p^n; rationality | m = 2k − [K:ℚ]n, |m| ≤ [K:ℚ]n; v_p ∈ [−[K:ℚ]v_p(d), [K:ℚ]v_p(d)] | raynaud85 image p.207 Cor 2.1.4; bpr13 lines 655–665 (p.971) |
| §4.5 tower | G = A[ℓ^∞] good; zero subgroup | h_G/2 − Σ[K_v:ℚ_ℓ]g/[K:ℚ] = g − g = 0; 0 | faltings83 line 467 (p.359); raynaud85 lines 774–790 (Def 4.1.1, p.219), 805–808 (Cor 4.1.3, p.220) |
| §4.6/§4.7 components | E = ℚ; sign of §4.7 | h(A,id) = (h_YZ(A)+h_YZ(A^t))/2; deg N(𝒳) − deg N(𝒴) = log#coker f^* − log#coker f^{t*} | yuanzhang18 lines 440–461 (pp.13) |
| §5.0b g = 1 | ℙ¹_ℤ, m = 12 | ω¹² ↔ O(1) via (E₄³ : Δ); stabilizer characters have order dividing 3 in char 2 (j=0) and 4 in char 3 (j=1728), so ω¹² is invariant | correct |
| §5.1/§5.3 | cusp; E_deg×E | Im τ = −(1/2π)log|q|; g=2, r=3, 2g−r=1 | deligne85 lines 332–361 (Lemme 1.18, exponent |log|z||^{2g−r}); szpiro85 lines 545–558 (Thm 3.2, p.26) |
| §5.4 | discriminant section | ‖Δ‖ = (2π)¹²|Δ_Mathlib|(Im τ)⁶, consistent with §2.9 | correct |
| §5.7 theta at τ = i | half-characteristics vs Mumford | θ₂ = θ₄ = 2^{−1/4}θ₃, θ₁₁ = 0: [1:a:a:0]; θ_{0,0}(4i) = (θ₃+θ₄)/2, θ_{½,0} = (θ₃−θ₄)/2, θ_{¼,0} = θ_{¾,0} = θ₂/2: [1+a:a:1−a:a]; ℓ² norms 1+√2 vs 2+2√2; finite part ¼log 2 both (v_𝔭(a) = −1 at the prime over 2); FS difference ½ log 2 | correct; pazuki12 lines 389–392 (G = S_{r^{2g}} ⋉ μ_{r⁴}), 432–452 |
| §5.7 nonexamples | sup vs ℓ²; (1/5)[[3,4],[−4,3]] | ≤ ½ log r^{2g}; [1:0] → [3:−4], heights 0 vs log 5 | correct |
| §5.8 constants | m, M, C(g), C₁, C₂, c(g); g=2 | m = g(¼log 4π − ½r^{2g}log r); M = (g/4)log 4π + g log r + (g/2)log(2 + 2^{1+g³/4}/3^{1/4}); C(g) = (8g/π)(1+2g²log 4g); C₁ = 6r^{2g}log r^{2g}; C₂ = 1000r^{2g}(log r^{2g})⁵; g=2: 2^{1+2} = 8 | all match pazuki12 lines 73–107 and image p.2; c(g) at lines 850–860 |
| §5.8 origin identity | Lemma 5.2 at P = 0; β examples | 0 = h_Θ − ½h_F − (g/4)log 2π + (Σβ_𝔭 log N𝔭 + Σβ_σ)/[K:ℚ]; β_σ(1,1,0,0) = −½log 2, (1,2,0,0) = −½log 5; Prop 5.3(ii) ≤ (g/2)r^{2g}log r | pazuki12 lines 769–785, 603–608, 800 |
| §5.9 | j = 0; j = −1; GR constant; 11.a2 | q = −e^{−π√3} = −0.004333, |Δ| ≈ 0.004807, y⁶ = 0.4219, U = 0.002028; h_Fal = −(1/12)log U − log 2π = −1.3211, Deligne −0.7487; y = 0.8944: U ≈ 0.002024, −1.3210; B = 1194(2π/log 1194)⁶e^{1/9}(2π)¹²: ½log π + (1/12)log B = 0.5724 + 2.3776 = 2.950; h(j)/12 = 1.5516 ≥ −0.308 | matches gaudronremond14 lines 1894–1933; bpr13 line 659 |
| §6.1–§6.2 Zarhin | E; dimension | Z(E) = E⁸, dim 8; 4h + 4h = 8h | PDERC RD.5.116 (line 12165 at #1002); moretbailly85 lines 7296–7300 (Lemme 1.1, p.205); deligne85 image p.35 Rem 1.22 |
| §6.3 | #GL₂(ℤ/12); 2·3^{4g²} | 4608; g=1: 96 ≤ 162 | PELModuli M6.8 (line 3981 at #966) |
| §6.5 Bost | normalizations | −(g/2)log 2π = −0.919g; −(g/2)log(2π²) = −1.490g > −1.5g; j=0 minimum −0.749 > −0.919 | gaudronremond14 lines 1995–1996 (Thm 8.1), 2177–2178 (Cor 8.4); gaudronremond14b line 1792 (−3g/2, p.2101); tsimerman18 lines 98–100 |

**Sources read at their locators** (sample and headlines): faltings83 pp.350–359 (Lemma 1 p.350; §2 Bemerkungen a)–d) p.351; degree and `h(A)` p.354; Definition and sketch p.355; Lemma 3 and Satz 1 p.356; Lemma 5 and Bemerkung p.358; height formula p.359), faltings83b pp.339–340, deligne85 §1.1–1.2 pp.25–27, Exemple 1.4 and Rem 1.5 p.28, Prop 1.3 p.27, 1.7–1.9 pp.29–30, 1.10–1.11 p.31, 1.17 p.33, Lemme 1.18 pp.33–34, Lemme 1.20 p.34, 1.21–1.24 p.35, §2.1–2.2 p.36; szpiro85 §1.1–1.2 pp.13–14 (Prop 1.1, Corollaire), §3.3 p.25, Thm 3.2 and Lemme 3.2.1 p.26; raynaud85 §1.1 p.201, §1.3–1.4 pp.204–205 (Prop 1.4.1), Cor 1.4.3 p.206, Thm 2.1.1, Rem 2.1.2, Cor 2.1.3–2.1.4 p.207, §2.2–2.4 pp.209–211, Def 4.1.1 p.219, Cor 4.1.3 and Lemma 4.2.4 p.220; bost96 Thm 2.1 p.119, A.1–A.3 pp.146–147, Prop C.2 p.154; gilletsoule90 §3.3.1–3.3.5 pp.126–127, §3.4.2–3.4.3 p.131, Thm 3.6.1 pp.134–135; moretbailly85 IX §1 pp.205–206; pazuki12 pp.2–3, §2.2 pp.6–7 (Def 2.1, `(2π)^{−g}i^{g²}`), §2.3 pp.7–10, Def 3.1 p.11, Thm 3.4 p.12, Props 4.1–4.2 pp.14–15, Prop 5.1 p.16, Lemma 5.2 and Prop 5.3 p.17, Lemma 5.4 and Prop 5.5 pp.18–19; yuanzhang18 §1.1 pp.2–3, §2.1 pp.11–12, §2.2 pp.13–14, Lemma 2.4 and Cor 2.5 pp.15–16, erratum; yuan26 §3.1.3 and Lemma 3.4 pp.43–44, §4.3.1 pp.70–72; gaudronremond14 Def 2.1 pp.6–7, Lemme 7.9 pp.32–33, Thm 8.1 and Lemme 8.2 pp.34–35, Cor 8.4 p.37; gaudronremond14b §9 p.2101; bpr13 Prop 4.4 p.971; tsimerman18 §2.1 and Thm 2.1 p.3; aghmp18 (4.6.1) p.59, §6.4 pp.79–80, Def 9.1.4 p.113; zhang21 Rem 8.5 p.42 and (9.1)–(9.4) p.43; stacks02OO Lemma 02OO (case (3): reduced source, generic points off the divisor), Stacks 00PD (conditions (1) and (5)) and 0AY7 (codimension-one extension to the reflexive hull) read online. LMFDB 11.a2: Faltings height −0.30800984111840306…, stable height equal, Δ_min = −161051, j = −122023936/161051.

**Library declarations opened at the pins**: `NumberField.mulHeight_eq` (Mathlib/NumberTheory/Height/NumberField.lean:127, relative: `∏_v (sup)^{mult}·∏ᶠ_𝔭 sup`), `absNorm_mul_finprod_finitePlace_eq_one` (:199), `mulHeight_eq_max_abs_of_gcd_eq_one` (:502), `Height.logHeight` (Height/Basic.lean:271), `Projectivization.logHeight` (Height/Projectivization.lean:51), `mulHeight_smul_eq_mulHeight` (Basic.lean:335), `NumberField.InfinitePlace.mult` (InfinitePlace/Basic.lean:274), `InfinitePlace.prod_eq_abs_norm` (:370), `NumberField.prod_abs_eq_one` (ProductFormula.lean:98), `Ideal.absNorm_algebraMap` (RingTheory/Ideal/Norm/RelNorm.lean:486), `Algebra.norm_norm` (NumberField/Norm.lean:94), `NumberField.Units.logEmbedding` (Units/DirichletTheorem.lean:83, component `mult w * log (w x)` at `w ≠ w₀`), `NumberField.Units.regulator` (Units/Regulator.lean:266), `ModularForm.discriminant_eq_q_prod` (ModularForms/Discriminant.lean:114), `discriminant_T_invariant`/`discriminant_S_invariant` (:127, :144), `ZLattice.covolume_eq_det_mul_measureReal` (Algebra/Module/ZLattice/Covolume.lean:115), `AlgebraicGeometry.AlgebraicCycle` (AlgebraicCycle/Basic.lean:44), `Northcott` (Order/Northcott.lean:36); Tau Ceti `ZLattice.covolume_sq_eq_det_gram` (TauCeti/Algebra/Module/ZLattice/Covolume.lean:42), `fractionalIdealDivisorAddEquiv` (TauCeti/AlgebraicGeometry/WeilDivisor/Dedekind/ClassGroup.lean:20), `AbelianVariety` (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95), `WeierstrassCurve.IsGlobalMinimal` (EllipticCurve/GlobalMinimalModel.lean:98).

**Cross-roadmap citations resolved** (section heading present at the cited head, named declaration present): AbelianSchemesAndArithmeticModuli (#849) A1.1, A1.3, A1.5, A2.2, A3.1, A3.5, A3.6, A3.7, A3.11, A4.3, A5.1, A5.3, A5.4, A5.7, A5.8, A6.13, A6.18, A6.22, A6.38 with `relativeProductsAndDimension`, `relativeInvariantForms`, `normalizedPoincare`, `dualIsogenyCartierKernel`, `IsAbelianIsogeny`, `ThetaGroup`, `polarizedWeilPairing`, `principalQuotient`, `AbelianH1dR`, `AbelianLattice`, `appellHumbert`, `polarizationType`, `realizationConventions`, `SiegelFamily`, `polarizedIsogenyDegree`, `polarizedAutomorphisms`, `CoefficientHom`, `AbelianHodgeLine`(.baseChange, .product); NeronModelsAndSemistableAbelianVarieties (#852) 1.1, 1.3, 1.5, 1.7–1.9, 1.11 (`DifferentialLattice`, `NeronDifferentials.pullback`, `.det`), 3.1–3.3, 3.10, 3.12–3.14, 6.9 (`u⁻¹` scaling, `Δ_old = u¹²Δ_primed`); PELModuli (#966) M3.9, M5.2, M6.3, M6.5, M6.6, M6.8 (`2·3^{4g²}`), M6.9, M6.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) R07.1.17 `invariantDifferentialsAndAbsoluteDifferent`, R07.1.21 `BarsottiTate.exists_of_tateModule_summand`; ArithmeticGaloisDuality (#858) D7.6 with both named paragraphs; ComplexComparisonPartII (#848) C−1.1, C0.2, C0.4, C5.1, C5.4 and the five names; AlgebraicModuliForArithmeticGeometry (#853) §3.1 `spaceFpqcQuasicoherentDescent`; PadicDifferentialEquationsAndRigidCohomology (#1002) RD.5.116 "Zarhin's trick" (principal polarization on `(A×A^∨)^4`, étale-locally when the polarization is only étale-local); on main: SchemeAndStackFoundations §§0.3, 0.6, 1.18–1.23, 3.4 (`classGroup_picard_locallyFactorial`), 3.5 (`lineBundleNorm`), 3.8 (`invariant_differentials`), 4.7, 4.10, 4.17 (`SNCData`, `IsStrictNormalCrossings`, `IsNormalCrossings`), 5.1 (`cyclesOfDimension`, `ChowGroup`); DiophantineApproximationAndTranscendence §0.2 (`absoluteProjectiveTupleHeight`, `_eq`), §0.3 (`finite_setOf_absMulHeight₁_le`); HeightsAndUnits 1.1 (`instNorthcottProjectivizationMulHeight`, `instNorthcottProjectivizationLogHeight` in its `Suggested.lean` lines 132, 135); EllipticCurves 4.5a (`minimalDiscriminantIdeal`), 4.5b (`Δ′ = Δ(W)/u¹²`); AlgebraicVectorBundles L0B (`FiniteLocallyFreeSheaf`), L0C (`determinantObj` in its `Suggested.lean` line 344); DifferentialGeometry 5.2 `integralTopForm`, `SmoothForm`; ClassFieldTheory Layer 5 (`tateDualityPairing_perfect_mixed`, `finite_H`, `eulerCharacteristic_mixed`).

**Ownership.** Searched by object with `roadmaps grep` and in the sibling checkouts: no other roadmap on main or in an open pull request defines hermitian bundles over `O_K`, the Arakelov degree, arithmetic divisors, the Faltings metric or the Faltings height. ArithmeticKTheory (#1418) is hermitian K-theory only. EllipticCurvePeriodsAndModularParametrizations (#1715, another author, unplaced) imports this roadmap's §§2.1–2.3, 2.9, 3.1, 3.4 and states at its line 1217 that it defines nothing called a Faltings height. GrossZagierAndArithmeticHeights (#1487, order line 316) imports §§1.1–1.4, 1.8–1.10, 1.15. FaltingsFinitenessAndIsogenyTheorems (#1004, order line 140) imports §§2.0 and 5.1–5.4 and keeps R28.1.10–R28.1.13 (descent, Hermite–Minkowski, Satz 1) as its own, consistent with §6.6 here. ShimuraCompactifications (#1053, order line 143) imports §2.0 and §§5.0a–5.0b; since it is later in the order, the level-one principal Siegel compactification over `Spec ℤ` is correctly stated here as a target (the notion moves down; recorded as R04). Ownership against open pull requests not given to me as checkouts was checked only through `roadmaps grep`/`show`.

**Checks and worked examples recomputed**: every numerical Check in §§1.3–1.7, 1.10–1.15, 2.1–2.4, 2.7, 2.9–2.10, 3.1, 3.4, 3.6, 4.1–4.5, 5.0b, 5.7–5.9 and 6.1–6.5 (the table above lists the values); none refutes a theorem of its section, and the negative controls (conjugation condition, multiplicity, sign of Green functions, non-minimal model, raw Mumford coordinates, orthogonal matrix, extension twist) separate the stated definitions from the named wrong models.

## Not verifiable

- Faltings–Chai, *Degeneration of Abelian Varieties* (Springer 1990): the DOI resolves only to a paywalled page (recorded `uncertified`); every FC locator (I Def 2.3, Prop 2.7, Lemma 5.5; II–IV; V Props 2.1–2.2, Thm 2.3, Thm 2.5, Lemma 3.4, Defs 4.1–4.2, Rem 4.3, Props 4.4–4.6) is cited by locator alone. The statements attributed to it are corroborated where another source states them (Deligne, Szpiro, Faltings 1983, Pazuki).
- Demailly, *Complex Analytic and Differential Geometry*, Ch. II Thm 4.22 (analytic Nullstellensatz, §5.1): not fetched.
- Silverman, "Heights and elliptic curves" (Prop 1.1 and the bottom of p.256), reached only through gaudronremond14 lines 1899–1909; Tate's Theorem 4.2 (Néron lattice scaling), reached only through NeronModelsAndSemistableAbelianVarieties 6.9.
- The ten-digit agreement of §2.9's Check with LMFDB was checked to four digits by hand and against the LMFDB page value; I did not recompute `τ` to ten digits.

## Source issues

- **Misprint** in faltings83 at §2 Bemerkung d), p.351, and §3, p.354: the hermitian form on top forms is printed with the factor `(i/2)^g`, which is negative for `g ≡ 2, 3 mod 4`; it should carry `i^{g²}/2^g` (equivalently the absolute value Deligne uses); affects nothing (the degree uses the positive norm throughout).
- **Misprint** in gaudronremond14 at Lemme 7.9, proof, p.33: the lower bound for `|Δ(τ_σ)|` carries `(2π)^{−12}` although the discriminant in the displayed height formula is the lattice discriminant, for which the bound holds with `(2π)^{12}`; the stated inequality is weaker than the true one, so the constant 2.95 remains valid; affects nothing.
