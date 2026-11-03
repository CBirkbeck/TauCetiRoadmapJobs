# Review of K3Surfaces (pull request #1285 at 771182d)
**Verdict:** needs changes

## R01 (P2) — One producer for the holomorphic Picard comparison

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:14–17` ("Section 1.1 owns the holomorphic frame-torsor identification…") and `README.md:191–211` (the construction of Pic_hol(M)≃H¹(M,O_Mˣ) with its inverse by gluing).

**Claim:** The same general construction, on every complex manifold, is planned in two open pull requests of the same author, and a third open roadmap assigns it to a third place. Nothing on main owns it. "What another roadmap plans is imported, never planned again" is violated in whichever direction the pull requests merge: if the ComplexKahlerGeometry revision merges first, §1.1 re-plans a section on main; if this pull request merges first, that revision re-plans §1.1 while naming §1.1 as its consumer.

**Witness:** `TauCetiRoadmap/ComplexKahlerGeometry/README.md:580–609` at the open revision (same author) is "K4.P. Holomorphic Picard groups and the exponential comparison": it owns, on every complex manifold, the frame torsor, the gluing inverse, the group isomorphism with tensor, dual and pullback laws, and states that "K3Surfaces 1.1 … consume this construction rather than restating it". `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:202–204` at its open head declares the same object as a ComplexKahlerGeometry contract, `gap:integral-topology`. Main's ComplexKahlerGeometry K4 (`README.md:444–567`) has holomorphic bundles, section sheaves and cocycle gluing but no Pic/H¹ comparison (searched for "frame torsor", "Pic_hol", "K4.P": no hit).

**Exact repair:** Keep one producer, and since ComplexKahlerGeometry and ComplexComparisonPartII are earlier in the merge order than this roadmap, that producer is the supplier side. In §1.1 replace the construction (`README.md:191–211`) by a stated supplier contract under "From the named roadmaps": "What ComplexKahlerGeometry must provide (gap:integral-topology): for every complex manifold M, the frame-torsor group isomorphism Pic_hol(M)≃H¹(M,O_Mˣ), its inverse by gluing rank-one bundles along transition units, and the trivial-line, tensor, dual, pullback and refinement laws" (the slug K3SurfacesAndSymplecticBoundedness already uses, so one announcement serves both). Keep here what is K3-specific: the exact segment `README.md:213–224`, the six Checks, and the §3.1 consumer (`README.md:367`, `README.md:404–406`), each now citing that contract. Change `README.md:14–17` to say that Section 1.1 consumes the comparison and owns only its K3 applications. Register the slug in the package plan when one exists. The alternative, deleting K4.P from the ComplexKahlerGeometry revision and having it and ComplexComparisonPartII C5.4 cite §1.1, would make two earlier roadmaps cite a later one and is not available.

**Repair test:** `roadmaps grep 'Pic_hol'` must show one construction (with an inverse) and consumers only. The O(1)↦+1 and elliptic-curve kernel Checks keep their values under the contract.

## R02 (P2) — The pencil step of K0.A uses an unnamed input: unirational K3 surfaces have ρ=22

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:154` ("Produce from the vector field a primitive nef divisor D₀ with D₀²=0 and the associated relatively minimal genus-one pencil… In particular it cannot assume Picard rank at least five") and `README.md:163–169` (the *Needs:* line).

**Claim:** The route from a nonzero vector field to a genus-one pencil with at least two singular fibres is claimed to be proved "with its invariant-function, divisor, Riemann–Roch and resolution proof" from AlgebraicCurves, JacobianChallenge, StableReduction and SchemeAndStackFoundations. Those inputs reach "X is unirational" (the quotient by a p-closed derivation and the canonical-divisor formula). The only route in the literature from there to a pencil is: unirational ⇒ ρ(X)=22 (Shioda), ρ≥5 ⇒ an isotropic class in NS (Meyer), isotropic nef primitive ⇒ genus-one fibration, then the fibre analysis. The first step needs ℓ-adic étale cohomology with cycle classes, π_*π^*=deg on H²_ét(X,ℚ_ℓ(1)) and b₂(X)=22; the second needs an isotropy theorem for indefinite lattices. No layer, no *Needs:* entry and no supplier names them, and the sentence forbidding the assumption of ρ≥5 does not say how ρ is bounded below.

