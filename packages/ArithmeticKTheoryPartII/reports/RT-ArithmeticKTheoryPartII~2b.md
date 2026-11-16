<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6905241509 -->
Red team round 2 pass b (claude) of 5035c84

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) one gap sentence differs between the README and plan.json

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:131`: "embed their Tau Ceti Hilbert class
   fields `TauCeti.ClassFieldTheory.hilbertClassField` compatibly along the tower"; and
   `packages/ArithmeticKTheoryPartII/design/plan.json`, `gaps`, slug `cyclotomic-p-class-fields`.

   **Claim.** Each gap has the same `needs` sentence in the README and in `plan.json` (the repair
   report says all 14 were compared by script and are identical).

   **Witness.** `plan.json` has "embed their Tau Ceti `hilbertClassField`s compatibly" and unqualified
   `hilbertClassField` F, `hilbertClassArtinEquiv`; the README has the three names qualified by
   `TauCeti.ClassFieldTheory.`. The other 13 sentences are identical (compared by script).

   **Repair.** Replace the `needs` value of slug `cyclotomic-p-class-fields` in `design/plan.json` by
   the README sentence of line 131, character for character (from "For the cyclotomic fields" to "of the
   classes of the primes of S."). Nothing else in `plan.json` changes. Tested: after the replacement the
   script comparison gives 14 of 14.

2. **F02** (P3) the block-sum Pontryagin product is cited to a section that does not state it

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:1021`: "StableHomotopyKTheory §4.18 (the
   plus comparison and its block-sum product)"; line 1019: "under which the Pontryagin product of
   BSp∞(ℤ)⁺ is the product on H_*(Sp∞(ℤ);−) induced by block sum".

   **Claim.** StableHomotopyKTheory §4.18 supplies the identification of the Pontryagin product with
   the block-sum product.

   **Witness.** StableHomotopyKTheory §4.18 on main states only B(S⁻¹S)≃K₀(S)×B Aut(s∞)⁺ and
   perfectness of the commutator. The ring statement is §4.6 (H_*(Y;k)≅π₀(X)⁻¹H_*(X;k) "as unital
   graded rings") with §4.9 (Quillen's theorem for groupoids with faithful translations).

   **Repair.**

   1. Line 1021, replace "StableHomotopyKTheory §4.18 (the plus comparison and its block-sum product)"
      by "StableHomotopyKTheory §4.18 (the plus comparison) and §§4.6, 4.9 (the Pontryagin ring
      isomorphism H_*(B(S⁻¹S);k)≅π₀(S)⁻¹H_*(BS;k), whose product on BS is orthogonal sum)".
   2. Line 1019, after "induced by block sum Sp_(2a)(ℤ)×Sp_(2b)(ℤ)→Sp_(2a+2b)(ℤ)" add "(the unit
      component of the localized ring of StableHomotopyKTheory §§4.6, 4.9)".
   3. Line 71 (the StableHomotopyKTheory contract): add "4.6, 4.9" to the section list and the sentence
      "Sections 4.6 and 4.9 are consumed for the homology localization as graded rings."
   4. Layer 8 Dependencies (line 1071): "StableHomotopyKTheory §§3.20, 3.34–3.37, 4.6, 4.9, 4.18, 7.3–7.4".

   Tested on S=the groupoid of §1.1: π₀=ℕ, H₀(BS;k)=k[t], the localized ring is k[t,t⁻¹]⊗H_*(Sp∞(ℤ);k)
   and its degree-zero-component part is H_*(BSp∞(ℤ)⁺;k) with the block-sum product, the statement of
   line 1019.

