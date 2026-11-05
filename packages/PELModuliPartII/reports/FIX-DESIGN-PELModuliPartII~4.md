# FIX-DESIGN-PELModuliPartII~4 — repair report

Files edited: `packages/PELModuliPartII/design/README.md`, `packages/PELModuliPartII/design/plan.json`, `packages/PELModuliPartII/sources.toml`. The design stage has no `Suggested.lean`, so nothing was elaborated.

## F01 (P2) — applied

Verified. PELModuli §M1.7 and §M2.8 work only over S₀ = Spec O_{F₀,(□)} with □ good. ShimuraCompactifications §C5.18 says "bad primes are not treated". The gap's object was therefore undefined, and two of its consumers did not connect to it.

- **Gap `needs`** (README contract and plan.json): "PEL moduli at a neat level over a base containing a bad prime" → the moduli problem of PELModuli §M1.7 (Lan 1.4.1.4), with multichain level at the bad primes as in RZ96 Definition 6.9, p. 279 (RZ96 line 8517–8531). The supplier is asked for a separated DM stack of finite type, quasi-projectivity at neat level, and properness when the generic fibre is proper. `detail` rewritten to match.
- **U7/localized-smoothness:** the target of the finite morphism is now named in both cases: the §M2.8 moduli when every residue characteristic of O_E[1/d] is unramified in F⁺, otherwise the gap's moduli with the single self-dual lattice Λ₀⊕Λ. Stacks 0C4N → 0B3G. Added RZ96 Def. 6.9 and a Check for F⁺=ℚ(√3), F=F⁺(i), p=3.
- **U7/exotic-global-smoothness:** added the finite comparison into the gap's moduli. The multichain is Λ₀⊕Λ_u with Λ_u π-modular. The model is quasi-projective, and projective for F⁺≠ℚ (V anisotropic, so no cusp label; §C5.5 applies over the reflex field, then Tags 01WN and 0BCL). New Needs: U7/localized-smoothness and §C5.5. Two Checks added: the multichain/cλ Check, and the F⁺=ℚ Meyer check.
- **U8/asd-completed-local-rings:** added the comparison through the datum (V′,j,Λ′_p) of U8/asd-generic-datum, with multichain Λ₀⊕Λ′_p⊂Λ₀⊕Λ′_p^♯. The model is quasi-projective over T_p, and projective iff its generic fibre is proper. Added step 5, new Needs, and three Checks (N=1; F⁺=ℚ with N=2; the multichain).
- **Part of the finding I dispute (same pattern elsewhere):** the claim that Tag 0C4N is "not used by the route". That is true for U7/localized-smoothness, whose statement is over the base. It is false for U8/smooth-geometry-tangent and U8/asd-completed-local-rings, which assert quasi-projectivity over T_p. There 0C4N (Stacks line 4273: if g∘f is quasi-projective and f is quasi-compact, then f is quasi-projective) is exactly the step from the coefficient ring to T_p. I kept it there, said so in the route, and added 0B3G (line 4242).
- **Other occurrences updated:** the README supplier paragraph under "From ShimuraCompactifications", the U7 layer Needs (adds §C5.5), and `Uses` entries in U8/ltxzz-smooth-moduli and U8/asd-generic-datum.
- **Supplier choice:** I chose the moduli-problem formulation, not Lan's normalization models.

## F02 (P3) — applied

Verified. HLSY23 §10.1–10.2 (line 4006–4121) defines the datum and the model with (H4) and contains no completion statement. The only hit for "uniformiz" there is the bibliography. Source line of U9/kramer-formal-comparison: "HLSY23 §10.1–10.2; RSZ21 Def. 6.10, Lemma 6.11" → "HLSY23 §10.2, pp. 77–79 (model, (H4)); RSZ21 Def. 6.10, Lemma 6.11 (condition); RZ96 Thm 6.30 via U9/uniformization-morphism. No cited text states the filtration-compatible comparison; step 2 is this roadmap's own." The manifest locator for HLSY23 changes §§10.1–10.2 → §10.2, since §10.1 is cited nowhere now.

## F03 (P3) — applied

Verified. RSZ21 Remark 6.8 (line 1741–1744) concerns the wedge local model, whose reflex field is F⁺_{v₀}. The Krämer chart yz=u lives over O_{F̆_{v₀}} (U5/kramer-local-charts, worked check 5), and HLSY23 line 4113–4117 asserts regular semistable models for every n≥2. I took the reviewer's first option, because the second would leave the roadmap narrower than its source.

- **U7/ramified-global-geometry:** "n≥3 … regular semistable; n=2 none asserted" → for every n≥2 the Krämer model is regular and semistable at ν when E_ν/F_{v₀} is unramified; for n≥3 it is also the blowup; at n=2 the wedge model alone fails. Route step 3, Needs (+U5/kramer-local-charts), Source (+HLSY23 §10.2) and a new Check updated.
- **U9/kramer-formal-comparison:** now stated for n≥2, with Needs U7/ramified-kramer-model in place of U7/ramified-global-geometry.
- **Same pattern elsewhere:** fixed the U7 layer introduction and the last sentence of worked check 5.

## F04 (P3) — not actionable in this package: the rule governs the package-stage README written against `Suggested.lean`