**Witness:** `huybrechts-k3 line 6947` through 6953 (printed p.184, §9.5.1): the positive-characteristic proof first reduces to unirational K3 surfaces, then "evokes" Proposition 17.2.7 (ρ=22), then "K3 surfaces of Picard number ≥5 are all elliptic", then the elliptic case. `huybrechts-k3 line 14080` through 14090 (Proposition 17.2.7, printed pp.367–368): the proof is Shioda's, by injectivity of π^* on H²_ét(X,ℚ_ℓ(1)) with π_*∘π^*=deg(π), applied to ℙ²→X. `martin line 1714` through 1716 (printed p.40): the proof of Corollary 1.1 takes the pencil with at least two singular fibres from [RS83, p.1502] and the sentence at `martin line 142` through 144 (p.4) says that step is about supersingular K3 surfaces. The *Needs:* line `README.md:163–169` names no étale-cohomology supplier; EtaleCohomologyFoundations §0.9 and F.6 (main, `README.md:1120`, `README.md:1200`) are the earlier owners of cycle classes and Gysin maps.

**Exact repair:** Make the pencil lemma's inputs explicit at `README.md:154` and `README.md:163–169`: (i) a sub-target "a unirational K3 surface over an algebraically closed field has ρ(X)=22", with *Needs:* EtaleCohomologyFoundations §0.9/F.6 for the cycle class map, pullback and pushforward with π_*π^*=deg, and the supplier of b₂(X)=22 (ℓ-adic Euler characteristic 24 with b₁=0 from H¹(O)=0, or cite the owner); (ii) the isotropy input for an even indefinite lattice of rank ≥5 (cite IntegralLattices if it states Meyer's theorem, else state it as a target with its source); (iii) the Riemann–Roch step "a primitive nef class with D₀²=0 on a K3 moves in a pencil" (Huybrechts draft Chapter 2 §3.10 or the Riemann–Roch of §0.1); (iv) the smooth-generic-fibre and two-singular-fibre statements as the K0.A targets already listed. Replace "cannot assume Picard rank at least five" by "proves ρ(X)=22 from unirationality rather than assuming it".

**Repair test:** The Fermat quartic in characteristic 3 is unirational (Shioda) and has ρ=22; a very general quartic in characteristic 0 has ρ=1 and no vector field, so the lemma's hypothesis is used and the sub-target does not claim ρ=22 for every K3.

## R03 (P3) — The b₁=0 route names an undefined input; the exponential sequence already gives it

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:252` ("prove b₁=0 using the degree-one de Rham/Dolbeault comparison and the surface identities").

**Claim:** "The surface identities" is not a defined term and no supplier owns the compact-complex-surface theorem behind it (holomorphic one-forms are closed and b₁=h¹⁰+h⁰¹ when b₁ is even, h⁰¹=h¹⁰+1 when odd). Main's ComplexKahlerGeometry K8 proves E₁-degeneration only in the compact Kähler case (`README.md:1542`). The conclusion follows from an input §1.1 already consumes: the exponential sequence gives H⁰(O)→H⁰(Oˣ) surjective on a compact connected surface, hence H¹(X,ℤ)↪H¹(X,O)=0, so b₁=0.

**Witness:** `huybrechts-k3 line 452` through 458 (printed p.15, §1.3.2) derives H¹(X,ℤ)=0 from the exponential sequence and H¹(X,O)=0; the Frölicher degeneration for surfaces is invoked separately at `huybrechts-k3 line 488` through 492 (p.16) only for h¹⁰.

**Exact repair:** Replace the clause at `README.md:252` by "prove b₁=0 from the exponential sequence of ComplexComparisonPartII C5.4: H¹(X,ℤ) injects into H¹(X,O)=0 (Huybrechts draft §1.3.2, p.15)", and drop "the surface identities".

## R04 (P3) — Locator for the polarized period image

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:602–603` ("the polarized image is §6.4, pp.114–118").

**Claim:** The description of the complement of the polarized period image as the union of the root hyperplanes δ⊥ with δ∈Λ_d, δ²=−2, is Remark 6.3.7 on p.114, in §6.3; §6.4 (from p.115) constructs the moduli space M_d via Borel's theorem.

**Witness:** `huybrechts-k3 line 4232` through 4247 (Remark 3.7, p.114) and `line 4248` (the §6.4 heading).

**Exact repair:** Write "(Huybrechts draft Remark 6.3.7, p.114, and §6.4, pp.115–118 for the quotient)".