3. **F03** (P3) ten *Needs* lines cite a supplier section for what is a declared gap of that supplier

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:730`: "ArithmeticGaloisDuality R02.2
   (Hochschild–Serre and transgression)", for §5.3, whose statement is "the relative chain complex
   C_*(G,H;M)=C_*(G;M)/C_*(H;Res M) imported from R02.2". Same pattern at lines 269, 607, 642, 682, 835,
   867, 881, 1007, 1063.

   **Claim.** The cited sections supply the input.

   **Witness.** `README.md:139`: "The homological relative-pair and completed-bar extensions are
   specified below" (they are `gap:relative-homology-edges`, `gap:compact-relative-cocycles`). Five
   other *Needs* lines do name their contract (lines 254, 537, 915, 993, 1025); these ten do not, though
   six of their proof routes mention it.

   **Repair.** Append the contract to each line, and the same words to the matching entry of the
   layer's Dependencies paragraph:

   - line 269 (§0.5), line 730 (§5.3), line 867 (§7.3): "ArithmeticGaloisDuality R02.2 (Hochschild–Serre
     and transgression) and its relative-homology-edges contract";
   - line 835 (§7.1): "ArithmeticGaloisDuality R02.1 (compact coefficients and limits) and R02.2, with
     the relative-homology-edges and compact-relative-cocycles contracts";
   - line 682 (§5.1): "ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.1–2.2 and its
     arbitrary-automorphism contract";
   - line 607 (§4.2): after "PELModuli §§M2.3–M2.4, M2.8–M2.9, M3.9" append "and its
     ppav-embedding-atlases contract";
   - line 642 (§4.4): "EtaleHomotopyTypes §§6.6–6.9 (…) and its graded-Moore-realization contract";
   - line 881 (§7.4): "EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6 (…) and its
     lisse-integral-extension contract";
   - line 1007 (§8.3): "StableHomotopyKTheory §§3.20, 3.34–3.37 and its low-Postnikov contract";
   - line 1063 (§8.6): "IntegralIwasawaTheory §12.3 (specialization at arithmetic weights) and its
     Bernoulli nonvanishing contract".

   Tested on §5.3: with the change its *Needs* line names the owner of C_*(G,H;M), which R02.2 as
   consumed (the contract at line 139 calls its Hochschild–Serre cohomological) does not contain.

4. **F04** (P3) four Checks that test nothing

   **Location and witness.**

   - `README.md:221` (§0.2): "Check that a representative decomposition by Pic(R) is natural as a
     module comparison only after choices, without asserting a canonical product decomposition of ring
     spectra." No object, no value.
   - `README.md:728` (§5.3): "The target presentation must retain the coefficient action in the [gg′]
     relation." Restates the C₂ Check of line 724.
   - `README.md:833` (§7.1): "Continuity of a ℤ_p-module homomorphism is retained in the categorical
     statement." Vacuous: every ℤ_p-linear map between finitely generated ℤ_p-modules is continuous.
   - `README.md:976` (§8.1): "Retain the finite-type hypotheses used by the product and Hurewicz
     comparisons." No object, no value.

   **Repair.** Delete lines 728 and 833 (§5.3 keeps six Checks, §7.1 three). Replace the other two:

   - line 221: "For R=ℤ[√−5] and L=(2,1+√−5) one has L²=(2), so L⊗L≅R and L⊕L≅R⊕L²≅R². On π₀ the ring
     map ℤ[Pic(R)]→K₀(R)=ℤ⊕Pic(R) therefore sends 2[L]−2 to 0 although [L]≠1: it is not injective, and
     tensor classes are not additive classes."
   - line 976: "For X=K(ℤ/p,1) with p odd, H_*(X;ℤ/p) is exterior on x in degree 1 tensor divided
     powers on y in degree 2, with β₁(y)=x up to a unit. H₃(X;ℤ_p)=ℤ/p is generated by β₁(y²/2), and
     y²/2 lies in I₁², so Qᶦⁿᵗ_3=0; I itself lies in odd degrees, so I² is 0 in degree 3 and I/I² would
     keep ℤ/p."

   Tested: (2,1+√−5)²=(4,2+2√−5,−4+2√−5)=(2)·(2,1+√−5,−2+√−5)=(2), the last ideal containing 3 and 2.
   The mod-p reduction of β₁(y²/2) is y·β(y)=xy≠0.

Four findings, all P3 (S01–S04). Every round-1 finding is repaired at this head. The three Lean
theorems are true as typed and agree with the README; no statement of the README was found false.

## Round 1: verification of the repairs

Ids as in the repair report `packages/ArithmeticKTheoryPartII/reports/FIX-RT-ArithmeticKTheoryPartII~1.md`.

| Round-1 finding | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 homology Bockstein is at the pin | repaired | `README.md:49`: "On singular homology the coefficient connecting map has no name of its own but is available"; gap at `README.md:171` now asks only for the Künneth Tor identification; `Suggested.lean:25-28` names the H-space product and the Künneth identification. Pin: `TauCeti/AlgebraicTopology/SimplicialSet/Homology/Coefficients.lean:36`, Mathlib `HomologySequence.lean:282`, `HomologySequenceLemmas.lean:56`. |
| 1a/F02 = 1b/F01 Borel comparison re-planned | repaired | `README.md:1040`: "Apply ArithmeticKTheory §3.4’s borelInvariantFormComparison to G=Sp_(2g), K=U(g) and Γ=Sp_(2g)(ℤ)"; also lines 15, 55, 1049. Supplier head, §3.4: bijective for 4q<rk_ℚ of each almost ℚ-simple factor; Sp_(2g) has ℚ-rank g. |
| 1a/F03 = 1b/F04 gap sentences on this roadmap's objects | repaired (one wording drift, S01) | `README.md:141`: "when HN=G, its relative form H_a(Q;H_b(N,N∩H;M))⇒H_(a+b)(G,H;M)"; `README.md:119`, `:125` restated on supplier carriers. Recomputed: with HN=G, G/H≅N/(N∩H) as N-sets, relative H₀=0, so E²₀₁ is the edge. §7.3 uses N=ker(G→Gal(K_q/ℚ)), for which G_𝔭N=G (FGV lines 2096–2105). |
| 1a/F04 auxiliary prime is Dirichlet | repaired | `README.md:37`: "At modulus p² and a generator of (ℤ/p²)× this gives infinitely many primes ℓ whose classes generate (ℤ/p²)×". Pin: `UnitsCyclic.lean:206` (odd p, any n), `PrimesInAP.lean:431`. |
| 1a/F05 Qᶦⁿᵗ of a non-H-space | repaired (citation drift, S02) | `README.md:1019`: "prove that KSp_i(ℤ)⊗ℤ_p→Qᶦⁿᵗ_i(BSp∞(ℤ)⁺) is an isomorphism". Check at `:1034` recomputed: [[1,1],[0,1]]·[[1,0],[1,1]]=[[2,1],[1,1]], reverse order [[1,1],[1,2]]. |
| 1b/F02 stability with no route | repaired | `README.md:1013`: "Hence HU(ℤ^(2g)) is ⌊(g−6)/2⌋-connected". mirzaiiVanDerKallen2002 line 254: ⌊(n−usr−4)/2⌋; line 293: onto n≥2i+usr+3, bijective n≥2i+usr+4; usr(ℤ)=2 since (S₁) fails at (2,5) and (S₂),(T₃) hold: 2i+5, 2i+6. |
| 1b/F03 Vandiver criterion statable | repaired | `Suggested.lean:120-143` (`pHilbertClassField`, `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber`); `README.md:919-946`. Truth recomputed below. |
| 1b/F05 pinned class fields attributed to a layer | repaired | `README.md:129`: "The Hilbert and narrow Hilbert class fields with their Artin isomorphisms are pinned Tau Ceti declarations". Pin: `RayClassField.lean:241, 246, 262, 293, 306`. |

No repair introduced a false statement. The repairs introduced S01 (the README and `plan.json`
sentences of one gap no longer agree) and S02 (a statement cited to a section that does not make it).

## Running table: Suggested.lean

Six declarations, all read with their elaborated types (the worker's `signatures.md`; no Lean was
run in this read-only pass). No binder lost; nothing changed.

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `exists_split_prime_with_signs` (§2.3) | explicit `p n hp hodd hn`, `K : Type*`, cyclotomic and CM instances, ε on real embeddings of K⁺ | q=3: K⁺=ℚ, t=±7, 7=(3+ζ₃)(3+ζ̄₃)=9−3+1; 2 inert, 3 excluded by `p ∉ span {t}`. General: narrow Hilbert field of K⁺ unramified at finite places, K/K⁺ ramified at p, so disjoint. | true |
| `conjugateFractionalIdeal` | def, real body | ℚ(i): (2+i)↦(2−i), product (5)≠(2+i)²; (1/2)↦(1/2); 0↦0 | determines its object |
| `IsSkewCMLine` | def, real body | ℚ(i), B=ℤ[i]: δ=i/2 true; δ=i false (index 4); δ=−i/2 opposite type; δ=0 false. h(x,x)=2·Im τ(δ)·\|τx\|². | zero form, inclusion-only and wrong sign excluded |
| `exists_cm_lines_with_ideal_product` (§2.4) | as above plus Φ, `hΦ`, L≠0 | 𝔡=𝔭^e, e=p^(n−1)(n(p−1)−1) odd; π=ζ^(1/2)−ζ^(−1/2), π̄=−π, δ₀=π^(−e) skew. B₁=x⁻¹, δ₁=δ₀t; B₂=L·L̄⁻¹·x, δ₂=δ₀/t; B₁B₂=L·L̄⁻¹, a=1. Without `hΦ` (Φ=∅) false. | true |
| `pHilbertClassField` (§7.7) | def, real body, `K : Type` | ℚ(√−26), Cl=C₆: p=3 degree 3, p=2 degree 2; ℚ(ζ₂₃), h=3: p=3 whole field, p=23 K; p=1: K; p=0: `Nat.Coprime n 0 ↔ n=1`, whole Hilbert field | determines its object; prime-to-p model excluded by the C₆ Check |
| `existsUnique_conj_fixed_prime_iff_not_dvd_classNumber` (§7.7) | explicit σ, `hσ`, `hK` | (1−ζ_q) principal, so primes above p are an A-torsor, \|A\| odd; σ fixes some P₀; fixed set A⁺P₀; A⁺≅Cl(K⁺)_p (N∘i=2, i∘N=1+c). q=3: 1 prime, 3∤1. q=37: 37 primes, one fixed, 37∤1. Non-involutive lift x↦x+1 on a plus torsor ℤ/3 fixes none: `hσ` needed. | true |

One-tactic probe, by reading: none of the three theorems follows from one library lemma (no
Chebotarev, no splitting law of `hilbertClassArtinEquiv` at the pins; `library-matches.md` has no
same-name hit). The three definitions are each needed by a theorem. No padding.

Headlines (README Summary): finite, p-adic, locally split and Bott-inverted universality; triviality
in degree 4k−1; Bernoulli divisibility. All need KSp, higher K-groups or relative homology, absent at
the pins (grep: no `KSp`, no relative group homology, abelian varieties only over a field, no Chern
character); each is named in the module docstring. Integral stability (§8.4) is statable on
`Matrix.symplecticGroup` and `groupHomology` only with an added block-inclusion definition; the
docstring says so and calls it a supporting target. No statable headline is absent.

## Running table: README targets (values recomputed in this pass)

| Statement | Instances tried, values | Result |
|---|---|---|
| Conventions: Gaussian line | b(1,1)=i/2: h(1,1)=−2i·i/2=1; ω(1,i)=−Tr(1/2)=−1; h(1,i)=−i; ω(v,iv)=Im(−i·h(v,v))=−h(v,v) | consistent with `exists_compatible` sign |
| §0.1 | π₂ˢ(Bℤ/q₊;ℤ/q): π₂ˢ⊗ℤ/q=0, π₁ˢ[q]=ℤ/q | ℤ/q |
| §0.3 | H²(O′_q,μ^(⊗2k))=Pic/q⊗μ^(⊗(2k−1)), Br(O′_q)[q]=0; ψ⁻¹=+1 on H², −1 on H⁰(μ^(⊗(2k−1))) | agrees |
| §0.5, gap relative-homology-edges | H_*(⟨c⟩;M_q)=0 (c=−1, 2 a unit); absolute HS used with N=Gal(H_q/K_q); (C₂,1), sign ℤ/5: H₁=ℤ/5 by the long exact sequence | agrees |
| §1.1 | odd alternating determinant 0; [[0,2],[−2,0]] det 4; L^s_n(ℤ;−ℤ)[1/2]=ℤ[1/2] for n≡2 mod 4 | agrees |
| §1.2 | q=5: m=8; q=25: 40; φ(q) divides m/2 | agrees |
| §2.2 | Im h=−Σ_Φ 2Re τb=−Tr b; h(x,x)>0 on Φ iff Im τδ>0 | agrees with `IsSkewCMLine` |
| §3.2 | q=5: {1,2}→3, {4,2}→1; i=2: 5≡0, 20≡0; 3bott=−3β_Top=2β_Top | agrees |
| §3.4 | signs (−1)^j on K_(2j−1), K_(2j−2): + in degrees 4k−2, 4k−1; − in 4k, 4k+1; ku⁻ in 4k−2; H⁰(ℤ′,μ^(⊗(2k−1)))=0; degree 0: ×2 | agrees |
| §3.5 | (4/π)²·(24/256)·√125=1.699<2; 346·2=692≡1 mod 691 | agrees |
| §3.6 | K₁^β(ℤ;ℤ/q)=H¹(ℤ′,μ_q), sign −, plus part 0=KSp₁ | agrees |
| §4.4 | H₁(Sp_(2g)(ℤ)): ℤ/12, ℤ/2, 0: zero mod p for p>3 | agrees |
| §5.1 | FGV lines 1617, 1634: lifts and the sum over Φ of w_(στ)⁻¹σw_τ; a·c·a⁻¹=a²c≠c | agrees |
| §5.2 | H=G: M→M initial (f=s′) and terminal (f=π) | agrees |
| §5.3 | n=1: gm−m; n=2: cocycle relation; n=3 signs +,−,+,−; native differential (first face ρ(g₀⁻¹), signs (−1)^(j+1), last (−1)^n) matched term by term under T_n; C₃ on 𝔽₇: 1 against 3; S₃: 1=1+0, 0=−1+1 | chain isomorphism |
| §5.4 | Ext^a_Λ(H_b(H;M),T)⇒Ext^(a+b)_(Λ[H])(M,T): H₀=H₁=0 kills Hom and Ext¹; (m,2m): c(m,2m)=(−m,3m)=(−m,−2m) | agrees |
| §7.1 | Γ=ℤ_p trivial: ℤ_p; Γ=C₂ sign: ℤ_p; Γ=H=1: 0 | agrees |
| §7.3 | G_𝔭↠Gal(K_q/ℚ) (p totally ramified), so G_𝔭·G⁰=G; H₁(G⁰,G⁰_𝔭)⊗ℤ_p=Gal(H_q/K_q); D_q abelian, c central: H_*(D_q;M_q)=0 | agrees with FGV lines 2096–2110 |
| §7.5 | q=5: −1≡3 mod 4; degrees −2, 6 differ by 8 | agrees |
| §7.6 | H¹=H⁰(ℚ_p/ℤ_p(2k)); ℓ=2,p=3,k=1: ℤ₃/(3)=ℤ/3=K₃(𝔽₂)₍₃₎; ℓ=19: 360, ℤ/9; exponent 2k | agrees (corrects FGV footnote 13) |
| §7.7 | see the Lean table; h(ℚ(√−26))=6, h(ℚ(ζ₂₃))=3, h(ℚ(ζ₃₇))=37, h⁺=1 | agrees |
| §8.1–8.2 | K(ℤ/p,1): H₃(;ℤ_p) generated by β₁(y²/2); Tor₁(ℤ/p²,ℤ/p)=ℤ/p, d=1, β₁(x)=pu; a change x→x+ρ(w) changes β_d(x×y) by ±w×β_d(y), in the tensor part | agrees; gap sentence well defined |
| §8.3 | ΣH(ℤ/p): odd degrees 3..2p−3 killed by β₁(yʲ/j!), j≤p−1; fails at 2p−1 (γ_p); Σ²Hℤ: γ_j decomposable for j≤p−1; K(ℤ/p,2): H_(2m)(;ℤ_p) generated by β₁(γ_(m−1)(a)b); X→τ_(≤2p−3)X is onto on H_(2p−2) | true in 1≤i≤2p−3 |
| §8.4 stability | see round-1 table; i=0: g≥6; i=2: g≥10; usr≤3 would give 2i+7 | agrees with the source |
| §8.5 | 4q<g at q=2: g≥9; ch(ω)+ch(ω^∨)=2g kills even characters; untwisted x₂ has χ⁻¹ | agrees; borel1974 line 1249 |
| §8.6 | n_i odd <p gives 2n_i≤2p−4; ch_p has p! in the denominator (line bundle: c₁^p/p!); d=0: 1 and 2 points | true with the strict inequality |
| Gap pontryagin-bockstein-cap | r=2, s=1: d=1; r=s=1: Tor₁=ℤ/p in degree 3 | precise |
| Gap cyclotomic-p-class-fields | pin has the Artin isomorphism and maximality (`fieldRange_le_hilbertClassField_iff`) but no splitting law for `hilbertClassArtinEquiv` and no tower comparison | not already provided |
| Gap lisse-integral-extension | supplier §F.4.5 has lisseRepresentationEquiv for rational sheaves with a lattice, §F.0.2 the finite case; the integral finite-type case is not there | not already provided |

## Dependency check

```
depcheck: 239 roadmaps, 2263 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Verified sound