At the design stage there is no `Suggested.lean`. The API names are the `api[].name` fields of plan.json's design schema, and the design README renders them. The reviewer's own repair is scheduled for the package stage and marked "non-blocking at this stage". When the package-stage README is written, every backticked own name becomes prose: the roadmap states that no headline is statable at the pins, so `Suggested.lean` will declare none of them.

## Checks

Dependency gate, verbatim:

    candidate: PELModuliPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 644 edges, 0 problem(s)

Exit 0. There is no UPWARD, CYCLE or moved line.

A script over plan.json confirms:
- the JSON parses;
- the in-roadmap prerequisite graph has no cycle and no forward-layer edge (a first draft had U7→U8; I replaced it with U7/localized-smoothness);
- every gap's `neededBy` equals its users (all four true);
- every node source id is in `sources`;
- every `uses` list matches its consumers (the remaining "extra" entries are pre-existing literature `uses` rows, unchanged);
- for the six changed nodes, statement, steps, checks and prerequisites agree with the README.

There is no LaTeX delimiter and no machine path in the three files.

## Adversarial pass on new and changed text

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| localized: good vs bad base | F⁺=ℚ(√3), F=F⁺(i), p=3 | 3 ramified in F⁺; −1 is a nonsquare in 𝔽₃, so F/F⁺ is inert at 3; 3 \| disc(O_F×O_F), so Lan's goodness fails | target is the gap's moduli; Check added |
| localized: good base | every p unramified in F⁺, p∤d | F/F⁺ unramified (D holds the ramified places and 2), Λ self-dual, p∤disc | §M2.8 and §C5.18, unchanged |
| exotic multichain | Λ_u with Λ_u^♯=π⁻¹Λ_u | chain Λ₀⊕Λ_u⊂Λ₀⊕π⁻¹Λ_u, periodicity (1,π) normalizes O_F×O_F; one member mod periodicity | determined by A₀×A, λ |
| comparison separates cλ | c≠1 | m(λ₀×λ)=λ₀×cλ forces m=1 and m=c | distinct |
| exotic projectivity, F⁺≠ℚ | [F⁺:ℚ]≥2 | V of signature (n,0) at a real place, hence anisotropic; V₀ rank 1 anisotropic, so no cusp label | proper, then projective (01WN, 0BCL) |
| exotic, F⁺=ℚ | n even ≥4 | trace form 2h(x,x): dimension 2n≥8, signature (2n−2,2), isotropic by Meyer | not projective; Check added |
| asd, N=1 | V′ rank 1 | anisotropic, no cusp label, relative dimension 0 | projective, as LTXZZ22 Remark 5.2.4 implies |
| asd, F⁺=ℚ, N=2 | V′=⟨a⟩⊥⟨b⟩, ab<0 | isotropic ⇔ −ab∈Nm F^× | quasi-projective, not projective, consistent with LTXZZ22 Thm 5.2.5(1) (line 2654–2657) |
| asd multichain | Λ′^♯/Λ′ of order p² | chain Λ′⊂Λ′^♯⊂p⁻¹Λ′; members A, A^∨ through λ | ok; p-principal λ gives one lattice |
| quasi-projective over T_p | model→T_p→Spec ℤ_{p,Φ} | composite quasi-projective; model→T_p quasi-compact (finite type over noetherian) | 0C4N applies |
| Stacks tags | lines 4242, 4268, 4244, 4273, 4931, 4764 | 0B3G base change; 0B3H quasi-affine finite type ⇒ quasi-projective; 0C4M composition over quasi-compact S; 0C4N as above; 01WN finite ⇔ affine and proper; 0BCL projective ⇔ quasi-projective and proper over qcqs S | as cited |
| Krämer n=2 global | O[[y,z]]/(yz−u), O unramified over O_{F̆_{v₀}} | dimension 2; maximal ideal (y,z,u)=(y,z) since u=yz; regular, strictly semistable | holds |
| wedge n=2 global | uv=t²·unit | embedding dimension 3 > dimension 2 | not regular (Check kept, now labelled "wedge") |
| RZ96 Def. 6.9 locator | line 8514 running head "279" | printed p. 279; representability over O_{E_v} through Kottwitz (line 8527–8528) | ok |
| LL22 Assumption 1.3 | line 147, page marker 4 at line 143 | p. 4, F≠ℚ | ok |

## For the maintainer

- **Gap contract reworded:** gap:bad-prime-projectivity asks ShimuraCompactifications for a defined object: the multichain moduli of RZ96 Definition 6.9 at bad primes, its representability, quasi-projectivity and properness. Supplier and section are unchanged. Ownership by object: `roadmaps grep` for parahoric-level PEL moduli and lattice multichains over main and the open heads finds no owner. ShimuraCompactifications §C5.19 (line 2655 there) disclaims a moduli interpretation at parahoric level.
- **No renames:** no name that other roadmaps cite changed.
- **New dependencies inside the roadmap:**
  - U7/exotic-global-smoothness → U7/localized-smoothness
  - U8/asd-completed-local-rings → U8/asd-generic-datum and U8/ltxzz-smooth-moduli
  - U9/kramer-formal-comparison → U7/ramified-kramer-model, in place of U7/ramified-global-geometry
- **Ownership against open pull requests** was checked only for the objects this round touched (ShimuraCompactifications, PELModuli, and the multichain moduli grep).
- **Suspicious text:** none found in the review.