## R05 (P3) — Style

**Location:** `TauCetiRoadmap/K3Surfaces/README.md:365, 367, 428, 644` (numbers glued to words: "dimension20", "smooth19-dimensional", "degree2", "complex20-fold", "order2¹⁰ and exponent2"); `README.md:640` and `README.md:765` begin with a stray space; `README.md:20` ("The retained gluing theorem") uses process vocabulary.

**Exact repair:** Insert the spaces, remove the two leading spaces, and write "The gluing theorem".

## Previous findings

- R01 (duplicate owner of the holomorphic Picard comparison) — not repaired: the folder is unchanged since the head the previous review read (`changes.md`: 0 changed lines). The duplication is confirmed with the three witnesses above, and the repair is now stated in the direction the merge order allows. Carried as R01.
- R02 (add `sources.toml` to the folder) — not re-raised: its premise is false. No roadmap folder on main carries a manifest (0 of 124 folders), the gate's `stray-files` rule would reject one, and the manifest the tooling reads is the board package's. The author owes nothing here; the citations were verified against the cache texts below.

## Verified sound

Independent AI review, a full review at head `771182da41ca6e86f0fbd83490e6b2198c4ebefc`. I read the normative README and CONTRIBUTING, main's ComplexKahlerGeometry, SchemeAndStackFoundations, IntegralLattices, MorseNovikov and EtaleCohomologyFoundations where cited, the two files under review, and the pull request text as data. The diff outside the folder is empty. No repair report marks a finding "not actionable in this package".

**Gate.** The worker's gate at this head passed every check (`gate.md`). I reran the prescribed dependency check with the candidate merge order and the content checkout; it returned

```text
depcheck: 204 roadmaps, 1652 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `TauCetiRoadmap/K3Surfaces/Suggested.lean` exits 0 with exactly the two `declaration uses sorry` warnings (lines 51 and 74). Imports are `import Mathlib` plus five `TauCeti.*` modules that exist at the pin; no `set_option`, no sorry'd data, `theorem` throughout.

**Signatures.** A scratch copy with `#check @` for all four declarations elaborated. `IsAlgebraicK3` keeps `[Field k] [IsAlgClosed k]` and `[X.Over (Spec k)]`; the vanishing theorem keeps `[CharP k p]`, `2 < p`, the structure morphism and `IsAlgebraicK3 k X`, and concludes `Subsingleton (Cohomology (relativeDifferentials k X) 0) ∧ Subsingleton (relativeDifferentials k X ⟶ unit)`; the gluing theorem keeps both `IsNondegenerate` instances, `IsEven` for both lattices, the anti-isometry equation on `discriminantQuadraticMap`, the form and carrier equations and the pair of isometries. Each matches its README statement (`README.md:110–113`, `README.md:152`, `README.md:646–655`); no binder was lost.

**One-tactic probe.** On a scratch copy each `sorry` was replaced by `first | simp | rfl | infer_instance | sorry`; both theorems still fell through to `sorry` (two warnings, exit 0). Neither restates a definition, mirrors a Check or computes a value. The gluing theorem is not a restatement of the pinned naturality theorem `Isometry.discriminantSubgroup_intermediateCarrierEquiv` (TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Naturality.lean:190), which transports a carrier along one isometry and has no product isometry, graph or `∃!`.

**Headline coverage.** README headlines: K0.A vanishing (stated); Kählerness, Hodge diamond, integral (1,1) and projectivity; Ricci-flat existence and uniqueness, simple connectivity and the cup lattice; 20- and 19-dimensional deformations; local Torelli, the Pic=0 cone and twistor continuation; period surjectivity, strong Torelli, monodromy, the Kähler-cone theorem and the polarized image; the gluing criterion (stated); free-involution realization, the fixed-locus classification and the free/nodal loci. At the pins there is no holomorphic line bundle on a complex manifold, no Picard group of a ringed space and no exponential sequence: searched Mathlib and Tau Ceti for "holomorphic line bundle", "exponential sequence", `Pic`; only `CommRing.Pic` (Mathlib/RingTheory/PicardGroup.lean:429) and `holomorphicSheaf` on ℂ (TauCeti/Analysis/Complex/HolomorphicSheaf.lean:139,180) exist. The module docstring names each unstatable headline and its missing carrier. No stand-in is written.

