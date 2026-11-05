# Review of ModularCurvesPartII (pull request #913 at b12d5ad)

**Verdict:** needs changes

## R01 (P2) — Import the modular quotient from its earlier owner instead of constructing it again

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:4129`: "Construct the quotient by the abelian subvariety `B_f` here: Poincaré complete reducibility … gives a complement C"; the interface list at lines 4131–4142 and the dimension theorem at lines 4176–4180.

**Claim:** §§16.2–16.4 own `modularQuotient`, `modularQuotient_map`, `modularQuotient_kills`, `modularQuotient_lift`, `modularQuotient_baseChange`, `modularQuotient_hecke`, `modularQuotient_hom_ext`, `abelianSubvarietyQuotient`, `modularQuotientForIdeal`, the Tate-module exactness and `dim A_f=[K_f:ℚ]`.

**Witness:** CyclotomicClassGroupsAndStickelberger §4.3 (open head, merge order line 29; this roadmap is line 70) constructs the same objects under the same names: "Construct the shared quotient API `abelianSubvarietyQuotient B C` … Poincaré complete reducibility gives a complement D … put `modularQuotientForIdeal I` … Provide `modularQuotient_map`, `modularQuotient_kills`, `modularQuotient_lift`, `modularQuotient_hom_ext`, `modularQuotient_baseChange` and `modularQuotient_hecke`", and "prove `dim A_f=[E:ℚ]`" and `modularTate_rank_two`. The head added the citation (lines 17, 290, 4123) but kept the construction, the identical API list and the theorem as targets of Layer 16, so one object now has two owners. This is the unfinished part of the previous round's R02.

**Repair:** Reduce §16.2 to the import: `A_f` is `modularQuotient f` of CyclotomicClassGroupsAndStickelberger §4.3, with the Albanese convention and the moduli model named once; delete the construction paragraph and the nine interface bullets listed above (keep only `modularQuotient_lift_map` if it is genuinely not in §4.3, otherwise delete it too). Replace §16.3 and §16.4 by one paragraph citing §4.3's Tate-module exactness, `dim A_f=[K_f:ℚ]` and `modularTate_rank_two`, keeping the level-11, level-23 trivial-character and order-11 character Checks as Checks of the imported statement, and keeping the remark that §14.14's rank-two freeness is the comparison route. §§16.5–16.8 (differentials, the `J₀(N)` isogeny, oldforms, the Abel–Jacobi composite) are genuine additions and stay. On the test instances both owners agree (zero and unit ideals give `J₁(N)` and 0; `E×E/(E×0)=E`; level 11 gives dimension 1), so nothing mathematical is lost by the deletion.

## R02 (P3) — Correct the Gross–Zagier PDF page offsets

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:2394` and 2418: "V §1, p.306 (PDF p.82)"; References, line 4536: "printed page `=` PDF page `+224`".

**Claim:** The MPIM scan's PDF page is the printed page minus 224 throughout.

**Witness:** In the fetched scan, PDF page 31 carries printed page 253 (not 255), PDF page 101 carries printed 306, and PDF page 82 carries printed 290 (GrossZagier lines 1083, 2528, 3104). The scan is not uniformly offset; only the printed page numbers are reliable.

**Repair:** Drop the "(PDF p.N)" annotations for Gross–Zagier in §§6.3, 7.5, 7.6 and the "+224" rule in References; cite printed pages only (III §1 p.255 and V §1 p.306 are correct as printed pages).

## R03 (P3) — Define the abbreviation "CDT"

**Location:** `TauCetiRoadmap/ModularCurvesPartII/README.md:3978`, 4058, 4072, 4076, 4090 and `Suggested.lean` docstrings at lines 118, 145, 160 ("CDT Lemma 4.6.2", "CDT Corollary 4.5.3", "CDT Lemma 4.6.3").

**Claim:** "CDT" names the source of the congruence-class and Ihara lemmas.

**Witness:** The References define no "CDT"; the parenthetical citations in §§15.1–15.10 spell out Calegari–Dimitrov–Tang, while the cached Conrad–Diamond–Taylor text (also "CDT" in this literature) proves the same amalgam-plus-congruence-subgroup-property Ihara lemma at its pp.28–29. A reader cannot tell which paper "Lemma 4.6.2" belongs to.

**Repair:** Add "(CDT)" to the Calegari–Dimitrov–Tang entry in References, or write the full name in the Lean docstrings and in the five README passages.

## Verified sound

The whole README (4579 lines) and `Suggested.lean` (177 lines) were read. The gate record for this head reports every counter zero and `OK`. The dependency check run by this review returned

