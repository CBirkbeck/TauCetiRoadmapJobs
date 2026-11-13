# Review of PadicHodgeParametersInLocallyAnalyticRepresentations (pull request #2257 at c1ff167)

**Verdict:** needs changes

## R01 (P3) — The description omits the principal supplier

**Location:** pull request description, Dependencies paragraph and the `<!-- merge-order -->` block: "Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** The README's main supplier, LocallyAnalyticRepresentationsOfLocalGroups, is neither on main nor in an open pull request, and the description does not list it, so the quoted sentence is false at this head.

**Witness:** `TauCetiRoadmap/PadicHodgeParametersInLocallyAnalyticRepresentations/README.md:198` ("### From TauCetiRoadmap.LocallyAnalyticRepresentationsOfLocalGroups"); merge order line 255 (this roadmap: 262); no folder on main, no open pull request (index of 2026-11-13).

**Repair:** Replace the quoted sentence by: "LocallyAnalyticRepresentationsOfLocalGroups (§§0.9, 1.5, 1.7–1.9, 4.1, 6.1–6.2, 7.1–7.3, 8.1–8.14, 9.1–9.7, 10.1–10.7) is a prerequisite that is not on main and has no pull request yet; it precedes this roadmap in the merge order, and this pull request merges after it. LieHighestWeight is on main." Regenerate the merge-order block once that roadmap has a pull request.

## R02 (P3) — The description says the Lean states definitions and theorems; it states none

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** At this head `Suggested.lean` declares nothing, and its elaboration emits no warning; a reader must know that no headline theorem is stated in Lean.

**Witness:** `TauCetiRoadmap/PadicHodgeParametersInLocallyAnalyticRepresentations/Suggested.lean:10` ("At the pins none of them is statable, so the file states nothing"); lines 59–61 are an empty namespace; `lake env lean` on the file prints nothing.

