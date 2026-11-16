<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6905316050 -->
Review (claude) of bab5599

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §3.6 still uses the K-isocrystals without naming them or their owner

   **Location.** `packages/PELModuliPartII/README.md:871` (§3.6, Route): "Compute Hom and adjoints in
   the rational relative Dieudonné category."; line 885 (§3.6, *Needs:*) and line 914 (Layer 3,
   Suppliers) do not name VectorBundlesAndIsocrystals.

   **Claim.** The route computes `V^exo=Hom^0_{O_L}(X_0,𝕏)` and its L-dimension n in a "rational
   relative Dieudonné category" that the README neither defines nor attributes.

   **Witness.** Since round 9, §§1.5, 2.3 and 5.8 (lines 607, 703, 1179) name the relative isocrystals
   of §0.1 and carry VectorBundlesAndIsocrystals Layer 1 in their *Needs:* lines (622, 717, 1194); §3.6
   makes the same computation (dimension n of a Hom space of slope-1/2 K-isocrystals) and was not updated.

   **Repair.**

   1. Line 871, replace the first sentence of the Route by: "Compute Hom and adjoints through the
      relative isocrystals of §0.1: those of X₀ and of 𝕏 are isoclinic of slope 1/2, the full
      faithfulness of the relative isocrystal functor identifies V^exo with their O_L-linear maps, and
      the Dieudonné–Manin classification of K-isocrystals gives its L-dimension n."
   2. Line 885, append to the *Needs:* line: "; VectorBundlesAndIsocrystals Layer 1, “Finite isocrystals
      over the completed maximal unramified coefficient field” and “Dieudonné–Manin classification of
      finite isocrystals”".
   3. Line 914 (Layer 3, Suppliers), add the same item after FiniteFlatGroupsAndIntegralPadicHodgeTheory.

   Tested on the instance: X₀ has relative height 2, so its relative isocrystal is the simple block of
   slope 1/2 and K̆-dimension 2; 𝕏 has relative height 2n, n copies of it; the Frobenius-equivariant
   maps form a K-space of dimension 4n, and the O_L-linear ones an L-space of dimension n (n=2: 2, the
   value of the Check "The L-dimension is n, not 2n"). Both cited headings exist at the supplier's open
   head, and the edge 188 → 124 is already in the dependency check.