```text
depcheck: 201 roadmaps, 1326 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. The diff against `origin/main` outside the roadmap folder is empty. No route-specific shortcut, re-planned roadmap (other than R01), copied passage, computational algorithm, sorry'd data, `set_option`, process word or pull-request number was found in the folder.

**Repairs of the previous review.** R01 (Abel–Jacobi sign): §17.3 now reads `α_*AJ_{c′}(x)=AJ_c(α(x))−[α(c′)−c]` (lines 4328, 4340) and carries the level-11 negative-control Check (line 4349); recomputed: with α=id, c′=0, c=∞, x=0 the right side is D−D=0, the old sign gives 2D≠0 for D of order 5. Repaired. R02: partly repaired, see R01 above. R03: `firstCoefficientHeckePairing_baseChange` is gone (line 2381 is prose); gate `readme-ids-missing=0`. R04: anchors removed; gate `residue=0`. R05: NeronModelsAndSemistableAbelianVarieties §4.14 cited (line 170) and the invented JacobianChallengePartII names are gone (line 209). R06: §12.3 now cites LefschetzPencilsAndVanishingCycles §§7a.1–7a.5 for the sequences and labels Ribet–Stein and BDMTV as model references only (line 3211). R07: §16.4 now names the trivial-character level-23 orbit (`K_f=ℚ(√5)`) and the order-11 character negative control; recomputed: `X₁(23)→X₀(23)` is unramified of degree 11 (23≡3 mod 4 and 23≡2 mod 3 kill elliptic points, cusps split), so g=11·2−10=12, each of the ten nontrivial even characters has a one-dimensional eigenspace, the ten forms are conjugate, `K_f=ℚ(ζ₁₁)`, dim 10.

### Computed adversarial pass

| Statement/target | Instances tried | Values computed on each side | Result/change |
| --- | --- | --- | --- |
| 0.1 | scheme; X(1)/𝔽₂ at j=0 | trivial Γ, U=V; stabiliser order 24, 24=0 in 𝔽₂ yet coarse ℙ¹ | no base-change claim; sound |
| 0.2 / Lean headline | id; x↦−x on ℤ_p[[x]], p odd; (x,y)↦(−x,−y) on k[[x,y]], char≠2; diag(ω,ω²) | I_σ=0, (x), (x,y); cotangent ranks 0,1,2; invariants ℤ_p[[x²]] regular, k[[x²,xy,y²]] singular, k[[x³,y³,xy]]/(uv=w³) singular | principal-ideal ⇔ rank≤1 holds under tame plus trivial residue action (complete, lift the eigenvalue, Nakayama on the eigen-decomposition of m); Edixhoven 1.1.4.1 hypotheses match the README exactly |
| 1.1 | Λ=ℤ+iℤ; a₄=−g₂/4, a₆=−g₃/4 | g₃=0, j=1728; Δ=−16(4a₄³+27a₆²)=g₂³−27g₃² | sound |
| 1.2 | lattice hom u=0; translation | u=0 allowed by Milne 3.13 (Hom(Λ,Λ′)={α: αΛ⊂Λ′}); translation moves O | sound |
| 1.3 | u=2, Λ′=2Λ; u=n, Λ′=Λ | index 1, dz↦2dz; degree n² | sound |
| 1.5 | N=3 frames (τ/3,1/3), (1/3,τ/3); N=1 | exp(−2πi(ad−bc)/N) with (a,b,c,d)=(0,1,1,0): ζ₃; swapped: ζ₃⁻¹; N=1: 1 | matches Conventions and §3.13 |
| 2.1 | m=1 model y²+xy=x³, x=t(t+1), y=t²(t+1) | y²+xy=t³(t+1)³=x³; tangent cone y(y+x); b₂=1, b₄=b₆=b₈=0, Δ=0 | sound |
| 2.3 | m=5/ℂ; m=p/char p; N=2 on 1-gon | #Aut=10; rank 2p with 2 points; μ₂ of rank 2 | sound |
| 2.7 | C₆/(order 3 in ℤ/6); u↦u^d at a node | 2 components; nodal fibre length 2d−1≠d | sound |
| 2.9 | 2-gon over ℤ₂, (u,i)↦((−1)^i u,i) | identity mod 2, not mod 4 | sound |
| 2.11 | Ell₆→Ell₃ | 3-torsion meets 3 of 6 components; kernel μ₂ | sound |
| 3.5 | N=12, 11, 1, 4 | 12=3·4 scheme; 11=p^s not; N=1 omitted by Česnavičius 4.3.6 and restored here; Γ₁(4) irregular cusp | sound |
| 3.7 | m=2,3 node fibre | bases 1,x,y (length 3) and 1,x,x²,y,y² (length 5) against generic degrees 2,3 | sound |
| 3.8 | Γ₀(ℓ), Γ₁(5), C_s⁺(13), C_ns⁺(13), ℓ=2 monomial | p+1; 24/12; 26208/288=91; 26208/336=78; order 2, index 3, while the normaliser of C_s(2)={I} is all of GL₂(𝔽₂) | sound; Zywina p.2 notation agrees |
| 3.9 | H̄=GL₂, Γ₁(N), Γ₀(p), rational p-isogeny | 1 structure; φ↦φ(e₁); p+1 étale-locally; a rational Γ₀(p)-structure needs no rational frame (ζ_p∉ℚ) | sound |
| 3.11 | X(1)/𝔽₂ at j=0 | stabiliser 24 not invertible; coarse ℙ¹ via the normal finite locally free degree-one map | sound |
| 3.13 | T, S on (P,Q)=(1/N,τ/N) | T: τ+1, (P,P+Q); S: −1/τ, (Q,−P); e_N(P,Q)=ζ_N⁻¹ | sound |
| 3.14 | N=5, τ=2i, T on the positive frame | τ/(τ+1)=2i/(1+2i)=(4+2i)/5; 1/5 and (4i+1)/5 ∉ ℤ+2iℤ | sound |
| 3.15 | N=3 full→point; N=11 point→cyclic | 3φ(3)=6; stack 10, coarse 5 | sound |
| 4.2 | N=d=5; N=15,d=5; (N,d)=(4,2) | φ(5)/2=2 copies of Spec ℤ, 2 cusps; 2 copies of Spec ℤ[ζ₃], 4 geometric cusps; (4,2) nowhere schematic (Conrad Def. 4.3.3) | sound |
| 4.7 | p=5,7 | (p³−p)/2=60,168; cusps (p²−1)/2=12,24; genus (p+2)(p−3)(p−5)/24=0,3 equals 1+(p²−1)(p−6)/24 | sound |
| 4.8 | σ=S⁻¹, τ=2i | τ_c=i/2, q=e^{−π} against e^{−4π}, z_c=z/(2i); Γ₀(N): w=1 at ∞, N at 0 | sound |
| 4.12 | N=4 naive against refined boundary | naive 2-gon with μ₂ inertia against refined 1-gon | locators Theorems 4.3.5, 4.4.4, §5.10 read; sound |
| 5.1 | N=3,4,6 against 12,15 | p^s or 2p^s not schemes; 12=3·4, 15=3·5 schemes | sound |
| 5.5 | p=3,n=3 charts (2,1),(1,2); n=2 | degrees φ(3)=2 and φ(3)·3=6; 1+27+2+6=36=ψ(27); 1+p²+(p−1)=ψ(p²) | sound |
| 5.6 | E: y²=x³−x, kernel ⟨(0,0)⟩; counts over 𝔽₅ | Vélu image y²=x³+4x; (2x,2√2y) lands on y²=x³+16x; #E(𝔽₅)=8 with affine counts (1,1,2,2,1), #E′(𝔽₅)=4 with (1,0,1,1,0) | sound |
| 5.7 | p=5 | 4 pairing components, 2 after scalars; BT p.714 ramification 2,3,p | sound |
| 5.8, 5.10 | Γ₁(5); Γ(N); C_s⁺(13); C_ns⁺(13) | stack rank 24 against coarse degree 12; |GL₂(ℤ/N)|/2; 91; 78 | sound |
| 5.9 | X₀(N) at j=1728, C stable or not under i | Γ^eff of order 2 gives local degree 1; trivial gives 2 | sound |
| 5.11 | X₀(p); X₁(p); X(5,ζ); X₀(N) | widths 1+p; (p−1)/2·(1+p)=(p²−1)/2=φ(p)ψ(p)/2; 120/10=12 cusps of width 5 summing to 60; Σφ(gcd(d,N/d)) | sound |
| 5.12 | Γ₀, Γ(N), SL₂(ℤ/n) | O_H=ℤ, ℤ[ζ_N], ℤ[ζ_n] | sound |
| 5.13 | N=1,2,5 | ℤ[ζ_N]=ℤ,ℤ,ℤ[ζ₅]; X(5,ζ) of degree 60, X(5)_ℚ of degree 240=480/2 | sound |
| 5.15 | Γ₁(N)→Γ₀(N) for N=3,4,13 | φ(N)/2=1,1,6; −I acts trivially | sound |
| 5.16 | ℓ=2 monomial against normaliser | X(2)/C₂ of degree 3; X(2)/GL₂(𝔽₂)=X(1) | sound |
| 5.19 | prime N=5 | Česnavičius Lemma 6.2 and Proposition 6.3 state exactly the three Katz–Mazur comparisons | sound |
| 5.20 | Γ₁(4)/𝔽₂ | [−1] fixes the Drinfeld ℤ/4-structure on the multiplicative locus; rigid over ℚ | sound |
| 6.2, 6.3 | Γ₀(N)→X(1); X₀(11); full level 5 | ramification N at 0, 1 at ∞; cusps 0,∞ rational; 4 components over ℚ(ζ₅) | sound |
| 7.1 | T, S | multipliers 1 and τ⁻¹; du/u=2πi dz (Conrad, q-expansions, p.2) | sound |
| 7.4 | k=2 branches of T_p; T_{p²} | coefficients p and 1/p (n^{k−1}d^{−k}=a/d); T_p²−p | sound |
| 7.5, 7.6 / Lean headline | N=1; N=11; a₁(T_nf)=a_n(f) | (0,0) perfect vacuously; dimension 1, matrix [1]; both radicals vanish by commutativity (Gross–Zagier V §1 argument); the pinned coefficient theorem has no coprimality hypothesis | sound |
| 8.2 | N=4 in char≠2; level p in char p | ψ(4)=6 not 7; j(q^p)=j(q)^p | sound |
| 8.4 | N=3 | conjugation swaps ζ₃ and ζ₃⁻¹ | sound |
| 9.1 | N=11,p=2; N=10,p=5 | degrees 3 and 5 | sound |
| 9.2 | N=11 diamonds | φ(11)/2=5; I₂I₃=I₆ | sound |
| 9.3 | w_{ζ^j}w_ζ | Ribet–Stein p.71: w_{ζ^j}w_ζ=I_j, w_ζ²=1, w_ζ=w_{ζ⁻¹} | sound |
| 9.4 | N=12 | exact divisors 1,3,4,12; w₃w₄=w₁₂; w₄²=1 | sound |
| 9.5, 9.6 | ℓ=13; ℓ=2 | X_s: 182=13·14, g=8; X_s⁺: 91, g=3; X_ns⁺: 78; widths all ℓ (no nontrivial unipotent in a conjugate of ±Cartan), cusps ℓ+1, (ℓ+1)/2, (ℓ−1)/2 | sound |
| 9.7 | y²=x³−x at 13 | 13=(3+2i)(3−2i) splits in ℤ[i]; Zywina Prop. 3.3 needs −I∈G, det G full, j∉{0,1728} | sound |
| 9.8 | N=1; w₄ on X₀(4) | degree-one quotient excluded by N≥2; w₄(1/2)=−1/2 is fixed | sound |
| 9.9, 9.10 | m=4,6,9; p² relations | σ₁/ψ=7/6, 12/12, 13/12; A_p²=A_{p²}+p⟨p⟩, C_p²=C_{p²}+(p+1)⟨p⟩ since E[p] arises from p+1 chains | sound |
| 9.11 | E₄, p=2, residue 5 | a₀(T₂E₄)=1+2³=9≡4 | sound; Conrad Thm 4.5.1 read |
| 10.1, 10.2 | full level 5; weight 2, p∤N | 4/2/1 components; a_n(T_pf)=a_{np}+p·a_{n/p}(⟨p⟩f) | sound |
| 11.2 | n=1,2; p=5 | f₀=(x^p−y)(x−y^p); multiplicities 1,p−1,1=1,4,1 (Edixhoven p.36) | sound |
| 11.3 | p=5, M=1, n=2, ordinary j=1728 on (1,1) | (x,y)↦(−x,−y) is not a pseudo-reflection; singular (Edixhoven p.35 lists "supersingular or a≠0≠b") | sound |
| 11.7 | ℓ=13,37,61 (k=1,3,5) | exponents 12k(6k+1)=84,684,1860; b₁(K_{k,3})=2k−2=0,4,8; genus 3k²+(k−1)(3k−2)+2k−2=6k²−3k=3,45,135 | sound |
| 11.8 | Baran quartic mod 2 | F+X∂_XF=Y(X+1)²; Y=0 forces X=1 with ∂_YF=1; X=1 forces Y=1 with ∂_XF=1; on Z=0, F=XY(X+Y)² and ∂_ZF=X³ | smooth at 2; sound |
| 12.1 | X₀(11), X₀(13), X₀(17) | masses 1/2+1/3=5/6, 1, 1/3+1=4/3 equal (p−1)/12 | sound |
| 12.3 | nodal genus one; thickness 2 with e=3 | H¹(Y) rank 1, generic rank 2; 6 unit edges | sound |
| 13.1 | N=11, p=2 | π₁*π₁^*=[3] | sound |
| 13.2 | totally ramified degree d; 𝔽_{q²}(t)/𝔽_q(t); k(t)/k(t^p) | Norm P′=P, Con P=dP′, Norm∘Con=d; degree 2; p | sound; `Divisor.conorm`, `conorm_principal` at the pin |
| 13.3, 13.5 | Γ₀(1); Γ₀(11) | rank 0; rank 1 with T₂=−2, T₂−3=−5; ℤ_ℓ-rank 2 | sound |
| 13.7 | P=5 in char 2; P=7 in char 3 | 5≡1 mod 4, 7≡1 mod 3 give dim A/B=1 with A⁰=B⁰=0 | sound |
| 14.6 | ω_f=2πi f dτ | ω_f∧ω̄_g=(2πi)(−2πi)fḡ·(−2i)dx∧dy=−8π²i fḡ dxdy | README correct; Ribet–Stein Thm 5.2's 4π is a source error |
| 14.7 | N=13, j=3 | w*_{ζ³}w*_ζ=⟨3⟩*, reversed ⟨9⟩*=⟨3⁻¹⟩* (Corollary 5.3) | sound |
| 14.9 | Γ₁(11), 𝔽₅, ⟨3⟩ | 3⁵=243≡1 mod 11 so order 5; (P−I)⁵=0; (P−I)(e₁−e₀)=e₂−2e₁+e₀≠0 | sound |
| 14.9a | Γ(3); punctured genus one | 2·0+4−1=3 (Γ(3) free of rank 3); 2 | sound; Hatcher 1A.2 p.84–85, 1B.2 p.88 |
| 14.14 | X₁(11) | dim T=1, dim H¹=2 | sound |
| 15.3 / Lean headline | m=1; ideal (p^k m′) in ℤ[1/p] | kernel is the whole group; (p^k m′)=(m′) so m coprime to p always exists | sound |
| 15.5 | Γ(3), 𝔽₅ | H¹ of dimension 3; congruence quotients have a 3-group, ℤ/4 and perfect factors, so H¹_cong=0 | sound |
| 15.6 / Lean headline | amalgam Γ_N(ℤ[1/p])=Γ(N)*_{Γ(N)∩Γ₀(p)}Γ(N); q=p | transitivity from SL₂(ℤ)→SL₂(ℤ/N) surjective; compatible pair extends to Γ(N)[1/p], CSP kills Γ(M)[1/p] | sound; Conrad–Diamond–Taylor pp.28–29 and Ribet ICM p.512–513 give the same argument; `3 ≤ N` unused |
| 15.7 / Lean headline | congruence character of Γ₁(N) killing parabolics; N=p, M=p² | G=Γ₁(p)/Γ(p²) of order p⁴, [G,G]=span{e,h} (p odd) or span{h+e} (p=2); G^ab generated by images of e₁₂ and e₂₁(p); for general M, g=e₂₁(c/a)·diag(a,a⁻¹)·e₁₂(b/a) and 1+xy+x²y² generates 1+p^vℤ/p^e | ψ=φ=0; Ribet Corollary 4.2 agrees; `5 ≤ N` unused |
| 15.8 | O=ℤ₇[ζ₇], p=29, T_p=6; ℤ/49 with d=8 | 8·43=344=7·49+1; 43·6≡13; det 900−78=822≡38; symmetric 864≡31; both ≡3=−(4−2)² mod 7 | sound |
| 15.9 / Lean headline | nonzero Γ(3)→𝔽₅ | some conjugation difference is non-congruence, else ψ∈H¹_cong=0 | consistent; source text not readable this round |
| 15.10 / Lean headline | N=3, p=11, q=5 | (Γ(3)∩Γ₀(11))/(Γ(3)∩Γ₁(11))≅(ℤ/11)^× of order 10≡0 mod 5; for g∈Γ₀(p) the pair (gψ−ψ,(AgA⁻¹)φ−φ) lies in §15.6's kernel, and Γ₀(p)→SL₂(ℤ/N) is onto, so §15.9 applies | reduces to §15.9 exactly as the README says |
| 16.1 | ℚ×ℚ→ℚ | kernel {0}×ℚ | sound |
| 16.2 | zero and unit ideals; E×E/(E×0) | J, 0; E, identical in CyclotomicClassGroupsAndStickelberger §4.3 | R01 |
| 16.4 | level 11; level 23 trivial χ; level 23 ε of order 11 | dimension 1; K_f=ℚ(√5), dimension 2; g(X₁(23))=12, dimension 10 | R07 repaired |
| 16.6 | N=11 | d=5, v∘u=[5]; diag(1,0) on E² is not an isogeny | sound |
| 17.2 | J₀(11) at 2 and 3 | #E(𝔽₂)=5=2+1+2, #E(𝔽₃)=5=3+1+1 for a₂=−2, a₃=−1 | sound |
| 17.3 | X₀(11), α=id, c′=0, c=∞, x=0 | right side AJ_∞(0)−[0−∞]=D−D=0=left; a plus sign gives 2D≠0 | R01 of round 1 repaired |
| 17.5 | p=11,13,17 | (∏h)(Σ1/h)=6·5/6=5, 1, 3·4/3=4 equal num((p−1)/12); T₂=3 mod 5 | sound |
| 17.7 | J₀(11) at 11, ℓ=5 and 3 | toric μ₅ and Φ[5] of order 5; μ₃ and Φ[3]=0 | sound |
| 17.8, 17.9 | swap on O²; Δ_Q of order ℓ | minus module {(a,−a)}; O-rank ℓ times the O[Δ_Q]-rank | sound |

### Seeded source sample

| Target | Text opened and conclusion |
| --- | --- |
| 1.2 | MilneMF lines 2165–2184 (Propositions 3.12–3.13, printed p.47, pages 41–47 at lines 1855–2185): C/Λ≅E(Λ), every elliptic curve is some E(Λ), Hom(Λ,Λ′)={α: αΛ⊂Λ′} including α=0. DDT lines 610–643 (§1.1, internal pp.17–18): uniformization and homothety ambiguity. Supports the statement. |
| 3.8 | CesMod lines 1246–1263 (§4.1.2, p.28) and 1735–1742 (§4.4, p.39): open H, H̄, left frame quotient (equivalent to the README's right action by inversion); Zywina lines 60–75 (p.2, Cartan notation) and 699–713 (§3.2, p.15, degree [GL₂:G] with −I∈G). Supports the statement. |
| 4.8 | DR lines 5276–5305 (VII §§4.1–4.4, printed 310–311): Tate curve over D and D[q^{1/k}], compatibility of analytic and algebraic charts. ConradClassical lines 142–169 (Prop. 3.1, pp.3–4): local finite-stabiliser quotient charts (the "proper with finite fibres" clause is wrong for an infinite group, as the README notes). ConradQexp lines 34–61 (pp.1–2): dt/t and dw/w=2πi dz. Supports the statement. |
| 4.12 | ConradGen lines 1493–1499 (Thm 4.1.1, p.31), 1753–1755 (Remark 4.2.2, p.36); CesMod lines 1716–1725 (Thm 4.3.5, p.39), 1735–1759 (§4.4, pp.39–40), 2508–2530 (§5.10, p.58). Supports the identification of carriers on the stated ranges. |
| 5.11 | ConradGen lines 1649–1651 (proof of 4.1.1, p.34: cusp charts Spec ℤ[ζ_N][[q^{1/N}]]), 1817–1827 ((4.2.1) and Lemma 4.2.4, p.37, with the ℤ[ζ_N]-compatibility), 1840–1849 (Def. 4.3.1, Lemma 4.3.2, p.37); GrossZagier line 1168 (printed 255). Supports the double-coset description and widths. |
| 5.13 | ConradGen lines 1498–1499 (Thm 4.1.1(3)), 1652–1659 (its proof); CesMod lines 1728–1734 (Prop. 4.3.6, p.39). Supports the statement, with the N=1 correction. |
| 5.15 | ConradGen lines 1761–1774 (Lemma 4.2.3, p.36, finite flat contraction maps including (4) M_{Γ₁(N)}→M_{Γ₀(N)}); ModularCurves on main lines 1935–1948 (§9B) and 2103–2215 (Layer 10, items 1–2). Supports the statement. |
| 5.19 | CesMod lines 2701–2722 (Lemma 6.2, Prop. 6.3, p.63). Exactly the three Katz–Mazur comparisons. |
| 7.1 | ConradQexp lines 34–61; ConradAnalytic lines 732–738 (§7, p.15: [γ]_E is z↦z/(cτ+d)) and 1262–1277 (§11, p.26: dz↦dz/(cτ+d), f·(dz)^k↦(f|_kγ)(dz)^k). Supports the automorphy factor. |
| 9.2 | ConradGen lines 2081–2095 (Lemma 4.4.1, pp.42–43, (ℤ/N)^×-invariants); RibetStein lines 2797–2829 (§5.1, pp.65–66) and 3086–3109 (§5.2, p.71: I_n(E,P)=(E,nP), w_{ζ^j}w_ζ=I_j). Supports the statement. |
| 10.1 | BTAnnals lines 195–236 (§2.1, pp.713–714: two components by square class, PGL₂ exchanges them, ramification p,2,3); ConradGen lines 1873–1943 (Thm 4.3.4, pp.38–39) and 2044–2057 (Thm 4.3.7, p.42). Supports the component count; Conrad's (b,r) indexing is corrected by the README. |
| 10.2 | RibetStein lines 2827–2878 (Theorems 5.1–5.2, Corollary 5.3, pp.65–66); ConradGen lines 2245–2251 (§4.5, p.46: the coherent trace is pT_p). Supports the statement. |
| 13.2 | Tau Ceti `Divisor.conorm` (Conorm.lean:127), `conorm_principal` (:396), `finrank_mul_degree_conorm` (:62), `Place.relativeDegree` (Place/Extension/Basic.lean:469) at the pin. Stichtenoth could not be read (paywalled). |
| 14.9a | Hatcher lines 3687–3698 (Prop. 1A.2, printed 84–85) and 3810–3815 (Example 1B.2, p.88: nonclosed surfaces deformation retract onto graphs). Supports the statement. |
| 15.1 | RibetICM (OCR) lines 290–349 (§4, pp.511–512: Theorem 4.1, Corollary 4.2, Theorem 4.3) and 350–378 (p.513, amalgam, Lyndon, parabolics); Conrad–Diamond–Taylor lines 1202–1222 (pp.28–29, the same argument). Calegari–Dimitrov–Tang Lemma 4.6.2 could not be opened this round (see Not verifiable). |

Additional locators opened: Edixhoven lines 169–178 (Theorem 1.1.4.1, Remark 1.1.4.2, printed p.35, for §0.2 and §11.3) and 188–193 (p.36, for §11.2); GrossZagier lines 3121–3135 (V §1, printed p.306, the perfect pairing argument of §§7.5–7.6); CesMod lines 2726–2760 (Prop. 6.4, pp.63–64, for §5.3).

### Pinned library and Lean audit

The pins are Mathlib `6b7abb3c…` and Tau Ceti `a91d3aaf…` from `lake-manifest.json`. `lake env lean` on a scratch copy of `Suggested.lean` with `#check @name` for all ten declarations elaborated in four seconds with exactly seven `sorry` warnings. Every elaborated type matches its README statement: `regularInvariants_iff_principalInertia` keeps `IsRegularLocalRing A` (which extends `IsLocalRing` and `IsNoetherianRing`, `RegularLocalRing/Defs.lean:51`), `Module.Finite (FixedPoints.subring A G) A`, the unit hypothesis on the residue field and trivial residue action; the three Ihara theorems keep `3 ≤ N` or `5 ≤ N`, both primes, `¬ p ∣ N`, the conjugation equation over ℚ and the agreement hypothesis; the CSP theorem keeps `IsLocalization.Away` and `FiniteIndex`. The one-tactic probe (`first | rfl | simp | infer_instance | simp_all | decide`) fails on all seven theorems: no padding. The `3 ≤ N` and `5 ≤ N` hypotheses of §§15.6, 15.7, 15.10 are unused by the arguments above (P3 note, not a finding), and the explicit `[Algebra ℤ R]` binder duplicates Mathlib's `algebraInt` (harmless, subsingleton).