**Repair:** Replace by: "`Suggested.lean` declares nothing: none of the eight headline results (Ding Theorems 3.21, 3.34, 3.36, Corollaries 3.25, 3.31, 3.37, Propositions 3.26, 3.27 and the kernel dimension) is statable at the pins, and its module docstring names the missing carrier for each" and "the targeted Lake build succeeds with no warning".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 endpoint families | n=3 w=(1 2 3); n=4, i=2, j=1,3 | w(3)=1, w⁻¹(3)=2; w_1=(2 4), w_3=(1 2), both in S_j×S_{n−j}; w_jw(n)∈{1,n} | holds | none |
| 0.3 spanning (sample) | n=3; n=1; n=3, d_K=1; H_char=ℤ, n=2 | coordinate i: v_n+Σ_{j≥i}(v_j−v_{j+1})=v_i; (c,c,c)+(a−b,0,0)+(b−c,b−c,0)=(a,b,c); 2+4+4=10≠6; (1,1)+(−1,−1)=0 | holds; DING25 (3.43) as printed fails (line 2189) | none |
| 0.4 presentation | n=1,2,3 | Ker R_D, Ker s_D: 0,0; 2+d_K both; 26, 27 (d_K=1); dim Ext¹_0=(n−1)(n·d_K−2)/2 = 1 at n=3 | holds | none |
| 1.1 coefficient c_n | n=0..5; recursion | c=0,0,0,1,5,16; c_{n+1}−2c_n=n(n−1)/2: 0,1,3,6; 2n misreading gives −1 at n=3 | holds | none |
| 1.2 gluing (sample) | n=2; sign (b,−b) vs (b,b) | DING25 lines 2136–2163: S′_{n−1}={w(n)=1}, (3.40)–(3.41), g→g′; supplier §9.7 first map b↦(b,−b); t_F(b)−t_G(b)=0 | holds, locators pp. 48–49, 44 correct | none |
| 1.3 all refinements | n=3, w=(2 3) | j=1: w_1=(2 3), w_1w=id; j=2: w_2=(1 2), w_2w: 3↦2↦1 ∈ S_start; left multiplication keeps the P_j-filtration | holds | none |
| 1.4 comparison theorem (sample, headline) | n=1; uniqueness; Q vs full Ext¹ | DING25 line 2084 (p. 48) states the factorisation through (3.38); README's Q is Ding's quotient by Ext¹_0 (line 156); n=1: t_D=κ⁻¹ζ⁻¹ | supported as written | none |
| 1.5 kernel dimension (headline) | K=ℚ_p, n=1..5; n=3, d_K=2 | (2,2,0),(5,5,0),(10,9,1),(19,14,5),(36,20,16); 17−15=2; DING25 line 2223 | holds | none |
| 2.2 push-forward (sample) | n=1, K=ℚ_p, line L=Eψ; n=3, K=ℚ_p | rank 2−1=1, cokernel Eψ since ψ∪a=0 iff a∈Eψ; Ext¹(A,𝒦⊗A) dim 1·4; row-independence gives a_j=0; DING25 line 2246 names only Lemma 3.5(2) | holds; negative control genuine | none |
| 2.4 characterisation (sample, headline) | n=2; split extension n=3; L⊂𝔈_{g′}; L≠𝒦_D | Π=V; socle A^{⊕2}; soc(Π_L/A)=A⊕V/A; ker f=L≠𝒦_D; DING25 lines 2258–2271 (p. 51) | supported; each condition excludes a model | none |
| 2.5 χ_D | n=3; λ_σ=(2,0), λ_τ=(5,1) | χ_Dε^{−N}=z^{|λ|−N}∏φ_i, |λ|_σ−N=Σ_i h_{i,σ}; exponent (2,6) not 8; DING25 line 2277 prints a double sum | holds; source misprint recorded | none |
| 2.6 characters (sample, headline) | n=2, h=(3,1) | λ=(3,2), λ+ρ=(7/2,3/2), e=(4,3) vs (5,21/4); s·h=(0,4), e_2=9/4; s·(3,2)=(1,4), +θ=(1,3); Jacobian det x_1−x_2 | holds; regularity needed (DING25 lines 2294–2296) | none |
| 3.1 parabolic induction (sample, headline) | P=B, G; n=3 (2,1); n=4 (3,1),(2,2) | kernels 0; t_D; c_2+c_1=0; c_3 d_K=d_K; 0; DING25 lines 2348–2367 (pp. 52–53), (2.20), (3.28) | supported | none |
| 3.3 one embedding (sample) | K=ℚ_p; general n | (n+2^n−1)−(n+n(n+1)/2)=c_n; Lemma 2.16 minus dim Ext¹_0 = n+n(n+1)/2; DING25 lines 2381–2405 (pp. 53–54) | supported | none |
| 3.5 embeddings (sample, headline) | n=3, d_K=2; K=ℚ_p | 1+1=2=c_3·2; 𝔈_σ∩𝔈_τ⊃𝔈_g of dim n; DING25 lines 2411–2427 (p. 54) | supported | none |
| 3.6 modified module (sample) | n=3, d_K=2, h_τ=(3,1,0); K=ℚ_p | D_{1,σ}: (0,0); own cutoff (1,1); k_τ=0−1=−1; T_σ=id; DING25 lines 2430–2465 (p. 55) | supported; cutoff remark consistent with supplier §10.5 | none |
| 3.7 minimal Ext (sample) | n=2, n=3 | 2+3=5; 3+7−1=9=3+6; DING25 lines 2467–2487 (p. 55) | supported | none |
| 4.1 embedded relation | n=3; general n | dim E⁻_F=n+2^{n−1}−c_{n−1}=n+1+n(n−1)/2=7; ℒ_Π: 14−9=5; unrestricted 20−9=11 | holds; (3.53)–(3.54) as printed cannot be bijective | none |
| 4.2 recovery (sample, headline) | n=3, a=2,3; n≤2 | normals (1,−1,1), (1,−1,2); dot products 0; diag forces x=y, (x,2x,z)∦(1,3,1); diag(1,1,1/2)·(1,2,1)·(1,−1,2)=0; DING25 lines 2490–2529 (p. 56) | supported; source's if/only-if labels swapped | none |
| 5.1 Artinian algebras (sample) | n=3, d_K=1; n=2, K=ℚ_p; p=2 | fibre product cotangent = (Ext¹/Ext¹_0)^∨; dims 10, 7, 3, 11; tangent 4 and 2; |2p|=1/4<2^{−1}; DING25 lines 2533–2572 (pp. 56–57) | supported | none |
| 5.2 universal extensions (sample) | radical x,y on U_w | x∘y=0; quotient 𝔈⊗A contracted by Q^∨; DING25 lines 2573–2598 (pp. 57–58) | supported | none |
| 5.4 universal action (headline) | uniqueness; (3.58) | U=ΣU_w since Σ𝔈_w=𝔈; final term of (3.58) printed with subscript w (line 2610) | supported; misprint recorded | none |
| 5.5 annihilator (sample, headline) | n≤2; n=3, K=ℚ_p; U/𝔪U | U[𝔪]=V; U[𝔪]/V=A vs U/V=A^{⊕10}; (i∘j∘p)²=0; 𝔪U=socle A; DING25 line 2619 (p. 59) | supported | none |