2. **F02** (P3) the HLSY23 note under References misnames the theorems HLSY23 cites

   **Location.** `packages/PELModuliPartII/README.md:2014–2017` (References, HLSY23): "the cited RSZ21
   Theorem 6.7(ii) and RSZ20 Theorem 4.7(ii) need ν unramified over `F_{v₀}` at ramified places and E_ν
   unramified over ℚ_p at almost self-dual places".

   **Claim.** HLSY23 §10.2 rests its regularity assertion on RSZ21 Theorem 6.7(ii) and RSZ20 Theorem
   4.7(ii).

   **Witness.** HLSY23 lines 4113–4117 (p. 78) cite RSZ20 Theorems 5.2 and 5.4 only; RSZ21 enters only
   through Definition 6.10 (line 4109). RSZ20 Theorem 5.2(ii) (RSZ20 lines 1510–1512) excludes AT type
   (4) and AT type (1) with E_ν ramified over ℚ_p.

   **Repair.** Replace the last sentence of the HLSY23 note (from "In §10.2, p. 78," to "keep both
   hypotheses.") by: "In §10.2, p. 78, the Krämer model is called regular and semistable at every place
   above the ramified and almost self-dual places, with a reference to RSZ20 Theorem 5.2. Part (ii) of
   that theorem gives semistable reduction at an almost self-dual place only when E_ν is unramified over
   ℚ_p and does not treat the Krämer model of a self-dual lattice at a ramified place, whose semistable
   reduction is RSZ21 Theorem 6.7(ii), for n≥3 and ν unramified over `F_{v₀}`; §§7.8–7.10 keep both
   hypotheses, and §7.8 treats n=2 by the chart of §5.6."

   Tested against the texts: RSZ20 lines 1197–1200 list the AT types (almost self-dual inert; π-modular
   or almost π-modular ramified; self-dual ramified with n=2), so a self-dual lattice at a ramified place
   with n≥3 is outside RSZ20 Theorem 5.2; RSZ21 lines 1722–1724 state the n≥3 blow-up with ν unramified
   over F. The statements of §§7.8–7.10 need no change.

3. **F03** (P3) the manifest's Stacks entry has the URL of a tag the roadmap does not cite

   **Location.** `packages/PELModuliPartII/sources.toml:301`: `url = "https://stacks.math.columbia.edu/tag/0892"`
   (entry `Stacks`, locator "0B3G, 0B3H, 0C4M, 0C4N, 01WN, 0BCL").

   **Claim.** The entry's URL identifies the cited work, the chapter Morphisms of Schemes.

   **Witness.** Stacks line 3862: tag 0892 is Lemma 38.7 of that chapter, on invertible modules, which
   the README never cites (0 occurrences of "0892"); the chapter's own tag is 01QL (Stacks line 6), and
   the six cited tags are at lines 4242, 4244, 4268, 4273, 4764, 4931.

   **Repair.** In the `Stacks` entry set `url = "https://stacks.math.columbia.edu/tag/01QL"`; leave
   `fetched_from`, `sha256` and the other fields as recorded (the text read is the same chapter file).
   Tested: the README's References link is the chapter (`download/morphisms.pdf`), which is tag 01QL.

Three findings, all P3; none is blocking. Both findings of round 8 are repaired. The 15 sampled
targets, the passages the round-9 repair changed, all 86 cited supplier headings, the dependency
direction and the Lean file pass. What remains: the pattern repaired in round 9 (K-isocrystals used
without naming their owner) is still present in §3.6; a note under References misnames the theorems
that HLSY23 cites; and the manifest's Stacks entry carries the URL of a tag the roadmap does not cite.

## Verified sound

### Round-8 findings

| Finding | Repaired passage | Evidence | Status |
| --- | --- | --- | --- |
| F01 (P2), relative O-Witt vectors and K-isocrystals owned by VectorBundlesAndIsocrystals | From Mathlib: "The ring `W_O(R)` … is VectorBundlesAndIsocrystals Layer 0; the isocrystals over K̆ with coefficient field K … are its Layer 1"; new subsection "From TauCetiRoadmap.VectorBundlesAndIsocrystals"; new deferral bullet; §0.1 Route: "Take the ring W_O(R), its ghost map and its functoriality in R from VectorBundlesAndIsocrystals Layer 0" | Supplier's open head: “Ramified coefficient rings and coefficient changes” (any `𝒪_E`-algebra A, ghost polynomials `Σ π^i x_i^(q^(n−i))`, Frobenius and Verschiebung on perfect `𝔽_q`-algebras), “Finite isocrystals over the completed maximal unramified coefficient field”, “Mixed-characteristic supplier comparison” (`v(π)=1`, `φ_p^f⊗1`), “Dieudonné–Manin classification of finite isocrystals”: all four headings found verbatim | repaired (the same pattern remains in §3.6: R01) |
| F02 (P3), generic image of π₂ | §2.5: "π_2, as a map to the special divisor Z(x₀) of §2.4, is an isomorphism, so the image of π_2 in the generic fibre of `N_{n+1}` is the generic fibre of Z(x₀)"; Layer 2 introduction: "generically an isomorphism onto the special divisor Z(x₀) of §2.4" | LZ22 line 2883 (Remark 10.2.1, p. 65); diagram (10.2.0.3), LZ22 lines 2864–2867 | repaired |

Nothing was marked not actionable in the round-9 repair report; nothing is re-raised. Maintainer
notes for this roadmap: none. Pattern search for F02: "onto its image" occurs nowhere else.

### Sampled source locators (15 targets, all read this round)

| Target | Locator, lines opened | Result |
| --- | --- | --- |
| 0.1 | Mih19 lines 1912–1914 (Definition 11.6, p. 42); 1918–1926 (Definition 11.7), 1927–1934 (Definition 11.8, the equivalence for π nilpotent), 1935–1941 (Definition 11.9), 1945–1947 (Remark 11.11), 1948–1958 (crystal), 1960–1961 (footnote 8), all p. 43; 2114–2120 (Proposition 12.11, p. 47) | supported; the ghost identities of F and V are the README's own definitions (computed below) |
| 0.6 | Mih19 lines 369–371 (Remark 2.9), 372–382 (Lemma 2.10, ranks 0, r, ne, ne−r), 383–395 (D, G, Definition 2.11), 396–410 (Proposition 2.12 and proof), all p. 9; 416–432 (Lemma 2.13, end of the proof of 2.10, p. 10) | supported: rank-r quotients of the distinguished summand, smooth of relative dimension rs, equal generic fibres |
| 1.3 | LZ22 lines 411–418 (§2.2, p. 11) | supported: N₁≅Spf O_F̆, unique lift, conjugated action |
| 1.5 | LZ22 lines 419–426 (§2.2, p. 11) | supported: the pairing, nonsplit of dimension n, action of U(V) |
| 2.3 | LZ22 lines 2814–2819 (§10.1, p. 64); 2850–2857 ((10.2.0.1), norm ϖ, orthogonal decomposition, pp. 64–65) | supported |
| 4.2 | LL22 lines 1969–1991 (decomposition, Lemma 2.60 and proof, p. 39; the P_i are introduced on pp. 38–39) | supported: `Q_i`, F′_i a Frobenius-linear isomorphism, `Vε_i=[ψ_i(u²)]−ψ̂_i(u²)` at line 1985 |
| 4.4 | LL22 lines 2045–2053 (Proposition 2.62, p. 40); 2134–2142 (Lemma 2.63, p. 42); 2214–2215 (Remark 2.68, p. 44) | supported |
| 5.8 | HLSY23 lines 475–486 ((2.3)–(2.6), p. 11), 489–492 (p. 12) | supported |
| 6.4 | LL21 lines 1303–1317 (Notation 5.6, p. 28); LL22 lines 136–141 (Definition 1.1, Remark 1.2, p. 3), 2883–2899 (Notation 4.19, p. 57) | supported: clause (3) at ramified places, K unramified over the local field at u |
| 7.2 | LZ22 lines 3231–3298 (§11.2, (H1)–(H4), (M1)–(M9), pp. 74–75), 3299–3313 (§11.3, pp. 75–76); RSZ21 line 1011 (Definition 4.1, p. 18) | supported |
| 7.3 | LL22 lines 3301–3361 (§4.5, pp. 65–66; the exotic conditions printed for A₀ at lines 3356–3359); RSZ21 lines 1484–1487 (Theorem 5.7, p. 27) | supported, with the README's stated correction (A in place of A₀) |
| 7.8 | RSZ21 lines 1716–1744 (Theorem 6.7, proof, Remark 6.8, pp. 32–33); HLSY23 lines 4112–4121 (pp. 78–79); LZ22 lines 3350–3361 (§11.6, p. 77) | supported; see R02 for the note on what HLSY23 cites |
| 8.7 | LTXZZ22 lines 1718–1736 (Theorem 4.2.3 and proof), 1739 ((4.2)), 1755–1775 (Remark 4.2.5); Stacks lines 4242, 4244, 4268, 4273, 4764, 4931 (the six tags) | supported; each tag states what the route uses it for |
| 9.7 | LZ22 lines 3514–3532 ((13.1.0.1), pp. 80–81), 3560 (footnote 5); Zhang21 lines 1812–1835 ((7.3)–(7.6)); Cho18 line 1825 (Theorem 4.3, p. 42) | supported |
| 9.9 | HLSY23 lines 4083–4111 (the model, (H1)–(H4), p. 78); RSZ21 lines 1755–1808 (Definition 6.10, (6.6)–(6.10), Lemma 6.11, pp. 33–34); RZ96 line 8965 (Theorem 6.30) | supported as cited; the README says itself that no text states the transport of the filtration |

Also opened: LZ22 lines 392–408 (§2.1), 427–433 (§2.3), 2805–2813 (§10.1), 2858–2884 (§10.2,
Remark 10.2.1); LL22 lines 1111–1128 (Proposition 2.28, Remark 2.29, pp. 22–23, for the headline
§3.7), 2020–2044; HLSY23 lines 437–474 (Definition 2.2, §2.2); RSZ21 lines 621–700 (§3.4, (3.15),
(3.16), Remark 3.7, pp. 11–12), 964–968 ((4.2), p. 17); RSZ20 lines 1197–1200, 1272–1278, 1503–1512.

### Adversarial table (changed passages, sampled targets, headlines, findings)

Rows of round 8 that carry computed values were relied on for text that no repair touched and that is
outside this round's sample; every row below was computed this round.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 V and FV=π (changed) | universal x; n=0, 1, 2 | `w_n(Vx)=Σ_{i≥1}π^i x_{i−1}^(q^(n−i))=π·w_{n−1}(x)`; w_0(Vx)=0; `w_n(FVx)=w_{n+1}(Vx)=π·w_n(x)` | pass |
| §0.1 projection formula (changed) | n=0; n≥1 | 0=0; `π·w_n(a)·w_{n−1}(x)` on both sides | pass |
| §0.1 Check π→−π (changed) | q odd; coordinates `x_i′=(−1)^i x_i` | sign `(−1)^(i(1+q^(n−i)))=1`; the shift in primed coordinates is (0,−x₀,−x₁,…), which is −V because negation is coordinatewise for q odd (`w_n` odd in x); over 𝔽_p: V=√p, V′=−√p | pass; the standing p>2 of the Conventions is used |
| §0.1 Check, V normalized by p (changed) | O_K=ℤ_p[√p], R=𝔽_p | F=id, so pF⁻¹=p with image (p)=(√p)²⊊(√p)=`I_O(𝔽_p)` | pass |
| §0.1 Q=πF⁻¹P and full faithfulness (changed) | perfect field k | V(1)=π, so F=πḞ on Q and F(Q)=πP; an F-equivariant f with f(P)⊆P′ has f(Q)=πF⁻¹f(P)⊆Q′ | pass |
| §0.1 biformal ⇔ no slope 0, 1 (changed) | `μ_{p^∞}` (P=W, Q=I, F of slope 0); its dual (slope 1, not formal); rank-one sources (slopes 1/2, 1/2) | formal ⇔ slope 1 absent, dual formal ⇔ slope 0 absent; agrees with the third Check (height 1, dimension 1 is not biformal) and with Mih19 footnote 8 | pass |
| §0.1 Check, unramified degree 2 (changed) | Lubin–Tate module, q=p² | relative: K̆-dimension 1; absolute: height 2 over ℚ̆_p | pass |
| §1.5, §2.3, §5.8 routes (changed) | n=2 | Hom of n copies of the slope-1/2 block: K-dimension 4n=8, L-linear part of L-dimension 2; relative height of the framing 4 | pass |
| §5.4 (changed) | n=3 | K̆-dimension 2n=6; τ=ΠV⁻¹ of slope 1/2−1/2=0; `N^{τ=1}` of K-dimension 6, L-dimension 3 | pass |
| §2.5 generic π₂ (changed) | n=2, q=3 | Ñ₂ and Z(x₀) of relative dimension 1, N₃ of relative dimension 2; deg π₁=q+1=4 | pass |
| §2.4 degree of α | q=3 | 9·9=(deg α)²·1, deg α=9; 27²=729≠81 | pass |
| §2 Examples, invariants | W₂, x₀ of norm ϖ | determinant valuations even and even+1=odd: split, nonsplit, as LZ22 lines 2818 and 2857 | pass |
| 0.6 local model | (r,s)=(1,2); (2,0) with K₀=ℚ_p, K=ℚ_p(√p), n=2 | projective plane, dimension rs=2; rank table 0, 2, 4, 2; quotient `k[x]/(x²)` with x≠0, x²=0 satisfies (i) and (i′), fails (ii) | pass |
| 1.3 rank-one source | n=1 | relative dimension n−1=0; Lie characters a and ā | pass |
| 4.2 banal contraction | f=1; perfect field | no banal index; `W(R)·Vε_i=I(R)`, so (2.22) is onto | pass |
| 4.4 equivalence | f=1; f=2, n=2 | identity; absolute height 8 to relative height 4 | pass |
| 5.8 Krämer special Hom | n=2; λ_Y↦cλ_Y | L-dimension 2 against K̆-dimension 4; h↦c⁻¹h | pass |
| 5.2, 5.9 norm of the generator | e↦ue | (ue,ue)=uū(e,e)=−u²(e,e), K-valuation 1 | pass |
| 6.4 coefficient field | all v above p unramified in F; a ramified v≠u | every local type pulled back, K/F_u unramified; clause (3) needed at v | pass |
| 6.6 Check, k[ε] | x-stable rank-one-quotient submodules of `R[x]/(x²)` | generator a+bx: b a unit gives x+α with α²=0, α=εc; b a non-unit forces a=0, impossible | pass |
| 6.8 parity exponent | n=3, r_φ=2 | 3·1−2=1 (odd) and 3·0−2=−2 (even) | pass |
| 7.2 kernel orders | almost self-dual, length one | q_v²; self-dual at v₀: principal, as (M7) | pass |
| 7.3 exotic conditions | n≥2 | A₀[u^∞] has relative height 2≠2n; only A[u^∞] has height 2nf, dimension nf | pass |
| 7.7 projectivity | F⁺=ℚ, n=4; F⁺≠ℚ | trace form of signature (6,2) in 8≥5 variables, isotropic (Meyer); a definite real place makes V anisotropic | pass |
| 7.8 charts at n=2 | uv=ϖ, ϖ=t²; yz=u | maximal ideal (u,v,t) in dimension 2: not regular; (y,z) in dimension 2: regular | pass |
| 8.4 local ring | N=2 | `W(k)[[x₁,x₂]]/(x₁x₂−p)`: dimension 2, x₁x₂−p outside the square of the maximal ideal | pass |
| 8.7 tangent space, projectivity | N=1, 2; F⁺=ℚ, N=2 | Hom(line, rank N−1): 0, 1; source "projective iff generic fibre projective" equals "proper", the fibre being quasi-projective | pass |
| 9.1 Tate–Dieudonné | supersingular curve; ordinary CM curve with conjugated action | 4=4; 0 against 2 at ℓ, slopes 0 and 1 at 𝔭 | pass, hypothesis needed |
| 9.2 Check | Gram rows (0,1,0),(1,0,0),(0,0,3); g=diag(3,1/3,1) | det=−3; duals of lengths 3, 3, 1; (ge,gf)=1, gΛ₋=Λ₊ | pass |
| 9.7 nearby space | hyperspecial; almost self-dual | V′ at v₀ nonsplit; split (LZ22 lines 3520–3523), as the Check of §9.3 | pass |
| 3.7 headline | n=2; n=4 | strata of dimension t/2−1=0, 1; two components each (LL22 lines 1121–1128) | pass |
| R01 | §3.6 | n=2: K-dimension 8, L-dimension 2; owner named in §§1.5, 2.3, 5.8, not in §3.6 | finding |
| R02 | HLSY23 note | README: "RSZ21 Theorem 6.7(ii) and RSZ20 Theorem 4.7(ii)"; HLSY23 lines 4113–4117: RSZ20 Theorems 5.2, 5.4 | finding |
| R03 | Stacks url | tag 0892 = Lemma 38.7, cited 0 times; chapter tag 01QL | finding |

Context and generality: `Suggested.lean` has no declaration, so no `variable` block can drop a
hypothesis.

### Library at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (from the manifest of the content checkout). Opened this
round: `WittVector` (`Mathlib/RingTheory/WittVector/Defs.lean:52`), `WittVector.ghostComponent`
(`Basic.lean:296`), `WittVector.frobenius` (`Frobenius.lean:218`, `ghostComponent_frobenius` :240),
`WittVector.verschiebung` (`Verschiebung.lean:109`, `ghostComponent_zero_verschiebung` :132,
`ghostComponent_verschiebung` :136), `WittVector.Isocrystal` (`Isocrystal.lean:112`, for a perfect
domain of characteristic p; no finiteness, no functor from groups), `LinearMap.charpoly`
(`Mathlib/LinearAlgebra/Charpoly/Basic.lean:44`, `charpoly_monic` :72, `charpoly_natDegree` :76 with
`StrongRankCondition`), `Matrix.charpoly` (`Matrix/Charpoly/Basic.lean:140`), `Module.Grassmannian`
(`Mathlib/RingTheory/Grassmannian.lean:66`), `IsRegularLocalRing` (`RegularLocalRing/Defs.lean:52`),
`AlgebraicGeometry.Scheme` (`Scheme.lean:40`), `Flat` (`Morphisms/Flat.lean:42`), `Smooth` and
`SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:59`, :127). Tau Ceti:
`TauCeti.AlgebraicGeometry.AbelianVariety` (`AbelianVariety/Basic.lean:95`, over a field),
`Module.Grassmannian.scheme` and `toSpec` (`Grassmannian/Basic.lean:161`, :166), `schemeHomEquiv`
(`Points.lean`), `isSeparated_toSpec`, `isProper_toSpec` (`Proper.lean`), `TauCeti.FormalScheme.Spf.carrier`
(`Spf/Carrier.lean:73`), `structureSheaf` (`Spf/StructureSheaf.lean:262`). Searched by object and not
found at either pin: abelian schemes over a base, p-divisible groups, a category of formal schemes,
relative (ramified) Witt vectors; Tau Ceti's `RingTheory/WittVector` folder is p-typical. Every
backticked Lean identifier of the README is one of these library names; none is presented as this
roadmap's own.