**Source sample.** Every sampled section and every flagged locator was opened in the cache text (`huybrechts-k3` page markers coincide with printed pages).

| Target | Text opened; result |
| --- | --- |
| 0.1 | `huybrechts-k3 line 135` through 148 (Def 1.1, Remark 1.2, p.7): K3 definition, contraction T≃Ω, projectivity of smooth complete surfaces. `line 160` (Example 1.3, p.8). `line 373` through 375 (p.13): Noether c₂=24. Supports the statements. |
| 0.2 (K0.A) | `martin line 126` through 133 (Theorem D, p.3), `line 140` (Cor 1.1, p.4), `line 1713` through 1718 (proof, p.40), `line 1544` through 1577 (Example 5.12, pp.36–37). `gounelas-liedtke line 253` through 258 (Prop 2.2(2), p.6): H⁰(Ω¹)=0 in every p>0. Theorem D alone has the elliptic-fibration hypothesis, as the README says. Missing input: R02. |
| 1.1 | `stacks-09nu line 217` through 246 (Lemma 20.6.1): H¹(Oˣ)=Pic for ringed spaces with local stalks. `huybrechts-k3 line 452` through 464 (§1.3.2, pp.15–16, (3.1)); `line 498` and 515–517 (p.16, (3.2) and footnote 9); `line 420` through 431 (Prop 3.2, p.14); `line 432` through 446 (Example 3.3, pp.14–15); `line 4890` through 4900 (§7.3.2, p.131). Ownership: R01; route: R03. |
| 2.1 | `huybrechts-k3 line 6904` through 6906 (Thm 9.4.11, p.183); `line 4903` through 4910 (Thm 7.3.6, pp.131–132, σ_J=ω_K+iω_I); `line 525` through 546 (Prop 3.5 and Remark 3.6, p.17: Wu, signature −16, lattice (3.4)). |
| 3.1 | `huybrechts-k3 line 3955` through 3958 (Cor 2.7, p.107), `line 3980` through 3999 (§6.2.4, p.108: hypersurface S_ℓ, line-bundle extension by the exponential sequence on the total space). |
| 4.1 | `huybrechts-k3 line 3653` (D, p.99), `line 3705` through 3725 (Prop 1.5, Remark 1.6, p.101: positive planes, connected for n₊>2, two components for n₊=2), `line 3683` through 3690 (Example 1.3 ii–iii, p.100: Ω_h as a hyperplane section), `line 3960` through 3972 (Prop 2.8, p.107), `line 4954` through 4958 (Remark 3.8, p.133). |
| 5.1 (K5.A) | `huybrechts-k3 line 4940` through 4948 (Prop 3.7, p.132): Pic=0 ⇒ K_X=C_X; its proof uses Demailly–Păun, the README's surface-criterion route is its own target. |
| 5.2 (K5.B) | `huybrechts-torelli line 375` through 376 (Prop 3.10, p.10), `line 417` through 420 (Lemma 3.11, p.11); `huybrechts-k3 line 4878` through 4889 (Def 3.3, Prop 3.4, Lemma 3.5, p.131); `line 4913` through 4928 (twistor space, period conic, p.132). |
| 6.1 (K6.A) | `huybrechts-k3 line 4780` through 4811 (Prop 2.2, p.129: graph limit Z+ΣY_i), `line 5018` through 5042 (Lemma 4.2, Prop 4.3, pp.134–135), `line 5049` through 5058 (Cor 5.1, p.135: D simply connected from O(3,19)/SO(2)×O(1,19)), `line 5066` through 5069 (Thm 5.3, pp.135–136), `line 5104` and 5139–5141 (Props 5.4, 5.5, pp.136–137); `huybrechts-torelli line 527` (Prop 4.7, p.14). |
| 6.2 (K6.B) | `huybrechts-k3 line 6152` through 6155 (Thm 8.5.2, p.163), `line 5460` through 5644 (§8.2, pp.146–151: chambers, Prop 2.4, 2.6, Cor 2.11–2.12), `line 4232` through 4247 (Remark 6.3.7, p.114): R04 for the section number. |
| 7.1 (K7.A) | `huybrechts-k3 line 10894` through 10899 (§14.0.3 vii, p.284: Λ^ι≃E₈(−2)⊕U(2)); `gritsenko-hulek line 120` through 133 (pp.3–4: extension of markings, O(N)→O(D_N) surjective). |
| 7.2 (K7.B) | `shen line 442` through 468 (Assumption 2.1, Definition 2.2, (2.7)–(2.8), pp.256–257); `artebani-sarti-taki line 497` through 503 (Thm 3.1, p.10, attributed to Nikulin 4.2.2); `huybrechts-k3 line 12702` through 12706 (§15.4.3 ii, p.330). |
| 7.3 | `gritsenko-hulek line 164` through 166 (image D_N∖H₋₂, p.5), `line 181` through 188 (Thm 2.1, Remark 2.2, p.5), `line 262` through 287 (pp.7–8: l_ev=u₂−v₂, div=2, (8), Namikawa Prop 6.2); `dolgachev-enriques line 614` through 659 (§5, pp.15–16). IntegralLattices 5J (`README.md:1624`) states Theorem 3.6.3, the O(S)→O(q_S) surjectivity for indefinite even 2-elementary S, as cited. |