- Source locators checked against the text: 34 in DING25 (all of §3.2, pp. 47–59, plus §2.1 pp. 9–10, §3.1.1–3.1.2 pp. 33–34, Propositions 2.5, 2.12, 3.13, Lemma 2.11, Corollary 2.38, the paragraph after (3.30)) and 1 in CEGGPS16 (Lemma 3.22, line 1921, p. 47); all correct.
- Library declarations opened at the pins: `TauCeti.hcProjection` (`TauCeti/Algebra/Lie/HighestWeight/CentralCharacter/HarishChandra.lean:437`, under `[IsKilling K L]`, line 88), `TauCeti.vermaCentralCharacter_eq_lift_cartanProjection` (same file, 403), `LinearMap.finrank_range_add_finrank_ker` and `Submodule.finrank_sup_add_finrank_inf_eq` (`Mathlib/LinearAlgebra/FiniteDimensional/Lemmas.lean:173`, `:53`), `CategoryTheory.Abelian.Ext.covariantSequence` (`Mathlib/Algebra/Homology/DerivedCategory/Ext/ExactSequences.lean:141`), `Ext.comp` (`…/Ext/Basic.lean:128`), `extClass` (`…/Ext/ExtClass.lean:76`).
- Cross-roadmap citations resolved: every cited section of TriangulineVarietyAndItsLocalModel (§§10.1–10.8, 11.1–11.8, 12.1–12.7, 13.8, 13.13, 13.14, 13.16), PhiGammaModulesAndIwasawaCohomology (§§1.0, 1.2, 7.1–7.4, 7.2a), PadicHodgeTheory (§§4.5, 5.2), LocalGaloisDeformationRings (§§0.4, 1.23), SmoothRepresentationsOfLocalGroups (§SR.3.2) at their open heads, LieHighestWeight Layers 3, 4, 5, 7, 9 on main, and LocallyAnalyticRepresentationsOfLocalGroups (39 sections) in its board package, the only place it exists (R01). Dimensions and conventions agree: supplier §8.12 (n+(2^n−1)d), §8.14 (n, n+d, n(1+d)), §9.7 (b↦(b,−b)), §10.5–10.7, Trianguline §11.4 (1−n+dn(n−1)/2), §13.14 (14=9+5).
- Declared gap `principal-series-bernstein-completion`: same slug in the plan and in the README; supplier named; SR.3.2 at its head is over complex coefficients and has no completion, so nothing already provided is requested.
- Gate: every check passed. Dependency check output: `depcheck: 211 roadmaps, 1914 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, no output. It has no declaration, so the one-tactic probe and the `#check` comparison have nothing to test; the eight headline groups of the README are each named in the docstring with the missing carrier; the statable Layer 0 and §1.1 combinatorics are not headlines and are rightly absent.
- Overlap check: read TriangulineVarietyAndItsLocalModel, CompletedCohomologyAndLocalGlobalCompatibility, PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings, PhiGammaModulesAndIwasawaCohomology; nothing shared (the first, fourth and fifth are suppliers, cited by section); a search of main and the open heads for π_min and t_D found no other owner.
- Source independence: 24 passages compared with 2 sources, none shared; largest share DING25, 21 of 22 page-bearing locators; contents compared with DING25 (§3.2.1 ↔ Layers 0–4, §3.2.2 ↔ Layer 5, not one to one; the order 1.4 → 2.1 → 3.1–3.7 → 4.1–4.2 and 1.4, 2.1 → 5.4–5.5 is forced by the *Needs:* lines): independent.