### Suggested.lean

`lake env lean` on `packages/PELModuliPartII/Suggested.lean`, run from the content checkout: exit 0,
no output. One `import Mathlib`, one module docstring ("… target signatures", naming README.md as the
roadmap), one empty namespace, no `set_option`, no declaration. Headlines of the Summary: §§1.2, 2.2,
3.4, 3.7, 5.7; §6.6; §§7.6, 7.7, 7.8, 7.9, 8.4, 8.7; §§9.5–9.10 (18); each is named in the docstring
with the carrier it lacks, as is §9.1. None is statable at the pins (formal schemes with formal
smoothness, strict modules or p-divisible groups over a base, abelian schemes with PEL structure,
Dieudonné modules of abelian varieties). One-tactic probe: 0 of 0 sorried theorems. `#check @name`
audit: 0 of 0 declarations, nothing changed. No finding makes a headline statable.

### Suppliers, gaps, direction

Every cited section was resolved now by its heading, on main or at the open head: 86 headings of 15
suppliers and one consumer (PELModuli 30, AbelianSchemesAndArithmeticModuli 8, now on main,
FiniteFlatGroupsAndIntegralPadicHodgeTheory 5, EndoscopicTransferAndUnitaryTraceComparison 4,
VectorBundlesAndIsocrystals 4, IgusaVarietiesAndTorsionConcentration 2, AdicSpacesPartIII 2,
SchemeAndStackFoundations 2, AlgebraicModuliForArithmeticGeometry 1,
GeometryOfNumbersAndQuadraticArithmetic 2, PadicHodgeTheory 4, ShimuraVarieties 7,
AdelicAlgebraicGroups 1, ReductiveGroupsPartII 1, ShimuraCompactifications 3,
SelmerIwasawaCohomologyPartII 8); none is missing. Content read this round:
VectorBundlesAndIsocrystals Layers 0 and 1 (the four headings), IgusaVarietiesAndTorsionConcentration
§0.27 (unramified datum, unstructured functor) and §0.31 (split place, signature (1,n−1), RSZ
matching), PELModuli §M2.15 (BT an equivalence over complete local noetherian rings with perfect
residue field) and §M4.7 (p unramified in F), ReductiveGroupsPartII §RG2.3.5 (GL and GSp chains).
Suppliers are on main or at positions 35–187 of the merge order; this roadmap is at 188;
SelmerIwasawaCohomologyPartII (387) appears only as a consumer.

