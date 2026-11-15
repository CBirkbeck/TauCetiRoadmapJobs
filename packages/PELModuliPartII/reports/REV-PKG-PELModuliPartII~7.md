<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6900606373 -->
Review (claude) of b12b61d

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the Tau Ceti Grassmannian scheme exists at the pin and is not cited

   **Location.** `packages/PELModuliPartII/README.md:170–173` (From Mathlib): "their representability
   and smoothness are imported from AlgebraicModuliForArithmeticGeometry §1.3"; lines 186–198 (From
   Tau Ceti) list two carriers only; line 432 (§0.6): "represented by AlgebraicModuliForArithmeticGeometry §1.3".

   **Claim.** The supplier contracts name every pinned declaration consumed, and representability of
   the Grassmannian of §0.6 comes from a roadmap section.

   **Witness.** Tau Ceti at the pin `2fd255d9`: `Module.Grassmannian.scheme`
   (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean:161`), `Module.Grassmannian.schemeHomEquiv`
   (`…/Grassmannian/Points.lean:405`), `Module.Grassmannian.isProper_toSpec` (`…/Grassmannian/Proper.lean:230`).
   No smoothness or tangent statement there.

   **Repair.**

   1. From Mathlib, the `Module.Grassmannian` bullet: replace its last sentence by "It is the set of
      R-points of the Grassmannians of quotients used in §§0.6, 1.2, 5.1 and 7.5. Over an affine base
      the representing scheme is Tau Ceti's (below); the Grassmannian of a locally free sheaf over an
      arbitrary base, its smoothness of relative dimension d(n−d) and its tangent Hom formula are
      imported from AlgebraicModuliForArithmeticGeometry §1.3."
   2. From Tau Ceti, add a bullet: "`Module.Grassmannian.scheme` and `Module.Grassmannian.toSpec`
      (`TauCeti/AlgebraicGeometry/Grassmannian/Basic.lean`), `Module.Grassmannian.schemeHomEquiv`
      (`.../Grassmannian/Points.lean`) and `Module.Grassmannian.isProper_toSpec`
      (`.../Grassmannian/Proper.lean`): for a module M over a commutative ring R, in the universe of
      R, the scheme over Spec R glued from the standard charts; its morphisms from Spec A over Spec R
      are the points of Mathlib's `Module.Grassmannian` for A⊗M, and it is proper over Spec R for
      finite M. It is the carrier of the Grassmannian of §0.6 over Spec O_L̆. Smoothness and the
      tangent space are not at the pin."
   3. §0.6, second API bullet, last sentence: "The Grassmannian is the R-points functor of
      `Module.Grassmannian` of the Mathlib contract, represented over Spec O_L̆ by Tau Ceti's
      `Module.Grassmannian.scheme`; its smoothness of relative dimension rs is
      AlgebraicModuliForArithmeticGeometry §1.3."

   Tested on the witness: the four names resolve at the lines given (`toSpec` at `Basic.lean:166`);
   `grep -i 'smooth\|tangent'` over the seven files of that folder returns nothing, so the import of
   §1.3 for smoothness and the tangent formula stays necessary; the convention agrees (Mathlib's
   `Module.Grassmannian` at `Mathlib/RingTheory/Grassmannian.lean:66` is submodules with quotient
   projective of rank k, the rank-r quotients of §0.6). The sentence "This is the only formal-scheme
   carrier at the pin" stays true (the third file of the `Spf` folder, `CompletedNeighbourhood.lean`,
   is API on the same carrier), and the Lean docstring needs no change: no headline becomes statable.
   Pattern search: I searched both pins for the other carriers the README says are absent
   (p-divisible groups, abelian schemes over a base, a category of formal schemes, formal smoothness);
   none is there.

2. **F02** (P3) §9.10 and §4.6 use symbols that the roadmap does not define

   **Location.** `packages/PELModuliPartII/README.md:1880` (§9.10): "the arithmetic quotient of the
   mixed local framed space Ñ¹_n" and "There is no integral identification Ñ¹_n≅Z(x₀)."; line 963
   (§4.6): "rel induces an equivariant isomorphism N_Φ≅N^exo of framed formal schemes and an isometry
   V_Φ≅V^exo".

   **Claim.** The mixed space of §9.10 is the space constructed in §2.4, Z(x₀) is a defined object,
   and N_Φ, V_Φ and the framing 𝕏_Φ of §4.6 are defined objects.

   **Witness.** §2.4 (line 673) names the space Ñ_n; "Ñ¹_n" occurs twice, only on line 1880, in a
   different character encoding; "Z(x₀)" occurs once, undefined. N_Φ occurs on lines 963 and 1825,
   V_Φ on line 963, with no defining sentence (LL22 Definition 2.64, line 2171).

   **Repair.**

   1. Line 1880: write "the mixed local framed space Ñ_n of §2.4", and replace the second sentence by
      "There is no integral identification of Ñ_n with the closed formal subscheme of `N_{n+1}` over
      which the homomorphism x₀ of §2.3 lifts to a homomorphism ℰ̄→X (the special divisor of x₀, LZ22
      (10.2.0.3), p. 65)."
   2. §4.6, before its first sentence: "Fix a supersingular framing object 𝕏_Φ of Exo_Φ(n−1,1) over
      the residue field. N_Φ is the functor of objects X of Exo_Φ(n−1,1) with a height-zero O_L-linear
      framing quasi-isogeny ρ to 𝕏_Φ over the uniformizer-zero subscheme such that ρ*λ_𝕏_Φ=λ_X, and
      `V_Φ=Hom^0_{O_L}(X₀,Φ,𝕏_Φ)` carries the u^−2-normalized form of §3.6 built from the principal
      source of §4.5. (LL22, Definition 2.64 and the paragraph before (2.25), p. 43.)"

   Tested: LZ22 line 2859 defines the mixed space inside `N¹_n×N_{n+1}` and line 2867 has Z(x₀) as the
   target of π₂, the object the repaired sentence describes; LL22 lines 2169–2175 give the absolute
   framed functor with exact pullback of the polarization and lines 2189–2191 its Hom space with the
   form "similar to (2.1)". After the edits the symbol of §9.10 is the one of lines 344, 673, 679, 696
   and 709. The other local spaces and Hom spaces (N_n, N¹_n, N^exo, N^ε, N_n^Kra, N′, V_n, W_n,
   V^exo, C, C_Y) each have a defining sentence in §§1.1, 2.1, 3.3, 3.7, 5.3, 9.4, 1.5, 2.3, 3.6, 5.4, 5.2.

Two P3 findings, no P1 or P2. Both findings of round 6 are repaired. The mathematics of the 15
sampled targets, every supplier citation, the dependency direction and the Lean file pass. What
remains is one supplier-contract omission (a Tau Ceti carrier that exists at the pin and is not
cited) and symbols used without a definition in §9.10 and §4.6.

## Verified sound

### Round-6 findings

| Finding | Repaired passage | Evidence | Status |
| --- | --- | --- | --- |
| F01, RSZ21 §3.3 for §3.4 | README §6.6: "RSZ21, §3.4, (3.15)–(3.16) and Remark 3.7, pp. 11–12"; §6.7: "RSZ21, §§3.4, 4.1, pp. 14–19"; manifest entry RSZ21: `locator = "§3.4, (3.15)–(3.16), Remark 3.7; …"` | RSZ21 line 621 heading of §3.4 (page 11 starts at line 609); (3.15) line 680, (3.16) line 687, Remark 3.7 line 688 (page 12 from line 672); §4.1 heading line 940, (4.2) line 968 (page 17) | repaired |
| F02, three cut code spans | §6.6: "`char(ι₀(a)|Lie A₀)=∏_{φ∈Φ}(T−φ(a))`" and "For `a=O_{F⁺}`"; §6.8 and Layer 6 example: "`Σ_{φ∈Φ_v}(n·r₀,φ−r_φ)`" | mechanical scan of all 218 code spans: 0 with unbalanced brackets, 0 lines with an odd number of backticks; RSZ20 line 3115 gives the jump `n − r_φ + n(r₀,φ − 1) = n·r₀,φ − r_φ`, a product | repaired |

No finding was marked not actionable; nothing is re-raised. The repair diff
(`d35cdf61..b12b61d4`) touches four README lines and one manifest line and changes no statement,
hypothesis, Check or *Needs:* line; I read each changed line against the source lines above.

### Principles, shape, policy

Read the whole README (2006 lines, 75 targets in ten layers). 75 sections each with one *Needs:*
line; a mechanical scan of the internal edges finds 0 forward and 0 unknown references. Every layer
ends with Examples and Dependencies. No LaTeX delimiters, pull-request numbers, machine paths, HTML
anchors, process words or `lemma` targets (the two hits of the word are "fundamental lemma" and
"lemma numbers" in prose). No algorithm. Layers are named by their mathematics; the order (local
foundations, four local families, global data, global models, uniformization) is forced by the
*Needs:* edges. p>2 and the unramifiedness hypotheses are domains of the cited theorems; §6.6 covers
every prime and §§7.6, 7.7, 8.4 keep the bad primes through gap:bad-prime-projectivity.

### Sampled source locators (15 targets, all read this round)

| Target | Locator, lines opened | Result |
| --- | --- | --- |
| 0.1 | Mih19 Def. 11.6 line 1912 (p. 42); Defs 11.7–11.9 lines 1920–1941, Remark 11.11 line 1945, crystal paragraph line 1948 (p. 43, page from line 1916) | supported: equivalence "whenever π is nilpotent in R" (line 1934); biformal, dual, λ^∨=−λ as stated |
| 1.2 | LZ22 lines 392–408 (p. 10) | supported: formally locally of finite type, formally smooth of relative dimension n−1 over Spf O_F̆ |
| 1.4 | LZ22 (2.11.0.1) lines 582–585 (p. 15); Zhang21 (3.2)–(3.3) lines 683–688 | supported: LZ22 adds the conjugate source, Zhang21 the unconjugated one; closed embedding |
| 3.3 | LL22 Def. 2.1 lines 405–423, Def. 2.3 lines 432–436, Lemma 2.4 lines 437–443 (p. 10) | supported: exact pullback of λ, height zero, separated formal scheme |
| 4.5 | LL22 lines 2180–2202 (p. 43): source of dimension f and height 2f, rank-one Lie summands, `End_{O_E}(X₀)=O_E`, (2.25), Cor. 2.66 | supported |
| 6.5 | RSZ21 §5.2 cases (1)–(2) lines 1361–1376 and footnote 11 lines 1389–1390 (p. 25); RSZ20 (4.10) lines 880–912 (pp. 16–17); RZ17 (8.1)–(8.2) lines 1492–1497 (p. 28); Zhang21 line 1848 | supported: zero-endomorphism reading is footnote 11; automatic when unramified (line 911) |
| 6.6 | RSZ21 Def. 3.6 lines 627–656 (p. 11); (3.15)–(3.16), Remark 3.7 lines 676–700 (p. 12); extension over the ring of integers and (4.2) lines 962–968 (p. 17) | supported: finite étale; nonempty for every a when F/F⁺ ramifies at a finite place (line 688) |
| 6.7 | RSZ21 lines 969–1009 (pp. 17–18), footnote 7 lines 1000–1002, Remark 6.5 lines 1620–1640 (pp. 30–31); LZ22 (H1)–(H4), (M7) lines 3245–3284 (pp. 74–75) | supported; see the 6.7 row of the table for the dual-lattice computation |
| 6.8 | RSZ20 (A.1)–(A.8) lines 2930–3039, Prop. A.1 line 3041, proof lines 3099–3120 (p. 57), Remarks A.2–A.3 lines 3147–3156 (p. 58) | supported: `µ_φ = n·r₀,φ − r_φ` at line 3119 |
| 7.4 | RSZ21 Def. 6.10 lines 1755–1757, (6.6)–(6.7) lines 1764–1774 (p. 33), (6.8)–(6.10) lines 1783–1801, Lemma 6.11 line 1807 (p. 34); LZ22 §11.6 line 3350 (p. 77) | supported; "every v∈V_ram unramified over ℚ" at line 1733 |
| 7.8 | RSZ21 proof of Thm 6.7 lines 1733–1740, Remark 6.8 lines 1741–1744 (p. 33) | supported: reflex field F_v for n≥3, F⁺_v for n=2, semistability lost after the ramified base change |
| 7.9 | LZ22 §11.2 lines 3245–3298, §11.3 lines 3299–3313, §11.4 lines 3314–3324 (pp. 74–76); RZ17 §8 lines 1474–1498 (p. 28), Lemma 8.6 line 1565 (p. 30) | supported: (H1) "possibly ramified over p", (A1) unramified, semistable when ν unramified over p |
| 8.7 | LTXZZ22 Thm 4.2.3 lines 1718–1736 | supported: quasi-projective smooth of relative dimension N−1, tangent sheaf, "projective iff the base change is"; published pages not read |
| 9.2 | RZ96 separated groups line 2406, Prop. 2.37 lines 2409–2424 (printed 66–67) | supported: torsion-free separated discrete subgroup, formal algebraic space |
| 9.7 | LZ22 (13.1.0.1) lines 3514–3532 (pp. 80–81), footnote 5 lines 3560–3565; Cho18 Thm 4.3 line 1825 (p. 42) | supported: p>2 at line 3516; V′ nonsplit in the hyperspecial case, split in the almost self-dual case |

Also opened: Stacks tags 0B3G line 4242, 0C4M line 4244, 0B3H line 4268, 0C4N line 4273, 0BCL
line 4764, 01WN line 4931 (each states what §§7.6, 7.7, 8.4, 8.7 use it for); HLSY23 lines 469–473
(p. 11, the two signs, §5.5); LL22 Def. 2.59 line 1929, (2.21) line 1948, Lemma 2.60 line 1971,
Prop. 2.62 line 2045 (pp. 38–40); LZ22 §10.2 lines 2849–2884 (pp. 64–65).

### Adversarial table (sampled targets, headlines, findings)

Rows of the round-6 table that carry computed values were relied on for text no repair touched and
outside the sample; the rows below were computed this round.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 0.1 strict modules and duals | O=ℤ_p, μ_{p^∞}; K=ℚ_p(√p), Lubin–Tate twisted by conjugation; height 1 dim 1; height 2 dim 1 | P rank 1, P/Q rank 1; 2√p has p-valuation 1/2<1, so √p≠−√p in O_K/(p) for odd p; dual dimension 1−1=0 (étale, not biformal), 2−1=1 (biformal); relative height = p-height/[O:ℤ_p] = 2/2 = 1 | pass |
| 1.2 smoothness of N_n | n=1,2,3 | Grassmannian of rank-1 quotients of rank n: 1·(n−1) = 0,1,2 = rs at (1,n−1) | pass |
| 1.4 rank raising | n=1,2 with ℰ̄ and with ℰ | (1,0)+(0,1)=(1,1), (1,1)+(0,1)=(1,2); with ℰ: (2,0), (2,1); relative height 2n+2 = 4, 6 | pass |
| 3.3 exotic framed space | multiplier c=1, c≠1; n=2 | ρ*λ_𝕏=λ exact (LL22 line 421); relative height 4, dimension 2; kernel X[i(u)] of order q² ≠ 1 | pass |
| 4.5 principal source | f=1,2 | absolute (height, dim) = (2,1), (4,2); relative (2,1) in both; f=1 no banal component | pass |
| 6.5 Eisenstein | F_w=ℚ_p(√p)-type banal factor: r=(n,0); r=(n,n); A_ψ=∅ | Q=T−√p, forces ι(π)=√p, =0 in characteristic p, while the Kottwitz polynomial Tⁿ allows a nilpotent block; Q=T²−p vanishes identically; Q=1 forces the summand of rank Σr_φ=0 to be 0 | pass |
| 6.6 CM moduli | a=ℤ, 2ℤ, (1/2)ℤ; c=1+√2; R=k[ε] | duals Λ, (1/2)Λ, 2Λ⊊Λ (rejected); c²=3+2√2, c⁴=17+12√2, c⁻¹=√2−1; x²≡α² mod (x+α), so α²=0, α=εc; degree of the Kottwitz polynomial = |Φ| = dim A₀ | pass |
| 6.7 kernel order | a prime to p; unit √Δ with F⁺_v=ℚ_p(√p) | hermitian dual of Hom(Λ₀,Λ) is Hom(Λ₀^∨,Λ^∨) (RSZ21 (6.4)); with Λ₀^∨=Λ₀ at p the order is #Λ^∨/Λ, the different cancelling between source and target; inert length-one quotient: q_v² | pass (needs "a prime to p", which §6.7 states) |
| 6.8 parity exponent | n=3, r_φ=2; same A₀ in both conventions | 3·1−2=1, 3·0−2=−2; with Φ transported, Σ_{Φ′}(n−r_φ)=Σ_{Φ̄′}r_φ ≡ −Σ_{Φ̄′}r_φ: equal parity for one A₀, different when only r₀ is switched | pass |
| 7.4 Krämer–Eisenstein | n=3 distinguished factor; banal factor (n,0) | rank P = r_{φ₀} = 2 with T−φ₀(π) (structural), quotient 3−2=1 with the conjugate factor; banal: P the whole summand, quotient 0, equation = Eisenstein of §6.5 | pass |
| 7.8 wedge and Krämer at n=2 | uv=ϖ after ϖ=t²·unit; yz=u after unramified extension | (u,v,t) needs 3 generators in dimension 2: not regular; (y,z) generates in dimension 2: regular | pass |
| 7.9 three cases | split; inert self-dual with F⁺_v ramified; inert almost self-dual | smooth (LZ22 §11.4); smooth with (M8) (line 3285); flat, semistable only for ν unramified over p (line 3312) | pass |
| 8.7 tangent space, projectivity | N=1,2,3; F⁺=ℚ, N=2 | Hom(rank 1, rank N−1): 0,1,2; ⟨a,b⟩ isotropic iff −ab∈Nm F^×; isotropic subspace of V₀⊕V stable under F×F is W₀⊕W with W₀=0 | pass |
| 9.2 quotients | H with rows (0,1,0),(1,0,0),(0,0,3); Λ₊, Λ₋, Σ; g=diag(3,1/3,1); Γ=ℤ, {±1} | det −3 (odd valuation, nonsplit); duals ⟨e,f/3,a/3⟩, ⟨e/3,f,a/3⟩, ⟨e,f,a/3⟩ of lengths 3,3,1; h(3e,f/3)=1, gΛ₋=Λ₊, gΣ=⟨3e,f/3,a⟩≠Σ (the Check does not need g to fix x); −1 fixes every point | pass |
| 9.7 inert uniformization | n=1; invariants | N₁ a point; v₀ and φ₀ both switched, product of signs unchanged; V′_v₀ nonsplit = V_n of §1.5, split = W_n of §2.3 | pass |
| R01 | Tau Ceti Grassmannian folder | 3 declarations found, 0 smoothness statements | finding |
| R02 | symbols of §9.10 and §4.6 | Ñ¹_n: 2 occurrences, 0 definitions; Z(x₀): 1 occurrence, 0 definitions; N_Φ: 2 occurrences, V_Φ: 1, 0 definitions | finding |

Context and generality: there is no Lean declaration, so no `variable` block can drop a hypothesis.

### Library at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`. Opened: `LinearMap.charpoly`
(`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, `charpoly_monic` :72, `charpoly_natDegree` :76 with
`StrongRankCondition`); `Matrix.charpoly` (`Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:140`);
`Module.Grassmannian` (`Mathlib/RingTheory/Grassmannian.lean:66`); `WittVector`
(`Mathlib/RingTheory/WittVector/Defs.lean:52`); `WittVector.Isocrystal`
(`Mathlib/RingTheory/WittVector/Isocrystal.lean:112`); `IsRegularLocalRing`
(`Mathlib/RingTheory/RegularLocalRing/Defs.lean:52`); `AlgebraicGeometry.Scheme`
(`Mathlib/AlgebraicGeometry/Scheme.lean:40`), `Flat` (`Morphisms/Flat.lean:42`), `Smooth` and
`SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:59`, :127); Tau Ceti `AbelianVariety`
(`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, over a field), `Spf.carrier`
(`…/FormalScheme/Spf/Carrier.lean:73`), `Spf.structureSheaf` (`…/Spf/StructureSheaf.lean:262`). All
16 backticked library names and 12 cited library files of the README resolve. A search of both pins
for p-divisible groups, abelian schemes over a base and a category of formal schemes finds nothing
beyond the `Spf` folder. The one object the pin has and the README does not cite is R01.

### Suggested.lean

`lake env lean` on `packages/PELModuliPartII/Suggested.lean`, run from the content checkout: exit 0,
no output (no warning at all, since nothing is sorried). One import (`import Mathlib`), one
docstring, one empty namespace, no `set_option`, no declaration. Headlines of the Summary: §§1.2,
2.2, 3.4, 3.7, 5.7; 6.6; 7.6, 7.7, 7.8, 7.9, 8.4, 8.7; 9.5–9.10 (18), each named in the docstring
with the carrier it lacks, plus §9.1. None is statable: each needs formal schemes with formal
smoothness, strict modules or p-divisible groups over a base, abelian schemes with PEL structure, or
Dieudonné modules of abelian varieties; the Tau Ceti Grassmannian of R01 makes none of them
statable. One-tactic probe: 0 of 0 sorried theorems. `#check @name` audit: 0 of 0 declarations,
nothing changed. No backticked name in the README is presented as this roadmap's own declaration.

### Suppliers, gaps, direction

Every cited section was resolved now by its heading, on main or at the open head (80 headings):
PELModuli M0.4, M0.6, M0.7, M0.10, M0.16–M0.18, M0.22–M0.25, M1.1, M1.6, M1.7, M1.9, M1.13, M2.8,
M2.11, M2.12, M2.14, M2.15, M3.1, M3.2, M3.8, M4.3, M4.5–M4.8, M5.5; AbelianSchemesAndArithmeticModuli
A4.1, A4.3, A4.7–A4.9, A6.10, A6.11, A6.13; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1,
R07.2.10, .17, .20, .26; EndoscopicTransferAndUnitaryTraceComparison 7.6, 8.3, 8.10, 10.2;
IgusaVarietiesAndTorsionConcentration 0.27, 0.31; AlgebraicModuliForArithmeticGeometry 1.3;
GeometryOfNumbersAndQuadraticArithmetic 2.7, 2.9; PadicHodgeTheory 3.3–3.5, 8.3; ShimuraVarieties
1.7, 2.5–2.7, 4.5, 5.10, 6.7; ShimuraCompactifications 7.5, 7.18, Layer 7; on main:
AdelicAlgebraicGroups 4.1 (`TauCetiRoadmap/AdelicAlgebraicGroups/README.md:4101`), AdicSpacesPartIII
Layer F0 (:682) and R2.9 (:7714), SchemeAndStackFoundations Layer 1 (:2764) and Layer 4 (:6245),
ReductiveGroupsPartII RG2.3.5 (:4664); downstream SelmerIwasawaCohomologyPartII 2.2–2.4, 2.6, 5.2,
5.4, Layers 2 and 5. Content read for what the README assumes of them: IgusaVarietiesAndTorsionConcentration
§0.27 (unramified datum, principal polarization, and the unstructured functor) and §0.31 (split
v₀, signature (1,n−1), RSZ matching); ShimuraCompactifications §7.5 (properness for complete Σ) and
§7.18 (good primes only, "bad primes are not treated"); PELModuli §M4.7 ("p unramified in F"),
§M0.10, §M2.15 (BT an equivalence over complete local noetherian rings with perfect residue field
only, which is what gap:zink-display-equivalence extends); GeometryOfNumbersAndQuadraticArithmetic
§2.7 (forms conjugate-linear in the first argument, as the Conventions say); ReductiveGroupsPartII
§RG2.3.5 (GL and GSp chains). Every supplier is earlier than position 188 of the merge order or on
main; SelmerIwasawaCohomologyPartII (position 387) appears only as a consumer.

Gaps: the four slugs are in `design/plan.json` and in the README supplier subsections with the
identical sentence and a named supplier; each asks for one object with its hypotheses; none is
provided at main, the pins or an open head (searched for Landherr's theorem, unitary multichain
stabilizers, the display equivalence over p-nilpotent rings, multichain PEL moduli).

Dependency check, exact output:

```text
depcheck: 245 roadmaps, 2250 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication and ownership: `roadmaps grep PELModuliPartII` finds no citation of this roadmap on
main or at an open head. Searched main and the open heads by object (strict formal O-modules and
O-displays, relative Witt vectors, Rapoport–Zink spaces, Krämer and almost self-dual models). Hits
are the suppliers already cited, consumers (GrossZagierAndArithmeticHeights, GeometricSatakeAndFusionPartII)
and LubinTateFormalModulesAndQuasiCanonicalLifts, which owns one-dimensional formal group laws with a
coefficient action and their deformations, a different carrier from the p-divisible strict modules
and O-displays of §0.1, and is later in the merge order (position 344). The board package index lists
AnalyticNumberTheory and LawrenceVenkateshMethod, unrelated. The overlap file reports no other pull
request changing this roadmap, no dropped id and no id defined only by a revision.

Overlap check: read IgusaVarietiesAndTorsionConcentration, SelmerIwasawaCohomologyPartII, HilbertModularVarietiesAndShimuraCurves, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (the open list by vocabulary; the lists for main and by results are empty); unstructured framed functor and unramified single-lattice PEL space: IgusaVarietiesAndTorsionConcentration §0.27; displays and BT: PELModuli §M2.15; special-fibre strata of the LTXZZ models: SelmerIwasawaCohomologyPartII Layer 2; nothing owned twice.

### Copyright and arrangement

Wording compared at the 15 sampled locators and at six further passages (HLSY23 lines 469–473
against §5.5; LZ22 lines 2849–2884 against §§2.4–2.5; RSZ21 lines 1011–1040 against §7.2; LZ22 lines
3254–3294 against §7.2; LL22 lines 1929–1990 against §§4.1–4.2; RZ17 lines 1474–1498 against §6.5).
The longest shared runs are in definitions that can be written one way only ("A polarization (resp.
principal polarization)", Mih19 line 1940, four words; "locally free … of rank one"); nothing is
followed clause by clause and no table, figure or example list is taken over. Arrangement: LL22 has
the largest share; its contents (§2.1–2.8 local intersection, §3 theta lifting, §4 inner product
formula) do not map onto Layers 0–9: Layers 3–4 draw on §§2.1, 2.3 and 2.8 only, and §§7.3, 7.7, 9.6
on §4.5.

Source independence: 21 passages compared with 11 sources, none shared; largest share LL22, 39 of 236 locator mentions; contents compared with LL22: independent.

The source issues recorded in round 6 (HLSY23 Definition 2.2(2) and §1.2, LZ22 §13.4, RZ96 Corollary
6.29, LL22 §4.5) were not reopened this round and stand as recorded there; the README's References
notes still describe them.

## Not verifiable

- Published page numbers of Zhang21 (Annals, pp. 879–881, 901–909) and of LTXZZ22 (Inventiones,
  pp. 147–193): the cached texts are the arXiv versions with their own pagination. Sections,
  equations and statements were read; the published pages are not certified. The manifest records
  the version note.
- Ownership against open pull requests rests on the index of 2026-11-15T19:56:08Z.

## Source issues

- none

## For the human reviewers

- **Licence.** RZ96 is read from a scan on an author's institutional page (`sources.toml`, entry RZ96, class author-page); the book is a Princeton University Press title. Whether that copy is authorised is not settled by the manifest.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 (see Not verifiable): locators carry published page numbers that were not read in the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b12b61d421db1987f6bab288da50c139f0a9cd72", "job": "REV-PKG-PELModuliPartII~7", "model": "fable", "worker": "chris-x89"} -->