- Declarations read: 6 of 6. README read in full (1083 lines, 45 *Needs* lines, 42 numbered
  subsections). Checks read: all; 4 are findings (S04), the rest with a computable value were
  recomputed where the tables above show values; none is false.
- Locators verified against the cached texts in this pass: FGV lines 32, 271–278, 1617, 1624–1640,
  2029–2037, 2067–2110, 2190–2194, 2206–2219, 2223, 2236, 2241–2258, 2295–2317, 1533–1537;
  mirzaiiVanDerKallen2002 lines 37–42, 117–125, 129–131, 185–200, 254, 293–296; borel1974 lines 1154,
  1194, 1246–1249. All support the README's statements at the stated strength.
- Pinned declarations opened at the pins (15): `ZMod.isCyclic_units_of_prime_pow`,
  `Nat.infinite_setOfPred_prime_and_eq_mod`, `CategoryTheory.ShortComplex.ShortExact.map_simplicialChains`,
  `CategoryTheory.ShortComplex.ShortExact.δ`, `HomologicalComplex.HomologySequence.δ_naturality`,
  `NumberField.RingOfIntegers.mapRingEquiv`, `hilbertClassField`, `narrowHilbertClassField`,
  `hilbertClassArtinEquiv`, `narrowHilbertClassArtinEquiv`, `gal_hilbertClassField_equiv_classGroup`,
  `fieldRange_le_hilbertClassField_iff`, `Matrix.symplecticGroup`, `groupHomology`,
  the inhomogeneous-chain differential (compared with §5.3 term by term).
