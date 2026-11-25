# GATE-PELModuliPartII~1: answers to the human review of `1fc6e78`

One review (riccardobrasca, 2026-11-25T14:03Z) with three numbered points, the second in two parts, and
a status note on an earlier deferred finding: five points, H01–H05. Repairs are in commit `8ec14791`
on the pull-request branch; line numbers below are those of `TauCetiRoadmap/PELModuliPartII/README.md`
at that commit.

## H01 (riccardobrasca) — applied

HermitianFormsAndLattices (on main, in the RiemannHypothesisForDirichletLFunctions family) §3.1 (Hasse
principle) and §3.2 (existence for given determinant classes at the finite nonsplit places, almost all
trivial, and given signatures at the real places inert in the extension, exactly when the product formula
holds, with a variant that prescribes all localizations) are the whole content of `gap:hermitian-local-global`.
The contract is gone. §8.3 (l.1474, 1476, 1491) now cites HermitianFormsAndLattices §3.2 and §9.3
(l.1632, 1634, 1649) cites §§3.1–3.2, in the statement, the route and *Needs:*. The Layer 8 and 9
Dependencies (l.1576, 1774) list them as suppliers and no longer list the contract. The Scope bullet
(l.1868–1871) states Landherr's theorem and cites §§3.1–3.2. The `### From TauCetiRoadmap.AdelicAlgebraicGroups`
subsection, which held only the contract, is replaced by `### From TauCetiRoadmap.RiemannHypothesisForDirichletLFunctions.HermitianFormsAndLattices`
(l.2050). AdelicAlgebraicGroups is no longer cited anywhere.

That roadmap writes forms conjugate-linear in the first variable, so the Conventions paragraph that already
transposes GeometryOfNumbersAndQuadraticArithmetic's forms now covers it too (l.98). It also gains the one
fact the new import needs: H(x,x)=h(x,x), so for ε=1 the two forms have the same real signatures (l.105).
At the head of #3027, which revises HermitianFormsAndLattices, §§3.1 and 3.2 keep their ids and subjects
(§3.2 becomes a corollary of GeometryOfNumbersAndQuadraticArithmetic §2a.2 there). The citation survives
that merge and adds no dependency on an open revision.

## H02 (riccardobrasca) — applied

PELModuli §M2.15 (on main) defines "principally quasi-polarized displays with O-module structure (P,λ,ι)
for a ℤ_p-algebra O with involution", which are displays over W(R). §0.1 means windows over the Witt
O-frame W_O(R). The two objects are different, as the review says.

- §0.1 (l.167) now says that its O-displays are not the polarized O-displays of PELModuli §M2.15. It gives
  the ranks: a strict formal O-module of relative height h and dimension d has a display over W(R) of rank
  [K:ℚ_p]·h and an O-display of rank h, and P/Q has rank d in both.
- §0.1 states the passage from nilpotent displays with strict O-action to nilpotent O-displays as an
  equivalence, natural in R. This is Mih19 (10.1) composed with the inverse of (10.2), p. 40, Mih19
  lines 1816–1821. It is a new API bullet (l.177), and the route says how it is obtained (l.171).
- The Scope bullet on Zink displays (l.1824) records the difference in naming.

Degenerate cases: for O=ℤ_p the passage is the identity. For K=ℚ_p(√p) and the Lubin–Tate group, the ranks
are 2 and 1 and P/Q has rank 1 in both. For K/ℚ_p unramified of degree 2 and relative height 2, the ranks
are 4 and 2, which agrees with the existing f=2 Check of §0.1.

## H03 (riccardobrasca) — applied

The review offered two repairs. The second is taken: O-frames and their windows are now defined in §0.1
in the roadmap's own words, and the Scope says that they do not use FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII
and how the two compare. §0.1 (l.167) now defines:

- O-frames (S,I,σ,σ̇): I+πS lies in the Jacobson radical, σ lifts the q-power Frobenius of S/πS, and the
  image of σ̇ generates S. The frame constant θ exists and is unique.
- Windows over an O-frame, and u-morphisms and strict morphisms of O-frames (Mih19 p. 41, line 1852).
- The dual window, whose P^∨/Q^∨ has the rank of Q/IP and whose Q^∨/IP^∨ has the rank of P/Q (Mih19
  Definition 11.1, lines 1840–1847).
- The Lubin–Tate O′-frame `L_{O′/O,κ}(R)` (Mih19 Definition 12.7 and Proposition 12.3, lines 1993–1999 and
  2071–2080).

