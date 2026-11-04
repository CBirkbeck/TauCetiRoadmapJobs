# GATE-ModularIwasawaMainConjectures~6: answers to the review of head 3c38904

Commit `7527d0f5` (on top of `3c38904`): "ModularIwasawaMainConjectures: review repairs (regulator before quotient, localized Poitou–Tate exactness, Hida addendum lemma gap)". Only `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` changed; `Suggested.lean` is unchanged.

## H01 (CBirkbeck) — applied

§0.10 (README line 574) defined `k_{ω,γ,1}` as "the image of z in J=(H¹_loc/H¹_loc')/(image of Z)". That image is zero and lies in J, not in Λ. Now: Q=H¹_loc/H¹_loc', Z_loc⊂Q, J=Q/Z_loc. Kato's ξ map (16.4) induces the injective ordinary Coleman map Col:Q→Λ with finite cokernel (Kato Proposition 17.11, p.277, Kato line 6226), and `k_{ω,γ,1}`=Col(z_loc) is taken before the quotient. Col embeds J into Λ/Col(Z_loc) with finite cokernel, and Col(Z_loc)Λ_𝔮=`k_{ω,γ,1}`Λ_𝔮 at height-one 𝔮 (Kato p.280, line 6336), so length(J_𝔮)=ord_𝔮(k). The old global claim "`J^{ι_Γ}≅Λ/(K_{ω,γ,1})` up to a finite module" was replaced by this localized length statement, because Z need not be cyclic. The transport `(K_{ω,γ,1})=(ι_Γ(k_{ω,γ,1}))` is kept as it was. The proof-plan line ("embed the local quotient Q into Λ by the Coleman map before dividing by Z_loc") was changed to match. The reviewer's Q=Λ, Z_loc=tΛ, z_loc=t example is added as a Check.

## H02 (CBirkbeck) — applied

The source agrees with the reviewer. Kato (17.13.1) (Kato lines 6309–6314, p.279) ends in H²(T(k)) → H²_loc(T(k)), and (17.13.4) only proves that the local term is finite. The four-term sequence appears only after localization at a height-one 𝔭 (Kato lines 6329–6333, p.280). §0.10 now states the global sequence 0→C→J→`X^{ι_Γ}`→H→H²_loc, with the four-term form only after height-one localization, and the same for its ι_Γ-transport. It also now gives the length formula `length(X_𝔭)=ord_𝔭(K_{ω,γ,1})+length(H_{𝔭'})−length(C_{𝔭'})` with 𝔭'=ι_Γ(𝔭). I recomputed parts of the reviewer's counterexample and added it as a Check: E: y²+y=x³+x²+3 has Δ=−4771=−13·367, c₄=16, a₃=−2, a₂=2; ψ₃=3x⁴+4x³+39x+13 has a 3-adic root with x≡−1 mod 3, and there 1+4(x³+x²+3)≡1 mod 3. I computed these values myself.

The same pattern appears in the signed analogue, and I repaired it there too. LLZ (60)/(61) (LLZ lines 2522, 2534) also end in "H²(T) → 0". §0.13 and the SignedSelmer.poitouTate bullet of §0.11 now carry the finite H²_loc(T_LLZ) term and apply the four-term form only after height-one localization. The finiteness argument is in §0.13: V_f|G_{Q_p} has no line on which Galois acts through Gal(Q_p(μ_{p^∞})/Q_p), because it is irreducible in the supersingular case and its unramified parts are α^{±1} with |α|=p^{(k−1)/2} in the ordinary case. LLZ Corollary 6.6 only compares characteristic ideals, so it is unaffected.

## H03 (CBirkbeck) — applied

I checked the counterexample against HidaAdd lines 13–20. Take A=𝔽₅, m=3 and N={x+y+z=0}. N is free of rank 2 and satisfies (1)–(3), but N≠A³, and N∩(A²×0)={(t,−t,0)} is 1-dimensional, so it fails (2) for m−1=2. The same N also refutes the original Lemma 3.17 (HidaAdd lines 7–11). The first proof of Corollary 3.19 uses Lemma 3.17 (Hida line 2657, p.97), and a second proof via Chai is sketched on p.98 (Hida lines 2676–2689).

The downstream-branch paragraph (old line 169) said the μ theorem's proof "uses the replacement … Lemma 0.2". It now says that neither lemma holds as printed and gives the 𝔽₅ instance. It makes the downstream proof either prove a strengthened lemma whose extra hypotheses it verifies in the first proof, or develop the second proof (p.98) in full. It also says that Hida's Theorem I as a statement and the targets here are unaffected. The reference entry (old line 2055) now cites Corollary 3.19 with both proofs (pp.97–98) and calls Lemma 0.2 the proposed replacement, which fails as printed. No target of this roadmap depends on the lemma, and §6.2 cites neither Hida nor the lemma.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| k=Col(z_loc), J↪Λ/Col(Z_loc) | Q=Λ=O[[t]], Col=id, Z_loc=tΛ, z_loc=t | k=t; length(J_(t))=1=ord_(t)(t); image of z_loc in J is 0, and Λ/(0) has rank 1 | holds only with Col before the quotient | definition repaired; Check added |
| Global sequence ends in H²_loc | E: y²+y=x³+x²+3, p=3 | Δ=−4771, a₃=−2 (ordinary), a₂=2, disc(u²−2u+2)=−4≡2 nonsquare mod 3; ψ₃ has a 3-adic root at x≡−1 mod 3 (checked to 3¹²); y-discriminant ≡1 mod 3 | H²_loc≠0, so the global four-term form fails | sequence restated; Check added |
| Localized length formula | 0→C→J→X^ι→H→0 at 𝔮=ι(𝔭) | ℓ(X_𝔭)=ℓ(J_𝔮)+ℓ(H_𝔮)−ℓ(C_𝔮), with ℓ(J_𝔮)=ord_𝔮(k)=ord_𝔭(ι k)=ord_𝔭(K) | matches the reviewer's formula | stated |
| Signed H²_loc finite | supersingular: slopes of φ in (0,k−1); ordinary: Frobenius ↦ α, α⁻¹ | |α|=p^{(k−1)/2}≠1 for k≥2, so no character factors through the cyclotomic Galois group | finite | §0.13 sentence added |
| Hida Lemma 0.2 | A=𝔽₅, m=3, N={x+y+z=0} | rank N=2; all pair projections are onto; N∩(A²×0) has rank 1 < 2 | lemma false | downstream obligation made explicit |

`Suggested.lean` is unchanged, so its 4 elaborated signatures in `signatures.md` still apply. None of them involves §§0.10–0.13 or Hida, so I did not re-run `#check @name`.

## Ownership and citations

No new construction or cross-roadmap citation was added. The two leads in `citations.md`, KatoEulerSystems §2.2 and AutomorphicCongruences §4.5, are the proposed conditional contracts that the README already labels as such, and the reviewer agrees. No `sources.toml` entry changed and no new source was requested. The texts I used are all in the manifest: Kato, LLZ, Hida, HidaAdd.

## Build and gate

- `lake build TauCetiRoadmap.ModularIwasawaMainConjectures.Suggested`: Build completed successfully (8983 jobs), with 3 `declaration uses 'sorry'` warnings (lines 50, 62, 72).
- Gate: `gate ModularIwasawaMainConjectures: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 55 roadmaps, 641 edges, 0 problem(s)`. There are no UPWARD, CYCLE or moved lines.