- Sibling citations checked for content in this pass: ArithmeticKTheory §§3.4, 6.11 (open head);
  StableHomotopyKTheory §§4.6, 4.9, 4.14, 4.18 (main); ClassFieldTheory Layer 13 (main);
  EtaleCohomologyFoundations §§F.0.2, F.4.0–F.4.6 (main); PELModuli §§M2.4, M6.3; EtaleHomotopyTypes
  §§5.2, 5.3a, 6.6–6.9 (open head, headings); IntegralIwasawaTheory §§3.1, 7.4, 12.3 (headings);
  ArithmeticGaloisDuality R02.2 (heading). The citation resolver reports nothing unresolved.
- Gaps: 14 slugs in `plan.json` and 14 in the README, same suppliers; 13 sentences identical, one
  differs (S01). None has supplier `none`; none asks for something found at the pins or in the
  supplier.
- Policy: the pull request changes only `packages/ArithmeticKTheoryPartII/`; no pull-request number,
  process narrative, `lemma`, `set_option`, `#eval` or sorry'd data in the README or the Lean file;
  imports are `Mathlib` and one existing `TauCeti` module.
- Ownership: `roadmaps grep` finds no other declaration of `pHilbertClassField` or of the other five
  names on main or at any open head; the p-Hilbert field occurs elsewhere in prose only
  (CyclotomicClassGroupsAndStickelberger). No second owner of symplectic stability over ℤ, of the
  relative extension category or of the integral indecomposables was found.