Flagged-unverified locators: Nikulin Theorem 4.2.2 and Rudakov–Šafarevič p.1502 are recorded as uncertified in the README and were not requested; the statements are certified through Artebani–Sarti–Taki and Martin as above.

**Adversarial table.** Values computed on each side; rows marked (headline) are consistency tests of a statement whose proof is the roadmap's work.

| Statement | Instances tried | Values on the two sides | Result; change |
| --- | --- | --- | --- |
| `IsAlgebraicK3`, quartic (headline) | smooth quartic in ℙ³; Fermat quartic, char 3 | ω=O(4−4)=O; h¹(O)=0; partials 4xᵢ³=xᵢ³ in char 3, common zero only at 0 | Passes; retain. |
| `IsAlgebraicK3`, negative controls | abelian surface; empty scheme; X[ε]/ε² | h¹(O)=2≠0; not geometrically integral; not smooth | All three excluded by distinct clauses. |
| Double sextic Check | branch sextic, char≠2; six lines | π_*O=O⊕O(−3), ω=π*(O(−3)⊗O(3))=O, h²=2; C(6,2)=15 nodes | Values agree. |
| Contraction Check | σ=dx∧dy; 2σ, char 2 and 3 | ∂x↦dy, ∂y↦−dx, det 1; char 2: 2σ=0, 2·(1/2) undefined as 0; char 3: 2·2=4=1 | Agrees. |
| Noether Check | K3; torus | χ=1−0+1=2, c₂=24−0=24; χ=1−2+1=0, c₂=0 | Agrees with `huybrechts-k3 line 373`. |
| K0.A binders | p=0, 2, 3; zero ring | 2<0 false, 2<2 false, 2<3 true; Field fails | Scope is p>2 as the README says; char 2 true by GL Prop 2.2 but outside the binder. |
| K0.A route, Theorem D cases | (i) c₂=0; (ii) rational, c₂=12; (iii) k=1,2 | 0≠24; 12≠24; 3²+3=12, 3⁴+3=84, 3¹+9=12, 3³+9=36 | Euler numbers 2+δ+n with v(Δ)=3 at the type II fibre (`martin line 1576`); 3^{2k}=21 or 3^{2k−1}=15 impossible. |
| K0.A route, case (v) | isotrivial, one singular fibre | 1<2 | Excluded only by the two-fibre statement; that statement's inputs are R02. |
| K0.A route, ρ bound | Fermat quartic char 3 (unirational); very general quartic char 0 | ρ=22 by Shioda's argument; ρ=1, no vector field | R02: the ρ=22 step has no supplier. |
| Frame torsor (headline) | O(1) on ℙ¹; zero section; frames e, 2e | torsor has no global section; 0 is not a frame; transition 2 unique | Free transitive action; excludes "all sections". |
| Inverse by gluing | degree-0 and degree-1 cocycles on ℙ¹ | glue to O and O(1); frames give back classes 0, 1 | Both inverse equations. |
| Tensor, dual, pullback | O(1)⊗O(−1); O(2)∨; f of degree 2, then degree 3 | 1+(−1)=0; −2; 2·1=2, 2·3=6 | Group and pullback laws. |
| Čech Check | u₀₁=u₁₂=1/4, u₀₂=±1/2 | δu=1/4−1/2+1/4=0 and 1/4+1/2+1/4=1; units i, i, −1 both times | Classes differ by an integer coboundary. |
| Exact segment | ℙ¹; E=ℂ/(ℤ+iℤ), class 1/2 | H¹(O)=0, c₁:ℤ→ℤ bijective; 1/2≠0, 2·(1/2)=0, c₁=0 | Injectivity needs H¹(O)=0; Check correct. |
| Point and empty manifold | pt; ∅; ℙ¹⊔ℙ¹ | one class each; (1,−1)+(−1,1)=(0,0) | Componentwise law. |
| b₁=0 (headline) | compact surface, H¹(O)=0 | H⁰(O)=ℂ→H⁰(Oˣ)=ℂˣ onto, so H¹(ℤ)↪H¹(O)=0 | R03: this route replaces "the surface identities". |
| Hodge diamond | K3; abelian surface | 1+20+1=22, e=1+22+1=24; h¹⁰=2, h¹¹=4 | Agrees. |
| Positive component | diag(1,−1): κ=(1,0), −κ, (1,1) | squares 1, 1, 0; pairings with κ: 1, −1, 1 | Only κ in C_X. |
| Nef root wall | h²=2, (h,δ)=0, δ effective | h²>0 but h·δ=0 | Not ample; Check correct. |
| Monge–Ampère constant (headline) | V=ω², Ricci-flat ω; V→2V; φ→φ+t | c=1, φ=0; c=1/2; ∫(φ+t)ω²=t∫ω²≠0 | Normalisation determines φ; c=∫ω²/∫V with ∫V>0. |
| Quaternion signs | I, J by left multiplication | IJ(1)=k, JI(1)=−k | IJ=K=−JI. |
| Sphere of structures | (1/√2,1/√2,0); (0,0,0) | (aI+bJ)²=−(a²+b²)=−1; 0 | Unit sphere needed. |
| σ normalisation | ω_J²=ω_K²=2, orthogonal | (ω_J+iω_K)²=2−2=0; (σ,σ̄)=2+2=4; σ↦iσ rotates (ω_J,ω_K) by det +1 | Matches `huybrechts-k3 line 4910` under I→J→K. |
| Splitting exclusion (headline) | flat torus quotient; degree-d symplectic cover | c₂=0≠24; χ(O_K)=2=2d ⇒ d=1 | Both exclusions numerical. |
| Cup lattice | U³⊕E₈(−1)² | rank 6+16=22; det (−1)³·1·1=−1; signature (3,19); (0−48)/3=−16=3−19 | Agrees. |
| Kuranishi dimensions (headline) | K3 | h⁰(T)=0, h¹(T)=20, h²(T)=h⁰(Ω¹⊗ω)=0; polarized 20−1=19 | Agrees with `huybrechts-k3 line 3957`. |
| Constant family control | X×Δ→Δ | base dim 1≠20, period derivative 0 | Marking alone is not universality. |
| First-order base | ℂ[ε]/ε²; its reduction | 20 directions; 0 | Nonreduced bases retained. |
| Primitive polarization | h²=2; 2h | (2h)²=8, divisibility 2 | Distinct moduli problem. |
| Period domain, degenerate | rank 0; rank 1 form (1) | no nonzero z; z²=0 ⇒ z=0 | Empty. |
| Period positivity | B=±I₂, z=(1,i) | z²=1+i²=0; (z,z̄)=2 or −2 | Only +I₂. |
| Rescaling | c=3+4i; c=0 | |c|²=25, 50=25·2; 0 | c≠0 essential. |
| Components | signatures (3,19), (2,19) | dims 22−2=20, 21−2=19; components 1, 2 | Agrees with `huybrechts-k3 line 3718`. |
| Hodge hyperplane | rational δ with (δ,z)=0 or 1; h on Ω_h | (1,1) / not; identically 0 on Ω_h | Forced equation excluded. |
| Pic=0 cone | κ²=2: κ, 2κ, −κ, 0 | squares 2, 8, 2, 0; pairings 2, 4, −2, 0 | Two in, two out. |
| Twistor conic | orthonormal a,b,c in W | (a+ib)²=0, (z,z̄)=2; conic x₁²+x₂²+x₃²=0, dim 1 vs 20 | Agrees. |
| Generic W | integral δ∉W⊥; δ∈W⊥ | at most 2 zeros on the conic; vanishes identically | Countably many non-Pic=0 points. |
| Two components | φ and −φ | same [z]; orientation (−1)³=−1 | Agrees with `huybrechts-k3 line 5079` through 5081. |
| Strong Torelli (headline) | id; −id with κ²=2 | (κ,κ)=2>0; (κ,−κ)=−2 | −id fails the Kähler-class hypothesis; direction f* : H²(Y)→H²(X) for f:X→Y. |
| Reflection | δ²=−2; x²=2, (x,δ)=1 | s_δ(δ)=δ−2δ=−δ; s_δ(x)²=2+2−2=2; minus sign gives −2 | Plus sign correct. |
| Riemann–Roch at a root | δ²=−2 | χ(O(δ))=2−1=1 | δ or −δ effective. |
| ι and eigenlattices | (e,e)·(f,f); (e,−e)·(f,−f); diagonal E₈ root | 2; 2; −2−2=−4 | S≃U(2)⊕E₈(−2), T≃U⊕U(2)⊕E₈(−2); ranks 10, 12; signatures (1,9), (2,10). |
| Discriminants and index | S, T, Λ | |A_S|=|A_T|=2¹⁰; index 2¹⁰; 2¹⁰·2¹⁰/2²⁰=1 | Unimodular. |
| Projections | (e,0) in swapped U's | (1+ι)/2 gives (e/2,e/2) ∉ Λ | Finite index, not a splitting. |
| Graph gluing Checks | ⟨2⟩,⟨−2⟩, γ=id; ⟨2⟩,⟨2⟩ | q: 1/4−1/4=0, (e+f)/2 square 0, det −4/4=−1; 1/4+1/4=1/2 | Second is no anti-isometry graph. |
| Gluing iff (headline) | ⟨4⟩,⟨−4⟩, γ=id: (g,h)=(−id,id); (−id,−id); rank 0 | γḡ(1)=3≠1=h̄γ(1), (e+f)/4↦(−e+f)/4 ∉ L; 3=3, F=−id; trivial | Both directions discriminate; `∃!` is forced since F is fixed on V×W. |
| Gluing iff, anti-isometry hypothesis | γ with q_T(γa)≠−q_S(a) | graph not isotropic, no integral L with that carrier | Hypotheses consistent, not vacuous, by polarisation of q. |
| Clean formula | id on S²; ∅; reflection; antipodal | L=2=χ(S²); 0=0; 1−1=0=χ(S¹), normal det 2; 1−1=0, Fix=∅ | Orientation not needed. |
| Normal determinants | −1 line; rotation 2π/3 | 2; 2−2cos(2π/3)=3 | Positive sign. |
| Double sextic | branch sextic | g=(5·4)/2=10, χ=−18; L=2+(1−21)=−18; local det_ℂ(1−dj)=0, real normal det 4; L(O)=1−1=0 | Three invariants distinguished. |
| Fixed-locus classification | (1,1,1); (10,10,0); (10,8,0) | (g,k)=(10,0), Euler −18=2r−20; ∅; two elliptic curves, Euler 0 | Exceptional cases separated. |
| Free quotient | complex free involution | χ(O_Y)=1; K_Y of order 2 | Agrees. |
| Free/nodal loci | e−f in U; e′−f′ in U(2); e−2f in U | (−2, div 1); (−4, div 2); (−4, div 1) | Only the second is nodal; matches `gritsenko-hulek line 273`. |
| Lifted curves | C, jC disjoint, square −2 | (C−jC)²=−4, anti-invariant; (C+jC)²=−4, invariant | Eigenspace decides. |
| Marking group | g∈O(S) from h∈O⁺(T) | needs O(S)→O(q_S) onto: IL 5J Thm 3.6.3 for indefinite 2-elementary S=(1,9) | Supplier states it; fixing S gives ker(O⁺(T)→O(q_T)). |

