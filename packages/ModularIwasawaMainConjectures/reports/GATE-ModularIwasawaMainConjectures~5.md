# GATE-ModularIwasawaMainConjectures~5: answers to human review

## H01 (CBirkbeck) — applied

§0.10 (README line 574) said Kato (17.13.1) had the scalar dual X at the same prime 𝔭 as the natural compact terms. It now says that the Poitou–Tate map is Λ-linear into `X^{ι_Γ}=D_Λ(Sel)^{ι_Γ}`, because Φ(gc)(s)=⟨c,g⁻¹s⟩. The section names C=(H¹/Z)(T_K(1)), J (the local quotient by the image of Z) and H=H²(T_K(1)), and states the natural sequence 0→C→J→`X^{ι_Γ}`→H→0. It then applies ι_Γ to every term, including Z, which gives 0→`C^{ι_Γ}`→`J^{ι_Γ}`→X→`H^{ι_Γ}`→0, with 𝔭′=ι_Γ(𝔭) recorded. The natural-coordinate element `k_{ω,γ,1}` is now distinct from its scalar transport, with `(K_{ω,γ,1})=(ι_Γ(k_{ω,γ,1}))`. The prime-by-prime statement is now length(X_𝔭)=ord_𝔭(K) iff length(H_𝔭′)=length(C_𝔭′). Because ι_Γ permutes the height-one primes not containing p and fixes (ϖ), the global `kmc_iff_char_eq_defect_mul` stays as it was.

The same pattern is repaired in three other places:
- §0.9 now says its transport targets the scalar-dual coordinate and includes ι_Γ (Kato's function is the Coleman image of z in the natural coordinate, Kato Theorem 16.6, p.271).
- Conventions (line 41) now says the ordinary Poitou–Tate map lands in `D_Λ(Sel)^{ι_Γ}`.
- The p=2 paragraph now gives Kato's X(T) (Kato 17.3, p.273) the contragredient action that makes (17.13.1) linear. The proof sketch says the scalar form comes from applying ι_Γ to the whole sequence.

Two Checks are added to §0.10:
- In Z_7[[t]], ι_Γ(t−7)=−(8t+7)/(1+t). M=R/(t−7) and `M^{ι_Γ}≅R/(t+7/8)` have lengths 1 and 0 at (t−7), and neither prime contains 7.
- Z/49 with γ acting by 8 and the paired compact line by 43=8⁻¹ (8·43=344≡1 mod 49).

## H02 (CBirkbeck) — applied

§1.5 (line 909) said "the dual lattice U ≅ T*(1−k)". It now reads "a stable O-lattice U of the cohomological realization, such as T_B of §0.9". It adds that Kato 17.6 (Kato line 6109) writes this lattice as an O-linear dual Hom_O(T′,O)(1−k) in his own notation, and that this is not the discrete T* of Conventions. A new §1.5 Check computes, at weight two, p=3, κ(g)=4:
- T_B≅T_pE(−1) has determinant κ⁻¹, value 1/4.
- Hom(T_pE,Z_p)(−1)≅T_pE(−2) has determinant κ⁻³, value 1/64.
- T*(−1)=E[p^∞](−2) is torsion.

The same lattice-letter clash is repaired in two other places:
- §0.9(3): "good for any stable lattice T … (irred) gives T=cT_B" → "U of the cohomological realization (not the Selmer lattice T) … U=cT_B".
- §0.10 (line 578): "good for the dual lattice" → the same cohomological-lattice wording.
- §3.2 `katoPeriodDefect_elliptic` (line 1159): "good pair for T = T_pE(−1)" → "for the cohomological lattice T_B = T_pE(−1) ≅ T_pE^∨ (Kato 17.5, p.274)".

## Adversarial pass on changed statements

| statement | instances tried | values | result | change |
|---|---|---|---|---|
| Poitou–Tate map lands in contragredient dual | Sel=Z/49, γ·=8, compact line 43 | Φ(γc)(1)=43; contragredient (γΦ(c))(1)=43; scalar 8 | the scalar target is not linear | sequence restated with `X^{ι_Γ}` |
| localization of M^ι at 𝔭 equals M at ι(𝔭) | M=Z_7[[t]]/(t−7), 𝔭=(t−7) | ι(t−7)=−(8t+7)/(1+t); lengths of M, M^ι at 𝔭: 1, 0 | same-prime claim false; ι-prime claim true | 𝔭′=ι_Γ(𝔭) recorded |
| ι_Γ permutes height-one primes ∌ p, fixes (ϖ) | (ϖ); (X); (X−5) at p=5, κ(γ)=6 | ι(ϖ)=ϖ; ι(X)=−X/(1+X), so (X) is fixed; ι(X−5)=−(6X+5)/(1+X), so (X−5)↦(X+5/6) | ring automorphism, so height and p-containment are preserved | global equivalence kept |
| good-pair lattice | weight 2, p=3, κ(g)=4 | det T_B=1/4; det of Hom(T_pE,Z_p)(−1) is 1/64; T*(−1) is torsion | only T_B is correct | §1.5 wording and Check |
| degenerate case | H²=0, Z=H¹ (C=0, H=0) | J≅X, so char X=(K) both before and after ι | consistent with the §0.7 Check | none |

## Build, gate and direction

- Suggested.lean is unchanged, so no `#check` comparison was needed.
- `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`: Build completed successfully (8983 jobs). The only warnings are the three `declaration uses 'sorry'` warnings, at lines 50, 62 and 72.
- Gate: `gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck: `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- Commit: `ModularIwasawaMainConjectures: review repairs (Γ-inversion in ordinary Poitou–Tate comparison, cohomological good-pair lattice)`. Not pushed.
- Citations: the two leads (KatoEulerSystems, AutomorphicCongruences) are the conditional prerequisite packages that the README already declares; this round adds no new cross-roadmap citation. The Γ-inversion that §0.9 now states rests on Kato 16.2(i) and 16.6, read in the cached source. KatoEulerSystems §6.3 has no readable specification, so it was not checked against that section.
- No suspicious instructions were found in the review text.