Declarations opened at the pin: `cuspFormCharSpace` (DiamondOperators.lean:279, the joint diamond eigenspace), `cuspFormCharSpaceOneEquiv` (TrivialNebentypus.lean:220), `heckeTCompositeGamma0` (HeckeRing/GL2/Gamma0/Diagonal/Composite.lean:118), `heckeRingHomCuspCharSpace` (Nebentypus/Action.lean:393), `qExpansion_coeff_one_heckeRingHomCharSpace_heckeTCompositeGamma0` (Nebentypus/Composite.lean:129, `n ≠ 0`, no coprimality), `heckeT_mul_of_coprime` (HeckeRing/GL2/Basic.lean:221), `one_mem_strictPeriods_Gamma1_map`, `qExpansionCoeffₗ`, `LinearMap.IsPerfPair` (PerfectPairing/Basic.lean:39, both maps bijective), `Divisor.degree_smul` (Divisor/Automorphism.lean:69), `principal_smul` (:77), `frickeGL` (Fricke/Matrix.lean:69), `IsAtkinLehnerMatrix`, `Nat.IsExactDivisor`, `integerCuspWidth` (Cusps/Basic.lean), `cosetToCuspOrbit` (Mathlib Cusps.lean:171), `Gamma_le_Gamma_of_dvd` (:142), `map_intCast_zmod_surjective` (:437), `connectedSpace_primeSpectrum_tensorProduct_of_isAlgClosed`, `irreducibleSpace_of_connected_of_isDomain_stalk` (:398), `isLocalRing_of_isPGroup` (:128), `augmentation`, `ker_augmentation_eq_span`, `SymmetricPower.finrank_eq` (Basis.lean:203), `Representation.symmetricPower` (:47), `LocalCoefficientSystem` (:43), `eq_one_or_eq_negVariableChange_of_smul_eq` (Aut.lean:178), `Newform.eq_of_forall_notMem_eigenvalue_eq` (:120), `tateCurve` (TateCurve/Basic.lean:68), `AbelianVariety` (Basic.lean:95), `AbelianVariety.IsIsogeny`, `weilPairing` (:230), `EllAdicCohomology` (:75), `ellAdicSheaf` (:63), `free_of_flat_of_isLocalRing` (LocalRing/Module.lean:299), `quotientKerEquivRange`, `Scheme.Hom.finrank`, `normalization`, `normalizationPullback` (:577), `normalizationDesc` (:372), `normalization.hom_ext`, `derivWeierstrassP_sq` (:1074), `natDegree_cyclotomic` (:316), `coindIso` (Shapiro.lean:58), `H1IsoOfIsTrivial` (:1018), `IsLocalizedModule.map_exact`, `UpperHalfPlane.glAction` (:181), `Divisor.conorm` and `conorm_principal`, `Place.relativeDegree`.