**Library declarations opened at the pins** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, both from `lake-manifest.json`): `Scheme.Over` (Mathlib/AlgebraicGeometry/Over.lean:36); `SmoothOfRelativeDimension` (Morphisms/Smooth.lean:127); `IsProper` (Morphisms/Proper.lean:41); `GeometricallyIntegral` (Geometrically/Integral.lean:40); `exteriorPower` (TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49); `Scheme.Modules.Cohomology` (TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61); `relativeDifferentials` (TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean, header lines 37–41); `IntegralLattice` (TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63, with `le_dual`); `IsNondegenerate` (Basic.lean:143); `IsEven` (Even.lean:67); `Isometry` (Isometry/Basic.lean:74); `discriminantQuadraticMap` (Discriminant/Quadratic.lean:122, half-norm mod ℤ); `discriminantGroupOrthogonalSumEquiv` (Discriminant/Operations.lean:139); `Isometry.discriminantGroupEquiv` (Discriminant/Group.lean:165); `intermediateCarrierOfDiscriminantSubgroup` (Overlattice/Basic.lean:127); `discriminantSubgroup_intermediateCarrierEquiv` (Overlattice/Naturality.lean:190).

**Citations resolved** (main unless stated): SchemeAndStackFoundations §§0.3, 1.17, 1.23, 2.2, 2.3, 2.6, 2.20, 3.4, 4.9, 4.11, 4.13, 5.9, 5.10 at `README.md:551, 2624, 3021, 3309, 3330, 3437, 4275, 4789, 5448, 5528, 5643, 7129, 7175`; ComplexKahlerGeometry K1–K7 at `README.md:96, 193, 296, 444, 568, 1243, 1405`; IntegralLattices 0G, 1B–1F, 5E–5J, 6A at `README.md:568, 599–633, 1528–1597, 1643`; MorseNovikov N5–N7 at `README.md:292, 377, 564` (local index `:316`, Lefschetz formula `:496–542`, Poincaré–Hopf `:578`); GeometricTopology Layer 1 `:177`; SmoothBundlesConnections B1.5 `:498`; DifferentialGeometry Layers 0–3, 5, 8–9 `:268–371, 503, 816, 862`; AlgebraicTopology Stages 1, 5–7 `:289, 849, 946, 1573`; CharacteristicClasses C1–C7 `:211–1532`; AlgebraicCurves Layers 9, 10, 12 `:1099, 1193, 1468`; JacobianChallenge A–D `:111, 135, 143, 218`; StableReduction Layers 4–6 `:529, 552, 576`; HopfRinow Layer 1 (Completed, `:264`); ComplexComparisonPartII C−1.1–C0.7, C1.9, C2, C4.1–C4.4, C5.4 at its open head (`:724–1182, 1673, 1710, 2155–2218, 3015`); AlgebraicModuliForArithmeticGeometry §§1.1–1.3, 7.3, 7.8, 8.1–8.3 at its open head (`:306, 505, 602, 9312, 9783, 9883–9959`); IndexTheory I6, I7, I8 at its open head (`:669, 723, 888`); FourManifolds Layer 7 at its open head (`:2868`). Consumers EnriquesSurfaces (Layer 1, U0–U4 at `:656–666`) and K3SurfacesAndSymplecticBoundedness resolve and neither is consumed. `roadmaps resolve` reports nothing unresolved.