The Witt O-frame is asserted to be an O-frame, with σ̇=V⁻¹ and θ=π, only when π is nilpotent in R; the
route gives the reason. Over R=K the ideal I_O+πW_O is the whole ring, so the Witt O-frame is not an
O-frame there. A new Check (l.188) separates the two notions:

- For O=W(𝔽_{p²}), the frame (O,pO,id,σ̇) is an O-frame but not a frame in the sense of that roadmap's §0.3.
- The frame (O,pO,φ,φ₁) with φ the Frobenius is the reverse: a frame there but not an O-frame.

A new Scope bullet (l.1828) says:

- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §§0.3 and 0.11–0.13 own p-frames, Dieudonné displays over Ŵ(R) (contravariant), strict base change and the anti-equivalence over complete noetherian local rings with perfect residue field.
- §0.1 uses none of them.
- For O=ℤ_p and π=p an O-frame is a frame there, and a strict morphism is a strict map there.
- Its normalization, where the dimension is the rank of M₁/Î_R M, is that of the dual window here. Checked on μ_{p^∞} (here P/Q has rank 1; the dual window has Q^∨=P^∨, matching M₁=M there) and on ℚ_p/ℤ_p (M₁=Î_R M there).

`gap:zink-display-equivalence` (l.1966) now says what is already available and what remains:

- PELModuli §M2.15 states the equivalence over complete noetherian local rings with perfect residue field.
- FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII §0.13 classifies p-divisible groups over such rings by contravariant Dieudonné displays over Ŵ(R).
- The contract adds the covariant theory over W(R) for every ring in which p is nilpotent.

No roadmap on main or at an open head defines O-frames, O-displays or windows (searched "Ahsendorf",
"O-display", "Witt O-frame", "Lubin–Tate frame", "strict formal O"). Neither does the pinned Mathlib
`RingTheory/WittVector` or Tau Ceti, so this roadmap owns them. The Scope ownership sentence (l.1803)
says so.

The general axioms are written in the roadmap's own words: Lau's frame axioms with π and q in place of p.
Mih19 §11.1 (line 1837) takes its definitions from Ahsendorf–Cheng–Zink §3, which is not in the manifest
and was not read. Every frame the targets use satisfies the definition as stated: the Witt O-frame,
`A_{O′/O}(R)` with θ=π, and the Lubin–Tate frame (Mih19 Example 12.9 for O′=O).

## H04 (riccardobrasca) — answered

The pull-request description is not one of the files this repair may change. The worker updates it to
match the overview, as follows.

The `roadmap-summary` block and the paragraph below it should say that PELModuli "stops at good primes
and, for the CM moduli, at primes unramified in the CM field".

They should replace "Every statement fixes its polarization kernel, signature convention, Lie
annihilation equation and coefficient field, none of which the generic Shimura variety determines" with
the overview's sentence: "The moduli statements fix data beyond the generic Kottwitz signature: the
polarization kernel and signature convention, an equation that the action must satisfy on the Lie
algebra, and the coefficient ring of the model."

The description should also stop naming AdelicAlgebraicGroups as a supplier (H01). Where it lists
suppliers, it should name HermitianFormsAndLattices §§3.1–3.2.

## H05 (riccardobrasca) — answered

The Downstream consumers table was rechecked against SelmerIwasawaCohomologyPartII at its head `980d7b8`,
and every section it names has the subject the table assigns:

- §2.2: the basic isogeny correspondence.
- §2.3: semistable incidence strata.
- §2.4: link cohomology and excess intersections.
- §2.6: the semistable product resolution.
- §5.2: the first geometric reciprocity law.
- §5.4: the potential map and the diagonal boundary.

The table needs no change. Whether the hyperspecial models that its `gap:native-shimura` asks of
ShimuraVarieties should instead be §§7.6 and 7.9 here is a question for that roadmap; nothing here is
planned twice.

## Build and gate

- `lake build TauCetiRoadmap.PELModuliPartII.Suggested`: `Build completed successfully (18239 jobs).`
  `Suggested.lean` is unchanged and has no named declarations, so the `#check @name` comparison has
  nothing to compare.