- Wording: nine passages set beside the sources (Conventions against FGV lines 271–278; §5.1 against
  1613–1640; §7.3 route against 2029–2032; §7.6 against 2190–2194; §7.7 against 2036–2040; §8.3
  against 2312–2317; §8.6 statement and route against 2217–2232; §8.4 route against
  mirzaiiVanDerKallen2002 lines 185–200 and 293–296; §8.5 against borel1974 lines 1246–1249). The
  longest shared run is the definition of a hyperbolic sequence, about eight words, forced by the
  mathematics. No table, figure or example list is taken over.
- Arrangement against FGV's sections, by number: Layer 0 ↔ §2 (parts), Layer 1 ↔ §§3.1–3.2, 3.6,
  Layer 2 ↔ §4.2–4.3, Layer 3 ↔ §5 with Theorem 3.5 and Corollary 3.10, Layer 4 ↔ §6.1 with
  Appendix A, Layer 5 ↔ §6.3 with §7.1, Layer 6 ↔ §§7.2–7.3, Layer 7 ↔ §§7.4–7.7, Layer 8 ↔ §8. The
  order is forced by the *Needs* lines (§3.1 needs §§0.1, 1.1, 2.1–2.2; §4.5 needs §3.5; §5.1 needs
  §4.4; §6.1 needs §§3.5, 4.5, 5.1; §7.2 needs §6.3; §8.6 needs §7.4); four layers do not have the
  scope of one source section. No finding.