Gaps: the four slugs of `design/plan.json` are in the README's supplier subsections, each with its
named supplier and section and one object with its hypotheses; none asks for what a supplier states.

Dependency check, exact output:

```text
depcheck: 239 roadmaps, 2258 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Duplication and ownership, by object (`roadmaps grep` over main and the open heads, index of
2026-11-16T01:45:44Z): O-displays and the Witt O-frame, relative and ramified Witt vectors, strict
formal modules, Rapoport–Zink spaces, almost self-dual and Krämer models, special homomorphisms,
quotients of formal schemes by discrete groups, basic-locus uniformization. Results:

- RelativeFarguesFontaine reads VectorBundlesAndIsocrystals Layer 0 as the owner of Frobenius and
  Verschiebung; it states none itself, so §0.1 (F, V, `I_O(R)` over an arbitrary O-algebra) has no
  second owner.
- MotivesAndAlgebraicCycles uses the intersection numbers of LZ22 §10 as a hypothesis and builds no
  Rapoport–Zink space.
- HilbertModularVarietiesAndShimuraCurves §§R18.5.7, R18.5.11, R18.5.12c: quotients of the Drinfeld
  formal model and the uniformization of its auxiliary quaternionic PEL space, another datum and
  another quotient theorem than §§9.2 and 9.5.
- GrossZagierAndArithmeticHeights §7.2 (merge position 340) and
  LubinTateFormalModulesAndQuasiCanonicalLifts §6.1 (344) build canonical lifts of formal modules of
  height two with a quadratic action from EndoscopicTransferAndUnitaryTraceComparison §10.2, as
  §§1.3, 3.5 and 5.2 do with polarization and framing added. Both are later in the merge order and
  cannot be cited here; no change in this package.
- SelmerIwasawaCohomologyPartII's own contract gap:native-shimura names ShimuraVarieties for the
  models of LTXZZ22 §§4.2 and 5.2, which §§8.1–8.4 and 8.7 build; ShimuraVarieties states none of
  them at its head. This was recorded at the design stage as outside this package; the Downstream
  consumers section states the ownership.
- GeometricSatakeAndFusionPartII (208) asks PELModuli, by its own gap, for ramified local PEL lattice
  data; it owns nothing that §0.2 states.

`roadmaps grep PELModuliPartII`: no roadmap cites this one. The overlap file lists no other pull
request changing this roadmap, no dropped id, no id defined only by a revision and no second copy.

Overlap check: read IgusaVarietiesAndTorsionConcentration, HilbertModularVarietiesAndShimuraCurves, SelmerIwasawaCohomologyPartII, PELModuli, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (open, by vocabulary), AbelianSchemesAndArithmeticModuli, CrystallineCohomology (main, by vocabulary; the list by results is empty); unstructured framed functor and unramified single-lattice PEL space: IgusaVarietiesAndTorsionConcentration §0.27; Zink displays and BT: PELModuli §M2.15; Dieudonné displays over the Zink ring and tensor structures: FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII Layer 0 (not O-displays over `W_O(R)`); Grothendieck–Messing and Serre–Tate: AbelianSchemesAndArithmeticModuli §§A4.7–A4.9; special-fibre strata of the LTXZZ models: SelmerIwasawaCohomologyPartII Layer 2; Drinfeld special formal modules and tree quotients: HilbertModularVarietiesAndShimuraCurves Layer R18.5; nothing owned twice among these.

### Shape and policy

75 numbered targets in ten layers, each with exactly one *Needs:* line; every layer ends with
Examples and Dependencies; 0 lines with an odd number of backticks; no LaTeX delimiter, pull-request
number, machine path, HTML anchor or process word. The 15 targets with two Checks (§§0.5, 0.7, 1.2,
2.2, 3.2, 4.2, 4.4, 5.5, 5.7, 5.9, 6.3, 6.4, 9.8, 9.9, 9.10) are theorems, not definitions; every
definition has at least three. No algorithm. The layers are named by their mathematics and ordered
by their *Needs:* edges (local objects, four local families, global data, models, uniformization).
The 17 works cited are the 17 manifest entries, all certified; the manifest has no local path.

### Copyright and arrangement

Wording compared at the 15 sampled locators and at six further passages (§0.1 against Mih19 lines
1927–1941; §2.4 against LZ22 lines 2854–2862; §5.4 against HLSY23 lines 455–467; §6.2 against LL22
lines 2889–2899; §7.4 against RSZ21 lines 1755–1806; the docstring of `Suggested.lean` against LZ22
lines 407–408). The longest shared runs are in definitions and formulas that can be written one way
only (six words at LL22 line 2896; the polarization clause of Mih19 line 1940); no sentence is
followed clause by clause, and no table, figure or list of examples is taken over. Arrangement: LL22
has the largest share; its contents (§2.1–2.8 intersections at ramified places, §3 theta lifting, §4
inner product formula; LL22 lines 16–39) do not map onto Layers 0–9: Layers 3–4 draw on §§2.1, 2.3
and 2.8 only, and §§6.2, 6.4, 7.3, 7.7 and 9.6 on §§1 and 4.5.

Source independence: 21 passages compared with 9 sources, none shared; largest share LL22, 40 of 241 locator mentions; contents compared with LL22: independent.

## Not verifiable

- Published page numbers of Zhang21 (Annals, pp. 879–881, 901–909) and of LTXZZ22 (Inventiones,
  pp. 147–193): the cached texts are the arXiv versions with their own pagination. Sections,
  equations and statements were read; the published pages are not certified. The manifest records the
  version note.
- LZ22 line 2817 prints the source of W_n without the conjugation bar that lines 419 and 2821 carry;
  the extraction drops overlines elsewhere, so whether the printed text has the bar was not settled.
  The README's 𝔈̄ agrees with lines 419 and 2821.
- Ownership against open pull requests rests on the index of 2026-11-16T01:45:44Z.

## Source issues

- **Error** in HLSY23 at §10.2, printed p. 78: the source says the global Krämer model is regular and semistable above every ramified and almost self-dual place, by RSZ20 Theorem 5.2; it should be only where E_ν is unramified over ℚ_p (almost self-dual) or over the local CM field, n≥3 (RSZ21 Theorem 6.7(ii)); affects a stated result.

## For the human reviewers

- **Licence.** RZ96 is read from a scan on an author's institutional page (`packages/PELModuliPartII/sources.toml`, entry RZ96, class author-page); the book is a Princeton University Press title. Whether that copy is authorised is not settled by the manifest.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 (see Not verifiable): the locators carry published page numbers that were not read in the published versions.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bab55994838f3dd3e8f8f962dba0351839fe41d7", "job": "REV-PKG-PELModuliPartII~9", "model": "fable", "worker": "chris-x79"} -->