- Gate at `8ec14791`: `gate PELModuliPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 121 roadmaps, 1385 edges, 0 problem(s)` (no UPWARD, no CYCLE).
- `roadmaps resolve` on the edited README: no cross-roadmap citation and no Lean name found nowhere.
- Every supplier newly cited is on main: HermitianFormsAndLattices (consumed) and
  FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (named in Scope and in a contract, not consumed).
  No roadmap later in the merge order is cited.
- Ownership against open work was checked with `roadmaps grep` over main and all 388 open heads.

## Adversarial pass on the statements added or changed

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| O-frame constant θ exists, unique | Witt O-frame of 𝔽_p for K=ℚ_p(√p); zero ring; wrong variant θ=p | a=√p: σ(a)=√p, σ̇(a)=1, so θ=√p=π; zero ring θ=0; θ=p gives p·1≠√p | holds; θ=π, not p | none |
| Axiom: σ lifts q-power (not p-power) Frobenius | O=W(𝔽_9), p=3: σ=id vs Frobenius φ | on 𝔽_9: x^9=x, so id lifts it; x^3≠x for a generator | separates O-frames from p-frames | Check added (l.188) |
| Witt O-frame is an O-frame only when π is nilpotent in R | R=𝔽_p, R=K | 𝔽_p: I+πS=(√p), in the radical of O_K; K: π a unit, I+πS=whole ring, not in the radical | restriction needed | wording "when π is nilpotent in R" (l.167, 169, 171) |
| σ̇=V⁻¹ is σ-linear and θ=π | projection formula | V⁻¹(a·Vx)=F(a)x; σ(Vx)=FVx=πx=π·σ̇(Vx) | holds | none |
| A_{O′/O}(R) is an O′-frame | general f | σ̇(a·Vx)=F^{f−1}(F(a)x)=σ(a)σ̇(Vx); σ̇(V1)=1; σ(Vx)=πσ̇(Vx) | θ=π, holds | none |
| Dual window exchanges ranks | normal decomposition P=L⊕T; μ_{p^∞}; ℚ_p/ℤ_p | P^∨/Q^∨=L^∨/IL^∨ (rank rk L); Q^∨/IP^∨=T^∨/IT^∨ (rank rk T); μ: Q^∨=P^∨; ℚ_p/ℤ_p: Q^∨=IP^∨ | matches M₁=M and M₁=Î_R M of FiniteFlat…PartII §0.13 Checks | none |
| Passage display with strict O-action → O-display, rank ÷[K:ℚ_p], P/Q kept | O=ℤ_p; K=ℚ_p(√p), h=d=1; K unramified of degree 2, h=2 | 1→1; 2→1 with P/Q 1→1; 4→2 | agrees with §0.1 f=2 Check | none |
| Lubin–Tate frame definition (unique σ̇ for each κ) | O′=O | J=I_O(R) since w₀(π−[π])=0; σ̇=V⁻¹, σ̇(V1)=1; κ=V⁻¹(π−[π]) | equals Mih19 Example 12.9(1) | none |
| Scope: O-frame for O=ℤ_p is a frame of FiniteFlat…PartII §0.3 | axioms side by side; ℤ_(p) | the same four axioms; ℤ_(p) is a frame there but not a ℤ_p-algebra | one direction only, as stated | wording "is a frame there" (one direction) |
| Convention: H(x,x)=h(x,x) gives the same real signatures (ε=1) | h=⟨1,−1⟩ over ℚ(i)/ℚ | diagonals (1,−1) for both; signature (1,1) for both | holds | clause added (l.105) |
| §8.3: V′ from HermitianFormsAndLattices §3.2 by two-place switch | F⁺=ℚ, F=ℚ(i), 𝔭=3, N=2, V°=⟨1,1⟩, V′=⟨1,−3⟩ | η_∞: +1→−1; η_3(−3)=−1 (odd valuation); (−3,−1)_2=+1; −3 a unit norm at inert p≥7 | product +1; flips at ∞ and 3 only; Λ^♯/Λ length 1 at 3 | none |
| §9.3 Check "flipping only v₀ violates the product formula" | V=⟨1,3⟩ over ℚ(i), v₀=3 | η_∞=+1, η_3=−1, product −1 | consistent with HermitianFormsAndLattices §3.2 | none |
| Contract: M2.15 and FiniteFlat…PartII §0.13 already cover complete noetherian local rings with perfect residue field | R=𝔽_p[t]/(t²); R=𝔽_p[t]; R=𝔽_p[t_i]_{i∈ℕ}/(t_i²) | first is covered by both; the other two by neither | remainder correctly stated | none |
