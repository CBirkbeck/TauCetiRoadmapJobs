# Review of CrystallineCohomologyPartII (pull request #2265 at 8bd69be)

**Verdict:** needs changes

## R01 (P2) — Two subjects the parent assigns to this Part II are disowned and left without an owner

**Location:** `TauCetiRoadmap/CrystallineCohomologyPartII/README.md` line 11: "Convergent-coefficient descent and Cartier transforms of periodic connections, which the same sentence of the parent lists beside them, are not part of this roadmap."

**Claim:** The parent hands four subjects to this roadmap; this text declines two and names no roadmap for them, so neither has an owner, and Scope and ownership leaves work to no named roadmap.

**Witness:** CrystallineCohomology (open, #857 head), `README.md` lines 192–193: the four subjects "are the subject of CrystallineCohomologyPartII". `roadmaps grep -i 'Cartier transform'`: no owner (PCurvature line 53 lists it as a consumer's topic).

**Repair:** Make the two texts agree with one owner each. Either add the two subjects as layers here, or replace line 11 by a sentence naming the owning roadmap and section of each (for convergent coefficients, PadicDifferentialEquationsAndRigidCohomology §RD.5.110 if that is the object meant) and change the parent's sentence at its line 192 to the same owners.

## R02 (P3) — Three Checks restate their statement

**Location:** `README.md` line 448 (§1.3): "When Z is a point of a surface Y, the construction recovers a finite universal homeomorphism Y′ → Y that is an isomorphism away from Z"; line 558 (§2.1, second Check); line 517 (§1.6, second Check).

**Claim:** Each holds for every input by the statement it tests (API bullet 2 of §1.3; §2.1 (i); §1.6 itself), computes no value and excludes no wrong model.

**Witness:** §1.3, line 429: "The map Y′ → Y is finite and a universal homeomorphism, an isomorphism over Y ∖ Z" already asserts line 448 for all Y, Z. Line 558 is §2.1 (i) with "finite" read as "finite of degree 2".

**Repair:** Delete lines 517 and 558. Replace line 448 (and its copy at line 523) by: "For the cusp Y = Spec k[t², t³] and J = (t², t³): X = Spec k[t], E = Spec k[t]/(t²), and B′ = k[t] ×_{k[t]/(t²)} k = k + t²k[t] = A, so Y′ = Y although X → Y is finite and not an isomorphism; taking H^0(E, O_E) in place of A/J would give B′ = k[t] and Y′ = X."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §0.8 finiteness and slopes (sample) | P¹; ordinary and supersingular E; p-torsion bound | H¹(P¹,WO)=0; rank 1 slope 0, rank 2 slope ½; M[pⁿ] ascending chain in Noetherian W_σ[[V]] stabilises | agrees with BBE07 line 618, GNT19 line 689 | none |
| §1.2 derived self-products (sample) | k ⊗ᴸ_{k[t]} k | π₁ = Tor₁ = k; π₁W(R) = ∏_ℕ k, F = 0 on it; both sides W(k) | agrees with BS17 lines 2403–2414 | none |
| §1.3 finite pushout | J principal; Bl₀A²; cusp, J=(t²,t³) | B′ = A; k[x,y] ×_k k = k[x,y]; k + t²k[t] = k[t²,t³] | K ⊂ √(JB′) since H⁰(X,JᵐO)=Jᵐ, m≫0 | R02 |
| §1.4 excision with base change T (sample) | Y=A², X=Bl₀, T=X, n=1; pasting for n≥2 | X×_YT: k[x,v₁,v₂]/(x(v₁−v₂)); RΓ(X)→RΓ(X)⊕K→K; E×_YX^{n−1/Y}=E^{n/Y} | fibre sequence; BS17 Lemma 11.45 is T=Y (lines 2419–2451) | none |
| §1.5 h-descent (sample) | d=0; xy=0 with its two lines; T=Bl₀A² | fields: fppf; blowup of node = two lines, X₁=Y₁; b_T reducible, dim T = 2 = d | induction only on E→Z, dim Z<d (no component of Y in V(J)) | none |
| §2.1 Witt ideal vanishing (sample) | canonical cone g≥3; Bl₀A² | R¹f_*(I′) ⊇ H¹(C,ω)=k; ⊕H¹(P¹,O(m+r))=0 | hypothesis R^qf_*O=0 over U is CR12 4.6.1 (line 4273); BBE07 2.4 assumes finite (line 348) | R02 |
| §2.2 exceptional locus (sample) | cone over E ordinary / supersingular | R¹ = H¹(E,WO_ℚ): dim 1 slope 0; dim 2 slope ½ | agrees with CR12 lines 4301–4312 | none |
| §2.6 proper hypercover descent (sample) | split node, N=1 and N=2; y²=x²(x−1) over F₃ | C⁰=K, C¹=K³, d⁰=0; N=2: a=0, b+c=0, H¹=K; −1 nonsquare, 5 = q+2 points | range q<N essential; BBE07 lines 722–734 | none |
| §3.2 Witt realization (sample) | Spf ℤ_p, F=id; ℤ_p[t], φ(t)=t^p | P(J_n)=ℤ/pⁿ → W_n(F_p) identity; s_φ(t)=[t], ghosts t^{p^i} | agrees with BBE07 lines 943–948 | none |
| §4.2 pushforward (sample) | point ↪ P¹ (r=−1); Frobenius of A¹ | f_*f^*(1)=ĉl(x), bidegree (1,1); F_*F^*=p | degree formula needs equal dimension (CR11 line 562) | none |
| §4.3 cycle classes (sample) | D=V(t) ⊂ A¹, c=1 | class of −dt/t ≠ 0 in k[t,t⁻¹]dt/k[t]dt; image c₁(O)=0 | sign (−1)^c as CR12 (2.4.1), line 1940 | none |
| §4.5–4.6 correspondences | [P¹×x], [x×P¹]; point in P¹; two points | 0 on H⁰, α↦(∫α)ĉl(x); id on H⁰, 0 on H¹(Ω¹); degree 1; diag(1,0) | sum is [Δ]; positive codimension, not "proper closed" | none |
| §5.7 singularity complexes (sample) | S smooth; cone over E | WS₀ = WO_ℚ; H¹(WS₀) = H¹(E,WO_ℚ) ≠ 0 | agrees with CR12 lines 4137–4144 | none |
| §5.12 CH₀-trivial fibrations (sample) | P¹→Spec k; Pⁿ_Y→Y; identity; blowup of a point | R¹f_*Wω=W(k)_ℚ=H⁰(WS₀,k); Rⁿ=Wω_Y(−n); r=0 unshifted | (i) is CR12 4.8.1; printed Wω form gives W(k)_ℚ≅0 | none (see Source issues) |
| §6.7 ample divisor (sample) | P¹, D a point | (a): 0→0; (b) vacuous; 1/(1−t)=1/(1−t)·1 | agrees with BBE07 lines 1498–1506 | none |
| §6.10 universal CH₀-triviality (sample) | ∅; Spec F_{q²}; P¹, deg-2 point y | CH₀=0, no degree ≠0; [p₁]−[p₂] not torsion; deg[y]=2, [y]−2[x]~0 | height-0 points are closed, residue degree finite | none |
| §6.13 Witt vanishing (sample) | Pⁿ; hypothesis vs ESN03 | H^{2j}_crys slope j ≥ 1; ESN03 line 53 assumes CH₀ over the closure of k(X) equal to ℤ | route through §5.12 (i) needs only ⊗ℚ, all L | none |
| `card_rationalPoints_modEq_of_cohomologyPullback_bijective` (§6.4 (ii)) | X=Y=∅; X=∅≠Y; fold P¹⊔P¹→P¹; blowup of a point | 0≡0; H⁰(Y)→0 not injective; H⁰ not onto, q+1≢0; difference q | BBE07 Cor 1.6, lines 195–198 | none |
| `card_projectiveZeroLocus_modEq_one` (§6.6) | r=0; n=0; x²−ay² in P²; F=1; zero polynomial | 1+q+…+qⁿ; 1 point; 1 point; 0≢1 (excluded by d_j≥1); drop it | affine count 1+(q−1)N ≡ 0 gives N ≡ 1 | none |
| `card_dvd_card_solutions_of_sum_lt` | s=∅; σ=∅; nonzero constant; ternary form over F₉ | q^{\|σ\|}; 0<0 false; 0 zeros; 81 | not in Mathlib (only `char_dvd_…`, line 110) | none |
| `IsThetaDivisor`, `card_thetaDivisor_modEq` (§6.9) | dim A=0; E with P; 2P vs P+Q; I=O_A, g≥1 | Θ=∅, 0≡0; 1≡1; h⁰=2, counts 1,2; O_A not ample | dual, not ideal, carries h⁰=1 | none |
| `card_rationalPoints_modEq_one_of_universallyCH0Trivial` (§6.14 (i)) | y²=x³+x+1/F₅; y²=x³−x/F₃; Spec F_{q²} | 9≡4; 4≡1 (converse fails); 0 points | hypothesis not implied by the congruence | none |
| §6.3 Ax criterion (headline, not statable) | 1/(1−qt); 1/(1−t); slopes ½ | N_r=q^r ✓; N_r=1 ✗; v(N_r)≈r/2 ✗ | (i)–(iv) as BBE07 lines 1490–1494 | none |
| §6.8 Bockstein vanishing | g=0,1; E₁×E₂ in characteristic 2 | boundary 0; mixed component a₁⊗a₂+a₂⊗a₁ ≠ 0 | ∧²→⊗² injective in every characteristic | none |
| Scope, line 11 | parent line 192 | four subjects assigned, two declined | no owner | R01 |

- Source locators checked against the text: 61 (BBE07 27, CR12 19, BS17 7, GNT19 9, NT20 2, ESN03 4, HW23 1, Tan18 2, CR11 3, Ser58Top 1, EGAIII1 1, Stacks 0FH6); all at the stated place, except that Proposition 3.3.1 of EGAIII1 sits on printed p. 118 only.
- Library declarations opened at the pins: 12 line numbers cited by the README, all exact (Mathlib `Identities.lean` 43, 102, 141; `Basic.lean` 263; `Frobenius.lean` 283; `ChevalleyWarning.lean` 110; Tau Ceti `FlatBaseChange.lean` 185; `MittagLeffler.lean` 104, 113, 191; `UniversalHomeomorphism.lean` 64, 162), and `Chow/Basic.lean` 70, 86, 257, `LineBundle/Ample.lean` 71, `EffectiveCartierDivisor/Basic.lean` 78.
- Cross-roadmap citations resolved: 21 names and 20 sections of SchemeAndStackFoundations, 8 names of EnhancedDerivedSheaves, AdicSpacesPartIII §F0.6, EtaleCohomologyFoundations §G.2, JacobianChallenge Layer C on main; 15 CrystallineCohomology targets, 23 §RD sections, and the cited sections of six further open roadmaps at their heads. None missing.
- Declared gaps: four, same slugs in the plan and the README; SchemeAndStackFoundations §0.26 is finite type and one composite, §1.17 projective, §4.12 integral bases, §2.6 has no Künneth; no pinned or planned statement supplies any of them.
- Dependency check: `depcheck: 221 roadmaps, 1962 edges, 0 problem(s)`. Gate: every check passed. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`, five `sorry` warnings and nothing else. `#check` of the nine signatures against the README: no binder lost. One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp_all`, `trivial`) fails on all five theorems; `exact?` finds no library proof of the affine form.
- Pull request text read against the head: no sentence contradicted; the nine roadmaps of the depends-on block are the nine open suppliers the README cites.
- Overlap check: read CrystallineCohomology, PadicDifferentialEquationsAndRigidCohomology, ArcTopologyAndDescent, SchemeAndStackFoundations, EnhancedDerivedSheaves; Witt schemes and the slope decomposition: CrystallineCohomology; rigid cohomology: PadicDifferentialEquationsAndRigidCohomology; h-site and universal descent: ArcTopologyAndDescent; simplicial Witt vectors, derived fibre products and inductive level (BS17 Lemma 2.6): EnhancedDerivedSheaves; Witt vector cohomology, WO-rationality and the point counts: this roadmap; convergent-coefficient descent and Cartier transforms: no owner (R01).
- Source independence: 24 passages compared with 9 sources, none shared beyond terms of art (longest common run 7 words, CR12 line 3703); largest share CR12, 102 of 280 locators; contents compared with CR12: independent (Layer 4 merges its §§1–3, Layer 5 splits its §4 and its §4.6 is in Layer 2; the order of §§5.1–5.6 is forced by their *Needs:* lines).

## Not verifiable

- Stacks tags 02RH and 0BED: the cached text holds only the chapter with 0FH6, and the site could not be fetched from this worker.
- Eke84, EkeII, Kol96, Tsu03, Tsu04, Ser58, Ax64, BS83: settled as uncertified, cited by locator only.
- §5.12 (ii) in its shifted form is printed by no source; it was checked on the four instances of the table, not re-derived from the proofs of CR12 Proposition 4.8.4 and Theorem 4.5.6.

## Source issues

- **Gap** in BS17 at the proof of Proposition 11.41, p. 53: the source says the pushout of the blowup along the map from the exceptional divisor to its image is taken, with no construction although that map is not finite; it should be built as the spectrum of the fibre product of global sections, finite over the base; affects the proof.
- **Gap** in BS17 at the proof of Proposition 11.41, pp. 53–54: the source says descent for one proper surjection is shown by induction on the dimension of its target; it should be universal descent, since the reduction by Lemma 2.10 needs every base change and a base change of a blowup is not one; affects the proof.
- **Error** in GNT19 at Lemma 2.20, p. 16: the source says higher direct images of Witt ideal sheaves vanish above the fibre dimension for any morphism of separated schemes of finite type; it should be for proper morphisms (the punctured plane has a nonzero first direct image); affects a stated result.
- **Misprint** in GNT19 at Proposition 2.23, p. 18: the source says the ideal of the structure sheaf of the source is a sheaf on the target; it should be on the source; affects nothing.
- **Error** in CR12 at Proposition 2.3.4, p. 40: the source says pushforward after pullback is the degree for every finite morphism of connected smooth schemes; it should be for those of equal dimension, as in CR11 Theorem 1.2.3 (1); affects a stated result.
- **Error** in CR12 at Theorem 4.8.1, p. 96 (also Theorem 5, p. 6, and (4.8.4), p. 97): the source says positive-degree direct images of the Witt canonical sheaf match positive-degree cohomology of the singularity complex; it should be degree i against degree i minus the relative dimension, as the projective line shows; affects a stated result.
- **Gap** in NT20 at Lemma 2.17, p. 13: the source says the fibres over maximal ideals are single points with trivial residue extension and concludes for all fibres; it should add the passage from closed points to all points; affects the proof.

## For the human reviewers

- **Scope.** `README.md` §§1.3–1.5 and §5.12 (ii) state results in a form no cited source prints (a constructed pushout and universal descent for BS17 Proposition 11.41; a degree-shifted form of CR12 Theorem 4.8.1).
- **Licence.** Ser58Top was read from a copy of the whole proceedings volume on a third party's university page; its status was not settled.