## Not verifiable

- LocallyAnalyticRepresentationsOfLocalGroups has no head on main or in a pull request; its sections were read in the board package, whose numbering may still change.
- Two entries of the README's Source corrections (the sign in the proof of Corollary 2.14, p. 19; the index sets of (3.12), (3.15), (3.33)) lie outside the sample and were not compared with the text this round.

## Source issues

- **Error** in DING25 at (3.43), proof of Theorem 3.21, p. 49: the source says the character space of T(K) is the direct sum of the Levi-centre and centre character spaces; it should be their (non-direct) sum, dimensions (2n−1)(1+d_K) against n(1+d_K); affects nothing.
- **Misprint** in DING25 at the definition of χ_D before Proposition 3.26, p. 51: the source says the exponent |λ| is one sum over i and σ; it should be the tuple indexed by σ of the sums over i; affects nothing.
- **Gap** in DING25 at the paragraph after (3.45), p. 50: the source says surjectivity of f_D follows from Lemma 3.5(2); it should also invoke Lemma 3.23, since for a line inside the self-extension image the push-forward is not onto; affects the proof.
- **Gap** in DING25 at the proof of Proposition 3.26, p. 51: the source says the invariants inclusion is bijective on tangent spaces because the invariants are polynomial; it should use regularity of h (nonvanishing Vandermonde); affects the proof.
- **Misprint** in DING25 at the proof of Theorem 3.34, first paragraph, p. 56: the source says Corollary 3.32(1) gives "only if" and the induction "if"; it should be the reverse; affects nothing.
- **Misprint** in DING25 at the proof of Theorem 3.34, after (3.54), p. 56: the source says the relation obtained after replacing D_σ by D′_σ is that of D_σ; it should be that of D′_σ; affects nothing.
- **Error** in DING25 at (3.53)–(3.54), proof of Theorem 3.34, p. 56: the source says the middle terms are the full σ-Ext groups into π⁻ and π⁺; it should be the images of the parabolic σ-Ext groups, as in (3.52) (at n = 3: 20 against 14); affects the proof.
- **Misprint** in DING25 at (3.58), proof of Theorem 3.36, p. 58: the source says the operator ends in the w-universal extension; it should end in the full universal extension; affects nothing.
- **Misprint** in DING25 at the proof of Lemma 2.11, p. 16: the source says the last graded parameter has algebraic factor with weight h_1; it should be h_n; affects nothing.
- **Misprint** in DING25 at the definition before Corollary 2.38, pp. 31–32: the source says the relation's third argument is D_{2,σ}; it should be C_{1,σ}; affects nothing.
- **Error** in DING25 at the paragraph after (3.30), p. 43: the source says the endpoint inductions carry ε on the rank-(n−1) block of F and ε^{n−1} on the character of G; it should be ε^{n−1} on the character of F and ε∘det on the block of G; affects nothing.

## For the human reviewers

- Scope: every target is located in one article, DING25 (Publications Mathématiques de l'IHÉS 142, 2025, refereed, open access on Centre Mersenne); the only other reference is CEGGPS16, for the supplier contract (`README.md:1517–1524`).
- Merge readiness: the principal supplier LocallyAnalyticRepresentationsOfLocalGroups exists only as a board package whose latest review is `needs_changes`; this roadmap cites 39 of its sections (`README.md:198–248`).
- Layer 5 depends on the declared gap `principal-series-bernstein-completion` in SmoothRepresentationsOfLocalGroups §SR.3.2, which at its open head treats complex coefficients only (`README.md:324–335`).