### Headline theorems

The README's headlines are: compact modular uniformization and cusp fields; connected fixed-pairing and twisted curves; integral level stacks, coarse curves and their base-change range; the weight-two differential and perfect Hecke-pairing dictionary; bad fibres and nearby cycles; Jacobian functoriality and integral duality; the Shimura isomorphism and rank-two freeness; CSP, Ihara and congruence invariance; Shimura's dimension theorem; Eichler–Shimura, modular monodromy and Taylor–Wiles freeness. `Suggested.lean` states the seven that are statable at the pins (§§0.2, 7.6, 15.3, 15.6, 15.7, 15.9, 15.10) with the three definitions they need, and its docstring names each absent headline with the missing carrier (generalized elliptic curves, analytification, modular Jacobians, modular cohomology). No statable headline is absent and none is forced through a stand-in. After R01, Shimura's dimension theorem is an import and its docstring line should say so.

### Ownership and suppliers

Every cross-roadmap citation was resolved at its current head or on main: AdicSpacesPartIII R2.11 (main, line 8793; `GroupCurve`, `nGon_*`, `tateCurve_*`, `universalCurve`, `universalLevel`, `moduli L`, `LevelStructure`) and F0.8 (line 3525); ReductiveGroupsPartII RG2.2.4 (main, lines 3408–3714, `BTTree.Vertex`, `Adj`, `isTree`, *sl2-tree*, *ihara-amalgam*); AdelicAlgebraicGroups §4.2 and *strong-approximation-sufficiency* (open head, lines 4231, 4509); EtaleCohomologyFoundations §§0.7–0.8, 0.11 (main, lines 441–582, 1157–1169) and F.1–F.4 names (lines 480, 594, 615, 692, 730); AlgebraicModuliForArithmeticGeometry §5.1 (`NormalInertiaSubgroup`, `Rigidification.stack/stabilizer_kernel/base_change/coarse`), §5.3 (`FiniteCorrespondence.coarse_finite`, `tame_finite_flat_descent`), §5.4 (`finite_schematic_closure`, `normalized_finite_correspondence`, `DMNormalization.finite`), §7.3, §7.5 (`arithmetic_normalization_genericallyEtale`, line 9515), §7.6.1a (`sectionPicardSplit`), §7.9 (`spaceSectionComponentCriterion`), §8.3; ComplexComparisonPartII C-1.1–C-1.3, C1.9, C2.1–C2.2, C3.2d.2–3, C3.2f.1–2, C4.4–C4.5, C5.2 (`GaussManin`), C5.3, C5.6, C5.7 (`curveResidueLocalization`), C6.1–C6.6, with every named declaration present; NeronModelsAndSemistableAbelianVarieties §§3.5–3.7, 4.1–4.7, 4.14 (`SemistableTorsionDatum`), 5.0a, 5.0b, 5.1 and the R11.k layer dictionary (line 684); ArithmeticLocallySymmetricSpaces ALS.F.3, 1.1–1.8, 2.1–2.4, 3.5–3.9, 4.1, 5a.3–5a.5, 6.1–6.3; IntegralHeckeAndGaloisDeterminants §§2.1–2.3; LefschetzPencilsAndVanishingCycles §§7a.1–7a.5; AutomorphicFormsOnReductiveGroups §§5.8, 7.3; AbelianSchemesAndArithmeticModuli A2.1, A2.2, A2.5, A3.1–A3.7, A4.1, A5.1, A5.6, A5.8, A6.2, A6.5, A6.7, A6.25; JacobianChallengePartII §§1.2–1.4; ArithmeticGaloisRepresentations §§2.1–2.2; DerivedModuleAlgebra §§1.T.1, 1.1 (main); CyclotomicClassGroupsAndStickelberger §4.3 (open head, lines 622–694); and on main ModularCurves (0C–0E, 1C, 1D, 2E, 2F, 3C, 3D, 5B, 5C, Layer 6, 7B, 7E, 7F, 8B–8D, 9A, 9B, 9D, 9E, Layer 10), ModularForms (Layers 2–8, 8G, 10), StableReduction (1–4, 7–9), JacobianChallenge (B–F), AlgebraicCurves (6, 12), FuchsianOrbifolds (2–4), AlgebraicTopology (1, 2, 5, 6), ClassFieldTheory. The two resolver leads (ComplexComparisonPartII "R11.k", NeronModels "R11.4") are parsing artefacts of the shorthand paragraph and of the R11 dictionary.

