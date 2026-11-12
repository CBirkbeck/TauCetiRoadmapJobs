<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13846#issuecomment-6799889890 -->
Review (claude) of 31f64f5

Verdict: needs_changes

1. **F01** (P3) Two FGV page ranges stop one page short

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:753` "(FGV, Lemma 7.7 and its proof, author copy pp. 39–40; FGV line 1805.)" and README:785 "(FGV, Theorem 7.1, Remark 7.2 and §7.3, author copy pp. 37, 41–42; FGV line 1668.)".

   **Claim.** The proof of Lemma 7.7 ends on p. 40; Theorem 7.1 is on p. 37.

   **Witness.** FGV page markers: p. 41 opens at FGV line 1866 and the proof of Lemma 7.7 ends at FGV line 1871 (the ⟨c⟩-splitting step, which §6.1 uses). Theorem 7.1 opens at FGV line 1668; p. 37 opens at FGV line 1671, so the cited line is on p. 36.

   **Exact repair.** README:753: "author copy pp. 39–41". README:785: "author copy pp. 36–37, 41–42".

   **Repair test.** FGV line 1805 (p. 39, marker at 1764) through 1871 (p. 41); FGV line 1668 (p. 36, marker at 1622) through Remark 7.2 at 1684 (p. 37).

2. **F02** (P3) Three Needs edges are missing from the layers' Dependencies, and one from a contract header

   **Location.** README:269 (Layer 0 Dependencies), README:929 (Layer 7 Dependencies), README:1040 (Layer 8 Dependencies), README:139 "EtaleCohomologyFoundations §§F.0.3, F.4."

   **Claim.** Each Dependencies block lists what the layer's targets need, and each contract header lists the supplier sections consumed.

   **Witness.** README:261 (§0.5 Needs) has "ArithmeticGaloisDuality R02.2 (Hochschild–Serre and transgression)"; README:873 (§7.4 Needs) has "EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6"; README:997 (§8.4 Hodge pairing Needs) has "§4.3–§4.4". None of the three is in its layer's Dependencies block, and §F.0.2 is not in the contract header.

   **Exact repair.** Append "ArithmeticGaloisDuality R02.2 (Hochschild–Serre and transgression)" to README:269; insert "EtaleCohomologyFoundations §§F.0.2, F.4.1–F.4.6 (lisse integral coefficients and restriction)" in README:929; insert "§4.3" before "§4.4" in README:1040; write README:139 as "EtaleCohomologyFoundations §§F.0.2–F.0.3, F.4. Consume the finite étale Galois category and fundamental groupoid of Spec ℤ[1/p], integral/finite Tate twists and lisse coefficient categories with pullback."

   **Repair test.** A script comparing, layer by layer, the supplier and cross-layer entries of all Needs lines with the Dependencies block reports exactly these three omissions; with them added it reports none. EtaleCohomologyFoundations has "## F.0.2 Finite étale Galois categories and the étale fundamental groupoid" on main (its README line 201). The dependency check reads the Needs lines and is unaffected.

Two findings, both P3; none blocking. All seven round-4 findings are repaired, and the three deleted gaps are correctly replaced by citations that resolve at the suppliers' present heads. The mathematics of the targets, the two Lean headlines and the sampled source statements are sound. What remains is two page locators and three omitted entries in the layers' Dependencies blocks (with one supplier-contract header).

## Earlier findings, checked first

| Round-4 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| R01 (P2) classical-symplectic-plus gap not minimal | Repaired | Gap gone from README and from the plan's `gaps` (14 slugs each side). `packages/ArithmeticKTheoryPartII/README.md:275` now reads "by AbelianSchemesAndArithmeticModuli §A5.4 its elementary divisors satisfy (d₁⋯d_g)²=1 … StableHomotopyKTheory §4.18 identifies it with ℤ×BSp∞(ℤ)⁺". §A5.4(1) at that roadmap's head (its README line 2661) gives the symplectic basis with det=(d₁⋯d_g)²; §4.18 (line 1727) is stated for a symmetric monoidal groupoid with faithful translations and a cofinal sequence. Contract line 63 says §4.27 "is not used for KSp". |
| R02 (P2) skew-integer-splitting gap asks for HermitianKTheoryOfPoincareCategories §§8.1, 8.3 | Repaired | Gap gone. README:95 reads "Section 8.1 at R=ℤ and M=ℤ with involution −1 is the fibre sequence K(ℤ)_(hC₂)→KSp(ℤ)→L^short(ℤ;−ℤ)… Section 8.3 gives the natural splitting". §§0.5, 4.11, 6.6, 8.1, 8.3 exist at that head (lines 187, 718, 1022, 1257, 1282) and say what is attributed to them. §3.4's Needs and the Layer 1 and 3 Dependencies cite §§8.1, 8.3. |
| R03 (P2) ChromaticHomotopyTheory CH.2–CH.3 | Repaired (differently: gap deleted, not narrowed) | No occurrence of "Chromatic" or "CH." remains. README:83 cites BordismFormalGroups F6.3 and README:87 GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20. F6.3 on main (README lines 993–999) states the degree normalization 2a(pⁿ−1), the common-iterate theorem vᵃ=wᵇ and intertwining of a map of type-n spectra after equal-degree powers; Adams' maps of degree 2p−2, the tower from p-power Moore spectra, T(n) and L_n^f are in the same section. §1.2 now takes any period m divisible by 2pⁿ⁻¹(p−1); the deletion is justified (see the table). |
| R04 (P3) EH.5, EH.6, G7 | Repaired | README:115 "EtaleHomotopyTypes Layers 5–6. Consume Betti realization of simplicial varieties (§5.2), smooth Čech descent (§5.3a), componentwise graded p-completion (§6.6), the Betti–étale zigzag and its mod-p comparison (§§6.7–6.8) and field-automorphism naturality of discrete points (§6.9)". All six headings exist at that head (lines 867, 886, 997, 1016, 1035, 1043). |
| R05 (P3) no §1.3 in ComplexMultiplicationAndExplicitReciprocity | Repaired | "§§1.2, 2.1–2.2" at README:13, 99, 374, 442, 674, 745 and in the plan's gap; §1.2 "Serre tensor, Lie and period comparisons" is at that head's line 355. |
| R06 (P3) `finiteFieldKGroups` | Repaired | README:53 "Consume §13.8c’s finite-field calculation"; README:897 "(the finite-field calculation of §13.8c)". The name no longer occurs. |
| R07 (P3) "pp." for single pages | Repaired | "p. 29", "p. 22", "p. 60", "p. 38", "p. 44", "p. 50" at README:448, 535, 580, 700, 911, 971; no single-page "pp." remains. |

The repaired patterns were searched for in the whole package: stale section identifiers (every cited section of 25 supplier roadmaps resolved by heading, below), names attributed to the wrong owner (all 39 distinct backticked items resolved), page-range form. The page check over every FGV locator, not only the sample, produced R01.

## Verified sound

Read in full: the README (1051 lines, 9 layers, 42 target subsections), `Suggested.lean`, `metadata.toml`, `sources.toml`, the plan's 14 gaps, the round-4 review and its repair report, and the diff of the repair. Counts: 7 earlier findings checked (7 repaired); 15 seeded targets read at their FGV locators (15 support the statement; page slips only in R01, found by checking the page range of every parenthesised FGV locator in Conventions and the layers against the page markers and the statement index: two slips among about fifty); 3 Borel locators checked; 4 Lean declarations elaborated and compared; 20 one-tactic probes (none closes); 25 supplier roadmaps opened at their present heads and every cited section or name, over 100, resolved (all found); 17 pinned declarations opened; 47 computed rows below. No maintainer notes were left for this roadmap.

### Sources: seeded sample

All against the cached 64-page FGV author copy. The author flags no locator as unverified.

| Target | Text read | Result |
| --- | --- | --- |
| 0.1 Universal cyclic Bott class | FGV lines 350–400 | §2.1.1, diagram (2.1), Lemma 2.3 (p. 8), proof and Remark 2.4 (p. 9). Bockstein then Hurewicz characterizes β for odd q; q>4 for the ring structure; q=3 by Remark 2.19; character jᵃ multiplies by a. Exact. |
| 0.3 Cyclotomic Picard classes | FGV lines 598–648 | Corollary 2.12 (p. 14, FGV line 615), Remark 2.13 (p. 15). Formula (2.8), + eigenspace, Galois equivariance. Exact. |
| 1.1 Betti and Hodge maps | FGV lines 789–850 | §3.1 (p. 18), Definition 3.2, §3.2.2 and (3.1)–(3.2) (pp. 18–19); unitary-to-symplectic functor by Im h. Exact. |
| 2.1 Hermitian coefficient-line groupoids | FGV lines 1078–1126 | §4.2, Definitions 4.3–4.4 (pp. 24–25); P⁺, P⁻ with the negated conjugation; action bifunctor. Exact. |
| 3.2 Hodge type character formula | FGV lines 1331–1400 | (5.5), Proposition 5.2 and proof (pp. 30–31, FGV line 1378). README's "span is all of ℤ/q" follows from the proof's difference −2. Exact. |
| 4.3 Betti model | FGV lines 2756–2797 | Proposition A.13 (p. 60, FGV line 2786); A.3 opens at FGV line 2665 (p. 58). Exact. |
| 5.3 Relative bar convention | FGV lines 1722–1746 | (7.5)–(7.8), p. 38; C₀(G,H;M)=0 at FGV line 1738. Exact. |
| 5.4 Universal relative extension | FGV lines 1747–1777 | Lemma 7.4 (p. 38), Lemma 7.6 (a), (b) (pp. 38–39). Exact. |
| 6.1 Finite arithmetic Galois action | FGV lines 1805–1871 | Lemma 7.7, statement pp. 39–40, proof pp. 40–41. Statement supported; page range is R01. |
| 6.2 CM reciprocity identifies the cocycle | FGV lines 1874–1965 | §7.3, (7.12) on p. 40 through (7.19) and the final formula on p. 42. Exact. |
| 7.2 p-adic universal extension | FGV lines 1968–2021 | §7.4 (p. 43), Theorem 7.8 (pp. 43–44, FGV line 2009). Exact. |
| 7.4 Universal locally split extension | FGV lines 2044–2061, 2111–2121 | Theorem 7.10 and Remark 7.11 (pp. 44–45), proof p. 46 (uniqueness from an element acting by −1). Exact. |
| 7.6 Trivial action in degree 4k−1 | FGV lines 2154–2194 | §7.7, Remark 7.16 (p. 47), footnote 13 (FGV lines 2190–2194). README's exponent 2k is right; the footnote's is a misprint (Source issues). Exact. |
| 7.7 Vandiver and conjugation-fixed primes | FGV lines 2028–2043 | Remark 7.9, p. 44. README states the corrected form (c-fixed primes). Exact. |
| 8.2 Product formula | FGV lines 2318–2338 | Lemma 8.5 (pp. 50–51); finite type; Tor generator β_d(xy), d=min(k,l). Exact. |

Also read: Proposition 4.7 and Lemma 4.8 with proofs (FGV lines 1232–1293), which the two Lean headlines cite; Theorem 7.1 and Definition 7.3 (FGV lines 1668–1719); Theorems 7.14, 8.1, 8.4 and (8.2) (FGV lines 2133–2143, 2217–2259, 2295–2317); borel1974 lines 1154, 1194, 1246–1253 (§10.6 on printed p. 265, Theorem 11.1 on p. 266, §11.4 on p. 267, with Sp₂ₙ giving a polynomial algebra on degrees 4i−2).

### Computed adversarial record

"Retain" means the computed instance agrees; it is not a proof. Rows for text no repair touched that are not recomputed here rely on the round-2 to round-4 tables, which carry values for every section.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 object classification (new) | rank 0, 2, 3; [[0,2],[−2,0]] | rank 0: empty product, g=0; h: det 1; odd rank: det(A)=det(−Aᵀ)=−det(A)=0; det 4, d₁=2 | Objects are hᵍ, g≥0 | Retain |
| §1.1 §4.18 hypotheses (new) | sₙ=hⁿ, aₙ=h | sₙ₊₁=sₙ⊥h; f⊥id_h restricted to hⁿ is f; K₀(S)=ℤ | Hypotheses of §4.18 hold | Retain |
| §1.1 hyperbolic functor (new) | P=ℤ, basis e, e* | ω(e,e*)=e*(e)−0=1, ω(e*,e)=−1, ω(e,e)=0: matrix [[0,1],[−1,0]]; A↦diag(A,(Aᵀ)⁻¹): (A⁻ᵀη)(Ax)=η(x) | Lands in Sp, r↦r | Retain |
| §1.1 component maps (new) | g=0, 1, 2; r=0, 1, 2 | forget: 0, 2, 4; hyperbolic: 0, 1, 2; c_B H: 0, 2, 4=(1+ψ⁻¹)r | Law 3 consistent | Retain |
| §1.1 splitting law (new) | degree 0; degree 2, q odd | c_B lands in K⁺ (form gives P≅P∨); c_B H=2 on K⁺; ℤ[1/2]→ℤ[1/2] by 1↦h, retraction (1/2)·2=1, W₀(ℤ;−ℤ)=0; degree 2: K₂⁺[1/2]=0, W₂=ℤ[1/2] | H(K⁺)⊕ker c_B, ker c_B≅W | Retain |
| GeometryOfNumbers contract: skew L-groups (new) | n=0..7 | L^s_n(ℤ;−ℤ)=L^s_(n+2)(ℤ): 0, 0, ℤ, ℤ/2, 0, 0, ℤ, ℤ/2; after inverting 2: ℤ[1/2] at n=2, 6 | "n≡2 mod 4" | Retain |
| §8.1 at (ℤ,−ℤ) equals S (new) | ℤ; 𝔽₂ line [1] | 2b(x,x)=0 ⇒ b(x,x)=0 over ℤ; over 𝔽₂ b(1,1)=1 is skew, not alternating | Identification valid over ℤ only, as stated | Retain |
| §1.2 period law (new) | q=3, 5, 9, 25, 27 | 2pⁿ⁻¹(p−1)=4, 8, 12, 40, 36; φ(q)=2, 4, 6, 20, 18=m/2 at the least m | χ^(m/2)≡1 mod q | Retain |
| §1.2 negative control (new) | q=25, m=8 | 2⁴=16≢1 mod 25 | Period 8 would change the twist | Retain |
| §1.2 existence without the deleted gap (new) | n=1, 2 at p=5 | Adams degree 8; a power of degree 8a, then its 5th power: 40a | F6.3 suffices | Retain |
| §3.4 p-adic table | i≡0, 1, 2, 3 mod 4, i>0 | K_i⁺: ψ⁻¹=(−1)^(twist): twist 2k+1 gives −1 at i=4k, 4k+1 (zero + part); +1 at 4k−2, 4k−1; π_i(ku)⁻: ℤ_p only at i≡2 | 0, 0, K⊕ℤ_p, K | Retain |
| §3.4 Checks | degree 0; p=3, degree 3 | 2 invertible mod odd q; K₃(ℤ)=ℤ/48, 3-part ℤ/3 | Agree | Retain |
| §3.2 type sums | q=5, i=1, 2 | {1,2}: 3, 0; {4,2}: 1, 0; difference 2 (unit) at i=1 | Oddness needed | Retain |
| §3.2 coordinate | 3·bott | −3β_Top=2β_Top mod 5; Chern value 3 | bott=−β_Top consistent with §0.1 | Retain |
| §0.1 normalization | q odd | π₂ˢ(S;ℤ/q)=0 (π₁ˢ=π₂ˢ=ℤ/2); H₂(Bℤ/q;ℤ)=0 so H₂(−;ℤ/q)≅H₁[q]=ℤ/q | β unique | Retain |
| §0.3 eigenspace | [L]−1, β²ᵏ⁻¹ | ψ⁻¹: −1 and −1; product +1 | Positive summand | Retain |
| §0.4 Check | q=9, twist 4 (i=3) | a³≡1 mod 9 for a∈{1,4,7}: index 2, field of degree 2 against [K₉:ℚ]=6 | Full-cover gap needed | Retain |
| §3.5 Checks | q=5; q=691 | (4/π)²·(24/256)·√125≈1.699<2; 346·2=692≡1 mod 691 | Agree | Retain |
| Conventions: Artin direction | Frob₂ on μ₅, twist 3 | 2³=8≡3; 3³=27≡2 | Arithmetic ≠ geometric | Retain |
| Conventions: Gaussian form | b(1,1)=i/2 | h(1,1)=−2i·(i/2)=1; ω(1,i)=−Tr(1/2)=−1; Im h(1,i)=−1 | Im h=ω, native J is −i | Retain |
| §2.3 Check | q=3 | (3+ζ₃)(3+ζ̄₃)=9−3+1=7; 2 inert | Agree | Retain |
| §2.4 Checks | ℚ(i) | 𝔡⁻¹=(1/2)=(i/2); (i)=𝓞 of index 4 in (1/2)𝓞; (i/8)(2)(2)=(i/2) | Agree | Retain |
| §5.1 Check 4 | a of order 3, c a c⁻¹=a⁻¹ | a c a⁻¹=a²c≠c | Agree | Retain |
| §5.4 Check 4 | C₂, H=1, sign ℤ/5 | H₁(C₂;M)=0, H₀(C₂;M)=M/2M=0, so H₁(G,1;M)≅H₀(1;M)=ℤ/5 | Agree | Retain |
| §5.4 Lemma 7.6 route | H₀(H;M)=0 | Hom_(Λ[H])(M,T)=Hom_Λ(M_H,T)=0 | Section unique | Retain |
| §6.2 weight | χ=2, k=2, q=5 | 2³=8≡3 | Exponent 2k−1 | Retain |
| §7.1 Checks | C₂ sign ℤ_p; Γ=ℤ_p trivial | H₁=0, H₀=ℤ_p/2=0: relative H₁=ℤ_p; second: coker of H₁(1)→H₁(ℤ_p)=ℤ_p | Agree | Retain |
| §7.5 Check | q=5, k=0, 2 | −1≡3 mod 4; degrees −2, 6 differ by 8 | Agree with new §1.2 | Retain |
| §7.6 restriction | (p,k,ℓ)=(3,1,2), (5,1,2), (3,1,19) | 2²−1=3: ℤ/3=K₃(𝔽₂); 3 a 5-unit: 0; 19≡1 mod 9, 19²−1=360: ℤ/9≠ℤ/3 | Exponent 2k; generator hypothesis needed | Retain |
| §7.7 torsor | minus ℤ/3; plus ℤ/3 | c(x)=−x fixes 1 of 3; c(x)=x fixes 3 | c-fixed, not all, primes | Retain |
| §8.2 Check | K(ℤ/p,1)² | Tor(ℤ/p,ℤ/p) in degree 1+1+1=3 | Agree | Retain |
| §8.3 range | K(ℤ/p,1), K(ℤ,2), a spectrum with π₁ and π_(2p−2) | degree 2n−1 class β(y_n) is decomposable iff some C(n,a) is a unit: fails first at n=p; γ_p indecomposable in degree 2p; stable P¹ has degree 2p−2, so it links π₁ to π_(2p−2) | Splitting certain only through 2p−3 | Retain (source gap recorded) |
| §8.4 bounds | i=0, 2; p=5, m=3, 4 | g≥6, g≥10; 2m=6≤7, 8>7 | Agree | Retain |
| §8.6 denominators | p=3, part 3 | 3!=6, v₃=1 | Strict n_j<p needed | Retain (source gap recorded) |
| §8.5 | degrees 2, 6, 10; χ=2 | 4k−2 for k=1, 2, 3 (borel1974 line 1249); 1/2, 1/4 on x₂, x₂² | Agree | Retain |
| Lean split prime | q=3 | t=±7, (7)=(3+ζ₃)(3+ζ̄₃), P≠P̄; 3∉(7) | True instance | Retain |
| Lean `IsSkewCMLine` | ℚ(i): δ=i/2, i, 0 | 𝔡⁻¹; unit ideal; excluded by δ≠0 | Discriminates | Retain |
| Lean CM lines | L=(c) | L·(L̄)⁻¹=(c/c̄), principal: B₁=B₂=𝓞, δ generating 𝔡⁻¹ with the sign of Φ₀, else twist by (X, t⁻¹) | Consistent with Proposition 4.7 | Retain |
| Probes | 2 theorems × 10 tactics | `simp`, `rfl`, `infer_instance`, `exact?`, `aesop`, `decide`, `simp` with both definitions, `trivial`, `tauto`, `omega`: 20 of 20 fail | No padding | Retain |
| Gaps | README against plan | 14=14, symmetric difference ∅, supplier and `needs` equal | Declared | Retain |
| Gap cyclotomic-p-class-fields | pinned Tau Ceti | `hilbertClassField` exists; no p-part fixed field, tower compatibility or split-at-p comparison | Still needed | Retain |
| Gaps at suppliers' heads | ArithmeticGaloisDuality, KTheoryFiniteLocalFields, StableHomotopyKTheory, ArithmeticKTheory §6.11 | no relative group homology; no sphere-unit map; no "2p−3" Postnikov splitting; descent stated for E=F(μ_m^(⊗i)) only | Still needed | Retain |
| Merge order | positions | this roadmap 340; latest supplier GeneralAlgebraicKTheoryPartII 336; BordismFormalGroups on main; ChromaticHomotopyTheory (338) no longer cited | No upward edge | Retain |
| §6.1 locator | FGV markers | proof ends FGV line 1871; p. 41 opens at 1866 | Range short | R01 |
| §6.3 locator | FGV markers | Theorem 7.1 at FGV line 1668; p. 37 opens at 1671 | Range short | R01 |
| Dependencies blocks | 9 layers | Needs entries absent: Layer 0: 1; Layer 7: 1; Layer 8: 1; others 0 | Incomplete | R02 |
| EtaleCohomologyFoundations contract | header against Needs | header F.0.3, F.4; Needs F.0.2, F.4.1–F.4.6 | F.0.2 absent | R02 |

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0; the only messages are "declaration uses `sorry`" at 52:8 and 95:8. No `TauCeti.*` import is used. A scratch copy with `#check @` for the four declarations was elaborated once: every binder is kept (p, n, primality, p≠2, 0<n, the field, number-field, cyclotomic and CM instances, ε, Φ with its one-per-pair hypothesis, L≠0) and each type equals the README statement at §§2.3–2.4; nothing changed. The file has one `import Mathlib`, one namespace, one layer comment, a docstring on every declaration, two theorems and two definitions with real bodies; no `set_option`, `lemma`, sorry'd data, admitted example, `#eval`, `#synth` or `#print`.

