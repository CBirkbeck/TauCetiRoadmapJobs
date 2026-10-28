# GATE-K3SurfacesAndSymplecticBoundedness~14 — answers to the review of head 7a51e84

Repairs are committed as `14c5246b` on top of `7a51e84` and are not pushed. Only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md` changed; `Suggested.lean` did not change.

## H01 (CBirkbeck) — answered

The finding is correct about the companion, and this roadmap needs no change for it. At its open head `e974688`, `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md` never cites K3SurfacesAndSymplecticBoundedness and still defines its own `GenusOneFibration` in §2.1 (line 3799 of that README). The repair is to make the companion's §§2.1, 2.3, 2.5, 4.1–4.2, 4.7–4.8 and the common parts of 4.16–4.17 import this roadmap's §6.0b prefix. That edit belongs in the companion's pull request, not this one. This roadmap's side is already done: Scope and ownership (README line 15) assigns the generic prefix to §6.0b, with no K3 premise. Downstream consumers (README line 1432) names exactly those companion sections, and the prefix ends before "Rank-five K3 pencils" (README line 878). The merge order lists this roadmap at line 45 and the companion at line 58, so the direction "generic §6.0b → companion" is the one already in place.

## H02 (CBirkbeck) — applied differently

README line 220 used to consume "the Layer 1 type labels that §7.1 uses". It now consumes only §7.1's algebra maps, with their explicit rescalings onto the NilpotentOrbits N8 equations. Each quotient's ADE type is the one N8 assigns to its equation; for example XY−Zⁿ ↦ xy+zⁿ under Z↦ζZ with ζⁿ=−1. Section 7.1's comparison with the McKay matrix, and McKaySkewGroup Layer 1, are stated as not consumed. A new paragraph (README line 222) gives the stage chain: ReflectionInvariantTheory §1 and GroebnerGeometry G1 → McKaySkewGroup §§7.0–7.1 → §7.2 → gap:tame-quotient-singularities → §§6.1–6.1a. It names GroebnerGeometry as a transitive supplier, matching the README's existing pattern for IndexTheory (line 74) and the topological roadmaps (line 202).

Evidence for each link:
- McKaySkewGroup §7.0 consumes RIT1.
- McKaySkewGroup §7.1 uses GG1 for elimination and standard-monomial verification of the exceptional triples (McKaySkewGroup README line 1146 at `a9ef22a`).
- GroebnerGeometry "G1. Ideals, normal forms and elimination" is at line 64 of its README at `163d43c`.

The CharacterTheory prerequisite is removed, not added: §§6.1–6.1a only need which equation each quotient has, and N8 fixes that. The tensor-generation theorem the review cites lives in an open revision of the existing CharacterTheory roadmap, and the house rules do not allow such a revision to be a dependency. The PR description's "Dependencies" and "Merge order" are written by the worker. They should add GroebnerGeometry G1 (through McKaySkewGroup §7.1) and should not add the CharacterTheory revision.

## H03 (CBirkbeck) — applied

README line 233, old: "the kernel of reduction on GL₂(W(k)) is pro-p"; and "the model reduces at p, faithfully since its order is prime to p".

New:
- The lift is faithful because its reduction is the given faithful inclusion.
- The model has entries in the valuation ring O of a finite extension of Frac W(k), with residue field k. Its reduction is faithful because ker(GL₂(O)→GL₂(k)) has no nonidentity element of order prime to p. Proof: if A=I+π^r B with r≥1 and B≢0 mod π, then A^m≡I+mπ^r B mod π^(r+1).
- The text now says outright that this kernel need not be pro-p.

A new negative-control Check (README line 240) adds:
- For k=F̄_p, (I+pM₂(W(k)))/(I+p²M₂(W(k))) is isomorphic to the infinite group M₂(k).
- At p=2, −I lies in the kernel and has order 2=p.
- For odd m, (I+2^r B)^m≡I+2^r B mod 2^(r+1).

The other congruence-kernel arguments in the README (lines 11, 162, 612) are over ℤ_ℓ, whose residue field is finite, so they stand.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §7.1 consumed through N8 equations (line 220) | cyclic n=1, 2; binary dihedral m=1, 2; binary tetrahedral | n=1: XY−Z, so Z=XY eliminates and the ring is ℂ[X,Y]; N8's A_m needs m≥1, so there is no N8 equation for it. n=2: XY−Z² ↦ xy+z² with ζ=i, ζ²=−1; type A₁, Cartan determinant 2. m=1: order 4 is cyclic C₄, type A₃, not D₃. m=2: X²+Y²Z+Z³ equals N8 D₄'s x²+y²z+z^(4−1). E₆: X²+Y³+Z⁴ equals N8's E₆ equation exactly. | Range defect at n=1 and m=1 | Added n≥1 with A_(n−1) only for n≥2 (the plane at n=1), and m≥2 |
| Transitive chain (line 222) | stage text of McKaySkewGroup §§7.0–7.2 and Layer 1 | §7.0 consumes RIT1 (finite generation, Reynolds, Molien, Noether). §7.1 line 1146 consumes GG1. §7.2 pulls back N8. Layer 1 line 283 consumes CharacterTheory's faithful tensor generation, which only §7.1's McKay-type comparison column uses. | Chain correct once Layer 1 is excluded | New paragraph |
| Faithfulness of the W(k) lift (line 233) | G=1; G={±I} for p odd; general g | G=1: trivial. ±I: reduction ±I, and −1≢1 mod p for p odd. General: ρ̃(g)=I ⇒ ρ(g)=I ⇒ g=1. | True without any kernel property | Rewritten |
| Prime-to-p torsion in ker(GL₂(O)→GL₂(k)) | p=2, 3, 5; r=1, 2, 3; m=1–7, 9, 11; ramified O=ℤ₃[ζ₃] | 300 random B per (p,r): A^m≡I+mp^rB mod p^(r+1) held in every case (0 violations), and no A with p∤m had A^m≡I. Exhaustive p=2, r=1–3, odd m=1, 3, 5, 7: (I+2^rB)^m≡I+2^rB mod 2^(r+1). −I at p=2 has order 2=p, and ζ₃I ∈ 1+πO has order 3=p; both are allowed. | True as stated | Stated with proof |
| Kernel not pro-p (line 233, Check at line 240) | k=F̄_p and k=𝔽_p; p=3 numerics | (I+pX)(I+pY)≡I+p(X+Y) mod p² held in 200 samples, so K₁/K₂≅(M₂(k),+). k=F̄_p: infinite quotient by an open subgroup, so the kernel is not profinite. k=𝔽_p: p⁴ elements, so the kernel is pro-p, consistent with the ℤ_ℓ uses in §4.5. | The original claim is false for infinite k | Removed; negative-control Check added |
| Reduction of the model (line 233) | Q₈ at p=3; cyclic order 5 at p=2; binary icosahedral at p=7 and p=5 | Q₈: diag(i,−i)−I has entries i−1 of norm 2, a unit at 3, so it reduces faithfully. C₅ at 2: ζ₅−1 has norm 5, a unit at 2, so the image has order 5. Icosahedral at 7: 7∤120, so it is covered. At 5: 5 divides 120, so it is outside the contract. | Consistent | None beyond the rewrite |
| "residue field is k" | finite extension L of Frac W(k) | The residue field of O_L is finite over k, and k is algebraically closed, so it equals k. | True | — |

## Signatures, ownership, sources

- **Signatures.** `Suggested.lean` is unchanged. I compared the 9 elaborated declarations in the scratch signatures transcript with their README statements (§§1.1, 1.2, 2.3, 4.1–4.4); no binder is lost and each signature matches its README statement. The transcript's entry `group` (line 138) is spurious: the docstring words "class group" were read as a `class` declaration, and no such declaration exists. No fresh `#check` file was elaborated, because the declarations did not change.
- **Ownership.** No new construction is stated. ReflectionInvariantTheory §1 (on main), GroebnerGeometry G1 (an open new-folder roadmap by another author) and McKaySkewGroup are cited, not restated, and no declaration name of theirs is reused. No notion moved down.
- **Sources.** No source was fetched and no `needs-references.toml` entry was written; the changed text uses only elementary arguments and supplier stages.
- **Citations.** `roadmaps resolve` on the edited README: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.

## Build and gate

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`: Build completed successfully (9040 jobs). There are six `declaration uses 'sorry'` warnings, at lines 96, 108, 122, 146, 155 and 167, and no errors.

Depcheck (`gate --depcheck … --movable`): `depcheck: 55 roadmaps, 637 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line. GroebnerGeometry is not in the board merge order because it is another author's open new-folder roadmap.

Gate at `14c5246b`: `gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

No passage in the review asks for an action outside this job. Its requests to edit the PR description and the companion are recorded above as work for the worker, not done here.