Ownership against the listed open pull requests was checked by object: AdelicImagesAndModularCurves (#1727) explicitly consumes this roadmap's §§3.8, 3.12, 5.8–5.12, 5.15, 6.3, 8.3, 9.5–9.8, Layer 13 and Layer 16 and builds no X_H itself; EllipticCurveModularityPartII, EffectiveDiophantineMethods, AutomorphicGaloisRepresentations, SerreWeightAndLevelOptimisation and the Taylor–Wiles consumers come later in the merge order. The only duplicate owner found is CyclotomicClassGroupsAndStickelberger §4.3 (R01). The Shimura subgroup is not built here (EisensteinIdealAndRationalTorsion carries it); §15.7 only cites it.

## Not verifiable

- **Calegari–Dimitrov–Tang, *The unbounded denominators conjecture* (arXiv:2109.09040)**, §§4.4–4.6 for the locators of §§15.1, 15.2, 15.3, 15.5, 15.6, 15.9, 15.10: three fetches through the sources service (plain URL, v3, v4) hung for more than ten minutes each and were stopped; no cached text exists under this id. The mathematics of §§15.6–15.7 was checked independently (table rows 15.6, 15.7; Ribet ICM and Conrad–Diamond–Taylor pp.28–29 give the same argument), and §15.10 was shown to follow from §§15.6 and 15.9; the statement of §15.9 (Theorem 4.5.2 / Corollary 4.5.3) rests on that paper and is not re-verified in this round.
- **Faltings–Chai, *Degeneration of Abelian Varieties*, III §9 and IV 3.1(vi)** (§7.1a): publisher DOI only, paywalled.
- **Bosch–Lütkebohmert–Raynaud, *Néron Models*, §§2.2–2.3, 7.3** (§17.1): publisher DOI only.
- **Stichtenoth, *Algebraic Function Fields and Codes*, I §4, III §§1, 5** (§§8.2, 13.2): paywalled; the divisor norm identities were recomputed instead.
- **Katz–Mazur 13.4.7** (§11.2): no legal copy found by the service in the previous round; not retried. Edixhoven's restatement (p.36) was read.
- **Serre, ENSJF colloquium 1967, Théorème I5** (§0.2): no legal copy; Edixhoven's restatement (p.35) matches the README's hypotheses.
- Opened but not read in detail this round (legal copies available in the cache): Masser–Zannier §3.1, Illusie §§1–2, Kleiman 5.26, Milne JV §6, Deligne Bourbaki 355, Serre Trees II §1.4 and §2.8, Serre CSP §2.6, Taylor–Wiles Proposition 1 (OCR), Calegari–Geraghty 9.6, Funke–Millson, Shepherd-Barron–Taylor, Caraiani–Newton, Borel–Serre, ACC+23, Anni–Siksek, Stacks tags 0363, 03GV, 00R4, 035J, 02RT.

## Source issues

- **Error** in RibetStein at Theorem 5.2 (Conrad's appendix), printed p.66: the source says the cup product of Shimura classes equals 4π times the antisymmetrised Petersson product; it should be −8π²i for the normalisation f↦2πif dτ and the i-orientation; affects a stated result.
- **Error** in CesMod at Proposition 4.3.6, printed p.39 (published pp.2052–2053): the source says X(n) is a scheme unless n is a prime power or twice one with s≥1; it should also exclude n=1, where inversion survives; affects a stated result.
- **Error** in ConradGen at Theorem 4.3.4, printed pp.38–39: the source says the d-gon stratum for d>2 is indexed by all pairs (b,r) with b a unit mod d and r a positive divisor of d; it should index by b modulo ±1 only, since (C_d,(ζ^r,b)) and (C_d,(ζ^{−r},−b)) are isomorphic, as N=d=5 (two cusps, not eight) shows; affects a stated result.
- **Error** in ConradClassical at Proposition 3.1(1), printed p.3: the source says the quotient map for a discontinuous action is proper with finite fibres; it should say this for the local finite-stabiliser chart, since an infinite group has infinite orbits; affects a stated result.
- **Error** in BTAnnals at §2.2, printed p.715: the source says X(p) is the fine moduli space of generalized elliptic curves with projective full level p; it should say coarse, since −1 fixes every projective frame; affects a stated result.
- **Error** in GrossZagier at III Proposition (1.4), printed p.255: the source says the model is regular except at supersingular points with extra automorphisms; it should also except ordinary points on mixed components with extra automorphisms (Edixhoven p.35); affects a stated result.