Headline inventory (Summary and layers): §§2.3 and 2.4 are stated. Named in the module docstring as not statable, each with its missing carrier: the Picard–Bott and Artin–transfer comparisons, Betti–Hodge splitting, the height-one comparison, CM generation, the coherent action and finite-genus detection, groupoid CM reciprocity, the universal relative extension, the finite, p-adic, locally split and all-twist universality theorems, degree 4k−1 triviality, the Vandiver criterion, the indecomposable product and Hurewicz theorems, the stable symplectic and rational Hodge comparisons and Bernoulli divisibility. Checked at the pins: no higher K-groups, KSp, relative group homology or Pontryagin-homology carrier in either library; Tau Ceti's `AbelianVariety` is over a field, with no polarization, relative abelian scheme or Hodge bundle, so §8.6 is not statable; the p-Hilbert field H_q is not defined. Finite-rank stability (§8.4) is declared a supporting target in the docstring, as settled in round 1.

### Pinned declarations opened

`NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142); `NumberField.exists_ideal_in_class_of_norm_le` (`Mathlib/NumberTheory/NumberField/ClassNumber.lean:78`); `FractionalIdeal.spanSingleton` (`Mathlib/RingTheory/FractionalIdeal/Operations.lean:575`), `ringEquivOfRingEquiv` (:972); `FractionalIdeal.dual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:230`); `Module.Invertible` (`Mathlib/RingTheory/PicardGroup.lean:77`), `CommRing.Pic` (:429); `groupHomology.inhomogeneousChains` (`Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:122`); `CategoryTheory.Under` (`Mathlib/CategoryTheory/Comma/Over/Basic.lean:631`); `Representation` (`Mathlib/RepresentationTheory/Basic.lean:48`); `LinearMap` (`Mathlib/Algebra/Module/LinearMap/Defs.lean:84`); `TauCeti.SymplecticForm.exists_compatible` (`TauCeti/Geometry/Symplectic/ExistsCompatible.lean`); `TauCeti.NumberFieldArithmetic.artinHomAway` (`TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean`). The three Layer 13 names the README attributes to ClassFieldTheory are that roadmap's (its README lines 1962–1966) and are formalized at the pin: `hilbertClassField` (`TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RayClassField.lean:241`), `narrowHilbertClassField` (:246), `gal_hilbertClassField_equiv_classGroup` (:293); the citation through the roadmap is valid and needs no change. The library-matches file was read for all four declarations: no candidate states either headline.

### Cross-roadmap citations resolved

Main is `8f0def6`; open heads are those of the index of 2026-11-11. Every cited section was found as a heading (or, for GeneralizedCohomology and AlgebraicTopology, as the numbered item or stage the supplier itself names) at: ArithmeticKTheory §§3.1, 3.5, 5.2, 6.11 (`cyclotomicH2Descent`), 6.15, 6.16, 7.1, 7.5; GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c; SchemeKTheoryOperations §§6.1, 6.9–6.11; StableHomotopyKTheory §§3.20, 3.27, 3.34–3.37, 4.16–4.18, 4.21, 4.24–4.27, 5.1, 5.19, 7.1, 7.3, 7.4, 7.7, 7.9, 7.13, 7.17, 7.28; GeneralizedCohomology G2 (items 1–8), G3 (item 8), G5 (items 4–6); SymplecticGeometry CotangentLagrangian C2.0, C2.1; TopologicalKTheory T4, T5, T7; BordismFormalGroups F6.3; GeneralAlgebraicKTheoryPartII §§4.1–4.3, 4.20; GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories §§0.5, 4.11, 6.6, 8.1, 8.3; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.1, 2.2; AbelianSchemesAndArithmeticModuli A5.4, A5.5, A5.8; PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; EtaleHomotopyTypes Layers 5–6, §§5.2, 5.3a, 6.6–6.9; ClassFieldTheory Layers 11–13; Chebotarev Layer 10; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2; ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4; AlgebraicTopology Stage 6 (§§6.0–6.6); BorelRegulators §2.1 (named in Scope as a non-supplier).

### Ownership, duplication and overlaps

The overlap file lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines. A search of main and the open heads for symplectic K-theory and KSp finds it used, not owned, elsewhere; the instance KSp(ℤ)≃ℤ×BSp∞(ℤ)⁺ is owned here in §1.1 as a specialization of StableHomotopyKTheory §4.18, and the GW–L sequence and its splitting are cited to HermitianKTheoryOfPoincareCategories. None of the four fully qualified names of `Suggested.lean` occurs on main or in any open roadmap pull request. The three supplier requests withdrawn by the repair leave no orphan: no README text still refers to them.

### Gaps

All 14 slugs, suppliers and `needs` texts are identical in README and plan, each with a named earlier supplier and each under the supplier's contract subsection. None asks for something a supplier, Mathlib or Tau Ceti states at the heads and pins read.

### Supplier order

```text
depcheck: 207 roadmaps, 1931 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line.