**Ownership by object.** Searched all open roadmaps and main for Torelli (only curve and abelian-variety Torelli elsewhere), twistor, Kuranishi (gauge-theoretic Kuranishi models only), Monge–Ampère/Calabi (ShimuraVarieties has the negative Kähler–Einstein case only), positive-current Kähler criterion (ComplexComparisonPartII C5.4 has currents of bidimension (p,p) and cycle currents, not the criterion), the clean fixed-locus formula, and free involutions (EnriquesSurfacesAndIntegralNonexistence is characteristic two). Apart from R01 this roadmap is the only owner of what it owns.

## Not verifiable

- Rudakov–Šafarevič p.1502 and Nikulin Theorem 4.2.2: paywalled, recorded uncertified in the README; not requested.
- The nonlinear Monge–Ampère estimates, the Cheeger–Gromoll splitting for compact Ricci-flat surfaces, the Hahn–Banach/regularisation steps of the Kähler criterion and the graph-cycle compactness are owned targets whose proofs this review tests only by the consistency rows above.
- Ownership against open pull requests whose files this brief does not provide was checked only through `roadmaps grep` at their heads.

## Source issues

- **Gap** in stacks-09nu at Lemma 20.6.1, proof, printed p.6: the source says the presheaf of pairs modulo units is a presheaf of modules before sheafification; it should restrict that claim to opens where the torsor has a section, since elsewhere the set is empty; affects nothing (the sheafification is still the stated invertible module).
- **Error** in dolgachev-enriques at §5, footnote 3, printed p.16: the source says the norm of an invertible sheaf is det π_*L; it should be det π_*L ⊗ (det π_*O_X)⁻¹ so that O_X has norm O_S; affects the proof.