Source independence: 9 passages compared with 3 sources (FGV, mirzaiiVanDerKallen2002, borel1974), none shared; largest share FGV, 94 of 100 locators; contents compared with FGV: independent (order forced by the dependency lines; Theorem 3.5 moved into Layer 3, Appendix A merged into Layer 4, §§6–7 cut into Layers 4–7 at other points).

## Not verifiable

- `charney1987`, §4 and Corollary 4.5: uncertified; the spectral-sequence step of the stability
  route rests on mirzaiiVanDerKallen2002 Theorem 4.1, which itself refers to Charney's §4 for its proof.
- Elaboration of `Suggested.lean`: taken from the worker's elaborated signatures; no Lean was run.
- Supplier sections other than those listed under Verified sound were checked by identifier only.
- Whether the two clauses of `gap:cyclotomic-p-class-fields` follow in a few lines from
  `TauCeti/NumberTheory/ClassFieldTheory/Global/AdmissibleModulus/Reciprocity.lean:202` (a Frobenius
  law for `rayClassArtinMap`): the link from `rayClassArtinEquiv` to that law was not traced.

## Source issues

- **Gap** in FGV at Theorem 8.4 and its proof, printed p. 50 (FGV lines 2295–2317): the source says the truncation through degree 2p−2 splits as a loop space since the shortest k-invariant of the delooping goes from degree 2 to 2p; it should claim the splitting through degree 2p−3 only, that k-invariant lying inside the truncated range; affects a stated result.
- **Error** in FGV at Theorem 8.1 and the first step of its proof, printed p. 48 (FGV lines 2218, 2223): the source says a prime at least as large as each part makes the Chern characters p-integral; it should be strictly larger, the degree-p character having p! in its denominator; affects a stated result.
- **Misprint** in FGV at Remark 7.9, printed p. 44 (FGV lines 2036–2037): the source says Vandiver's conjecture is equivalent to the set of primes above p being one element; it should be the subset fixed by complex conjugation, as its own argument shows; affects a stated result.
- **Misprint** in FGV at footnote 13, printed p. 47 (FGV line 2193): the source says the invariants of the weight-2k module are taken for the (2k−1)-st power of the cyclotomic character; it should be the 2k-th power; affects nothing.
- **Misprint** in FGV at Theorem 8.4's proof, printed p. 50 (FGV line 2304): the source says the model algebra of a cyclic Eilenberg–Mac Lane space has the boundary of y equal to x; it should be p^k times x; affects the proof.
- **Misprint** in FGV at §6.3 and Theorem 6.6(i), printed pp. 35–36 (FGV lines 1619, 1629, 1636): the source says the lift differences and the Artin map land in the Galois group of H over K; it should be over the CM field E; affects nothing.
- **Misprint** in FGV at Proposition 6.1 and its proof, printed p. 34 (FGV lines 1535–1536): the source says the CM classes are taken in genus φ(q); it should be genus φ(q)/2, the dimension of a CM abelian variety of the cyclotomic field; affects nothing.

## For the human reviewers

- **Licence.** `sources.toml` records FGV from the first author's Berkeley page (`licence_class = "author-page"`); every page and line locator follows that 64-page copy, not the pagination of Inventiones 230.
- **Licence.** `charney1987` is paywalled and uncertified; the stability route of README §8.4 cites it through mirzaiiVanDerKallen2002 Theorem 4.1, whose proof is a reference to it.
- **Scope.** 94 of the README's 100 source locators are to one article (FGV); README §§8.3 and 8.6 are deliberately narrower than its Theorems 8.4 and 8.1, and §7.7 reads its Remark 7.9 for conjugation-fixed primes.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5035c8420207e4fbca022515770de3d2849274b8", "job": "RT-ArithmeticKTheoryPartII~2b", "model": "fable", "worker": "chris-x30"} -->