### Shape and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, nine layers each ending with Examples and Dependencies, Downstream consumers and References are present. Every definition block has its laws and at least three Checks (3–7); every theorem has hypotheses and a locator. Layers are named by their mathematics and ordered by their Needs lines. No LaTeX delimiters, process words, pull-request numbers, HTML anchors or machine paths. The four backticked names of this roadmap's own are declared in `Suggested.lean`. The three cited works are in the manifest, one key each.

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled); not requested. FGV gives g≥2i+5 at FGV line 33 and i<(g−5)/2 at FGV line 2236; the README's strict g>2i+5 is the range both support.
- The FGV author copy was not collated against the journal pagination; locators refer to the author copy, as the manifest says.

## Source issues

- **Misprint** in FGV at the proof of Corollary 2.12, p. 14, FGV line 628: the source puts the Bott product of an H² class with twist 1 in twist 2k−1; it should be twist 2k, as in Lemma 2.11; affects nothing.
- **Misprint** in FGV at Remark 2.13, p. 15, FGV line 645: the source says finite-coefficient K₀ splits as ℤ plus the Picard group; it should be ℤ/q plus the Picard group modulo q; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be those of the integers of the real subfield; affects nothing.
- **Misprint** in FGV at §5.1.2, p. 30, FGV line 1353: the source calls the q-th roots of unity the automorphism group of a skew-Hermitian line; it should be a subgroup of the norm-one units, which also contain −1; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source asks the section followed by the projection, composed in the wrong order, to be the identity of M; it should be projection after section; affects nothing.
- **Misprint** in FGV at §7.3, p. 41, FGV line 1903: the source gives the transported line class the Bott exponent k−1; it should be 2k−1, as in the adjacent display; affects nothing.
- **Misprint** in FGV at Theorem 7.8, p. 43, FGV line 2014: the source calls the sequence one of G-modules with conjugation inside G; it should be the group Γ of the theorem; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole set of primes above p being a singleton; it should be the conjugation-fixed subset; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47, FGV line 2193: the source lets the unit group act on the divisible module of twist 2k through the (2k−1)-st power of the cyclotomic character; it should be the 2k-th power; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60, FGV line 2775: the source lists the abelian scheme twice in the rigidified tuple; it should be the scheme, its polarization and the action; affects nothing.
- **Misprint** in FGV at §1.1, p. 1, FGV line 33, against §8, p. 48, FGV line 2236: the source gives the stability range once as g≥2i+5 and once as i<(g−5)/2; it should be one range, to be settled from the primary source; affects nothing.
- **Gap** in FGV at Theorem 8.1, p. 48, FGV lines 2218 and 2223: the source allows p equal to the largest part and says the Chern character is then p-integral; it should require p larger than every part, since the factorial of p is not a p-unit; affects a stated result.
- **Gap** in FGV at the proof of Theorem 8.4, p. 50, FGV lines 2312–2316: the source splits the truncation through degree 2p−2, though the first reduced power links degrees 1 and 2p−2; it should justify the splitting only through degree 2p−3; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "31f64f526c5e6f97b613619b4b5db4c99eeb4e29", "job": "REV-PKG-ArithmeticKTheoryPartII~5", "model": "fable", "worker": "chris-l"} -->
