# Review of ReductiveGroups (pull request #1676 at 47dfaf2)

**Verdict:** needs changes

The gate passes and the headline statements are true at their hypotheses (table below). There are five findings: one P2 and four P3. Two of the P3s re-raise parts of the previous review that this head leaves unrepaired.

**Previous findings, one by one (review of 69572c3):**

| Previous | Status at 47dfaf2 | Evidence |
|---|---|---|
| R01 (P1): GroupSchemesOverABase cited as supplier | Repaired in the folder | No mention in `README.md`; gate `dropped=0`; Layers 3, 4 and 9D restate the targets (lines 1159–1161, 1585–1587, 1603–1605, 3648–3662). The description still lists it, see R05 below |
| R02 (P2): ChevalleyGroups C4/C6 not named | Repaired in the folder | Lines 53–62: "ChevalleyGroups C4 … and C6 … are the semisimple Chevalley-datum cases of §§9B.1–9B.3"; Downstream consumers, lines 4533–4535 |
| R03 (P2): LieGroups Layer 7 owns `G(ℂ)` too | Repaired in the folder | Lines 38–43; the comparison at lines 1430–1435; a new Check at lines 1446–1452. The companion change is unnamed, see R05 |
| R04 (P3): padding | Repaired | The three declarations are deleted; README lines 4199 and 4493–4495 no longer name them |
| R05 (P3): headline locators | Partly repaired | Brieskorn: the 1971 *Invent. Math.* paper is now the primary locator (lines 4241–4245, 4569–4571; `Suggested.lean` lines 466–469). Nagata: still only a remark without proof, see R03 |
| R06 (P3): §11B API and Checks | Repaired | Lines 4261–4298: four API bullets and five Checks, all recomputed in the table |
| R07 (P3): coordination and description | Not repaired | The description is unchanged, see R05 |

## R01 (P2) — Layers 4 and 9D claim, and restate, diagonalizable and multiplicative-type theory that the pinned Tau Ceti already proves

**Location.** `TauCetiRoadmap/ReductiveGroups/README.md`:
- lines 76–80: "Layers 3 and 4 own … the character-group comparison … and the anti-equivalence of groups of multiplicative type";
- lines 1580–1587: "Develop its character-group comparison and exactness in both directions";
- lines 1603–1605: "extend the anti-equivalence … over every field";
- lines 3648–3662: "The multiplicative-type theory over `S` is owned here".

**Claim.** Restoring these targets after the previous R01 was right, but at the pinned Tau Ceti several of them are already proved and none of those declarations is cited. A grep of the README for `multiplicativeType`, `geometricCharacterGroupEquiv`, `isShortExact_mapDomainBialgHom_iff` and `fullyFaithfulSchemeFunctor` finds only `torusCommHopfAlgProperty.linearlyReductive`.

The pin proves:
- the character-group comparison and exactness in both directions (Milne 12.8–12.9), over every nonzero ring, so the base case of 9D as well;
- Hom between split groups over a connected base;
- the definition of multiplicative type;
- the morphism half of Milne 12.23 over perfect fields;
- the object half of Milne 12.23, torsion included, over every field.

What is left for Layer 4 is Milne 12.23 over imperfect fields and packaging the two halves as one anti-equivalence. As written, the Scope section gives a second owner to pinned objects.

**Witness.** Pinned Tau Ceti (2fd255d), under `TauCeti/Algebra/AlgebraicGroup/`:
- `DiagonalizableGroup/CharacterLattice.lean:117` `geometricCharacterGroupEquiv`;
- `DiagonalizableGroup/Exact.lean:92` `isShortExact_mapDomainBialgHom_iff`;
- `DiagonalizableGroup/Scheme/Basic.lean:289` `fullyFaithfulSchemeFunctor`;
- `MultiplicativeType/Basic.lean:56` `multiplicativeTypeCommHopfAlgProperty`;
- `MultiplicativeType/Character/Descent.lean:46` (assumes `[PerfectField k]`);
- `GroupAlgebra/Galois/MultiplicativeType.lean:44`.

**Repair.**
1. Add a supplier-contract bullet *Diagonalizable groups and groups of multiplicative type*. It names, with their files:
   - `TauCeti.DiagonalizableGroup.geometricCharacterGroupEquiv`;
   - `TauCeti.DiagonalizableGroup.isShortExact_mapDomainBialgHom_iff`;
   - `TauCeti.DiagonalizableGroup.fullyFaithfulSchemeFunctor` (connected base);
   - `TauCeti.multiplicativeTypeCommHopfAlgProperty` and `TauCeti.multiplicativeTypeAffineGroupSchemeProperty`;
   - `TauCeti.multiplicativeTypeCommHopfAlgProperty.existsUnique_geometricCharacterMap_eq` (perfect field);
   - `TauCeti.GaloisDescent.multiplicativeTypeCommHopfAlgProperty_descendedCoordinateRing`;
   - `TauCeti.DiagonalizableGroup.linearlyReductiveAffineGroupSchemeProperty_of_diagonalizableGroupSchemeProperty` (one direction of Milne 12.12).
2. In Layer 4, consume these instead of "Develop its character-group comparison and exactness in both directions". Keep as targets:
   - stability under quotient groups, which is not pinned (line 429 says so);
   - the remaining direction of 12.12;
   - full faithfulness over imperfect fields, through `k_s` rather than `k̄`;
   - the packaged anti-equivalence;
   - the split-torus criterion.
3. In 9D, consume `fullyFaithfulSchemeFunctor` and `isShortExact_mapDomainBialgHom_iff`. Add the comparison that Conrad's Definition B.1.1 over `Spec k` is the pinned `multiplicativeTypeCommHopfAlgProperty`.
4. Narrow lines 76–80 to match.

**Test.** For `μ_n` the pinned results give `X*(μ_n) = ℤ/n`, and the short exact sequence `1 → μ_n → 𝔾_m → 𝔾_m → 1` comes from `0 → ℤ → ℤ → ℤ/n → 0`. These are Layer 4's own Checks (lines 1617–1620). For `μ_p` over `𝔽_p(a)`, `existsUnique_geometricCharacterMap_eq` does not apply, because the field is not perfect: that is the case the narrowed target still owns.

## R02 (P3) — `corootReflectionGroup` re-defines Mathlib's Weyl-group action on the coroot space

**Location.**
- `TauCetiRoadmap/ReductiveGroups/Suggested.lean` lines 446–461: `Subgroup.closure (Set.range P.coreflection)`, used by `RegularOrbits`.
- `README.md` lines 4251 and 4262–4269: "it is the image of the Weyl group under the native coroot representation".

**Claim.** The definition is a second carrier for an object that pinned Mathlib already has. The API bullet plans to prove the comparison, which is a pinned lemma. The README itself (lines 4219–4221) says that the coroot space carries the native `weylGroupCorootRep`, a `W.op`-representation.

**Witness.** In pinned Mathlib, `Mathlib/LinearAlgebra/RootSystem/WeylGroup.lean`:
- line 118, `RootPairing.range_weylGroup_coweightHom`: the image of `P.weylGroup` on the coroot space is `Subgroup.closure (range (MulOpposite.op ∘ P.coreflection))`;
- line 136, `weylGroupCorootRep`, built on the native `DistribMulAction P.weylGroup.op N`.

**Repair.**
1. Delete `corootReflectionGroup`.
2. Define `RegularOrbits P := Quotient ((MulAction.orbitRel P.weylGroup.op (κ → ℂ)).comap (Subtype.val : RegularCoroots P → κ → ℂ))`.
3. In the README, replace the backticked name with the native action. Cite `RootPairing.range_weylGroup_coweightHom` for the second API bullet instead of listing it as a target.

**Test.** I elaborated this definition, with `nonempty_mulEquiv_artinGroup` restated against it, in a scratch copy: `sorry` was the only warning. On the rank-one Check (roots `±2`, coroots `±1`), the native group is `{1, s}`, with `s` acting by `y ↦ −y`. Its orbits `{y, −y}` are those of the deleted subgroup.

## R03 (P3) — Nagata's headline still has no locator with a proof

This is the Nagata half of the previous R05, not repaired.

**Location.**
- `TauCetiRoadmap/ReductiveGroups/Suggested.lean` lines 161–164: "Remark 12.56, p. 249, which states the theorem without proof and attributes it to Nagata".
- `README.md` lines 1821–1825.

**Claim.** The headline cites only a remark that has no proof, and Proposition 12.54 is only the commutative case. Milne 2017's Remark 12.56 is also false as printed for nonsmooth groups. That does not affect the statement here, which assumes smoothness, but it is one more reason the remark cannot be the only locator.

**Witness.** milne-iag (2017 edition) line 10330, p. 249: "`G°` is a torus", citing DG IV §3 3.6 and Kohls 2011; `μ_p` refutes it. The 2022 revision (lines 10301–10305) reads "of multiplicative type", with "Kohls 2011 for the smooth case".

**Repair.** In both files, add the proof locator for exactly the smooth connected case stated: M. Kohls, *A user friendly proof of Nagata's characterization of linearly reductive groups in positive characteristics*, Linear Multilinear Algebra 59 (2011), DOI 10.1080/03081080903402939. It is paywalled, so record it as uncertified. Add DG IV §3 3.6 for the general statement, and keep Remark 12.56 as a pointer.

## R04 (P3) — inputs are missing from *Needs:* and Dependencies after the GroupSchemesOverABase citations were removed

**Location and claims.**
1. `README.md` lines 1159–1161, the monomorphism ⇔ closed-immersion target (Milne 5.34). It has no *Needs:* of its own: the bullet's *Needs:* (lines 1165–1167) lists the Lie-kernel inputs. Milne's proof (milne-iag 2017, lines 4645–4648) goes through the quotient map `G → G/H` of his 5.28, so the quotient construction of the next bullet is an unlisted input.
2. The 9D multiplicative-type paragraph (lines 3648–3662) has its *Needs:* at lines 3676–3678 and the layer's Dependencies at lines 3764–3766. Neither lists these inputs, so they are owned by no layer, supplier section or pinned declaration:
   - étale sheaves with finitely generated stalks and the étale fundamental group (Proposition B.3.4, Corollary B.3.6);
   - Noetherian approximation (conrad-rgs line 11578: the proof of B.1.3 "may pass to the case of noetherian S");
   - the pinned `TauCeti.DiagonalizableGroup.groupScheme`.
3. Line 3616: "Layer 4's diagonalizable groups for the central kernels". Layer 4 works over a field, but this bullet is over any nonempty base (Conrad 6.1.16–6.1.17). The kernels `D_S(M)` there come from the bullet at line 3648 or the pinned `groupScheme`.
4. The References entry for Conrad's *Reductive Group Schemes* (lines 4605–4607) lists only Theorems 5.1.13 and 6.1.16–6.1.17. It omits Definitions 3.1.1, 5.1.1 and 6.1.1, Theorems 3.3.4 and 4.1.7, and Appendix B (B.1.1, B.1.3, B.3.3, B.3.4, B.3.6), which the layers cite.

**Repair.**
- Add "*Needs:* Layer 3's quotient construction (next bullet)" after line 1161.
- Add the following to 9D's *Needs:* and Dependencies:
  - SchemeAndStackFoundations §0.9 (Noetherian approximation);
  - EtaleCohomologyFoundations F.0.1–F.0.2 (on main, which cites no ReductiveGroups target);
  - an explicit 9D target for the lattice-fibre case of locally constant sheaves that F.0.1 does not cover;
  - `TauCeti.DiagonalizableGroup.groupScheme`.
- Replace line 3616's "Layer 4's" with "this layer's multiplicative-type theory over `S`".
- Extend the Conrad References entry.

**Test.** For the nonsplit torus `x²+y²=1` over `ℤ[1/2]` (9D Check, lines 3750–3752), splitting is detected only by `π₁(Spec ℤ[1/2])` acting by `−1` on `ℤ`. No listed supplier provides that action today.

## R05 (P3) — coordination and description: the previous R07, not repaired

**Location.** The pull-request description, and `README.md` lines 38–43, 53–62 and 64–65.

**Claims.**
1. The description still says "Depends on #1522 GroupSchemesOverABase". This head cites nothing from it, and #1522 consumes this roadmap.
2. The description says "Existing roadmap bytes are preserved". `git diff --name-status origin/main...HEAD` deletes seven `*Targets.lean` files and rewrites `README.md`.
3. #1332, #1797, #1807, #1808 and #1854 all conflict with this head in `README.md`/`Suggested.lean`, and no order is stated.
4. The README calls three roadmaps on main, or in open drafts, consumers, but they still say otherwise:
   - LieGroups `README.md` line 970: "Own here the **lower analytic dictionary**";
   - ReductiveGroupsPartII `README.md` line 62: "the single owner in Tau Ceti of Lang's theorem", and its `Suggested.lean` line 212 states `lang_surjective` again;
   - ChevalleyGroups has an open draft, #697.
5. #1522 at its head (README lines 72–74) states the multiplicative-type theory over a base, which 9D owns (line 3648).

This roadmap is on main, so each of these ownership questions settles in its favour, and the other roadmaps must cite it.

**Repair.** In the description:
- drop the #1522 dependency and the "bytes preserved" sentence;
- state which of the five conflicting pull requests this one rebases on or precedes;
- name the companion changes: LieGroups Layer 7 consumes 3A.5e; ReductiveGroupsPartII RG2.3 and its `lang_surjective` cite Layer 7a; ChevalleyGroups C4/C6 cite 9B; GroupSchemesOverABase Layers 1–3 cite 9D.

## Verified sound

**Gate, build and dependency check.**
- I re-ran the gate. Every check is 0 and it ends `OK`.
- `gate --depcheck … --movable` reports `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.
- `lake env lean …/Suggested.lean` exits 0 in 8 s, with 10 `sorry` warnings (lines 135, 152, 165, 185, 207, 228, 251, 271, 433, 474) and nothing else.
- One `#check @name` file over all 22 declarations elaborates without error. Each elaborated type matches its README statement. No section binder is lost: the file has no `variable` beyond `universe v`.
- The only proved theorem, `halfTwist_injective`, supports the data of `halfTwistLoop`.
- One-tactic probe: in a scratch copy I replaced each of the 10 `sorry`s by `first | rfl | trivial | infer_instance | simp | decide`. All 10 fail, so nothing is padding.
- No change outside the folder. The pins are Tau Ceti 2fd255d and Mathlib 1b1ccf4, as on main.

**Seeded sample.**
- §1.1, jantzen-1985 (printed page = PDF page − 5):
  - §2.8 comodule map, line 1100, printed p. 36 ✓;
  - §2.10(1)–(2), fixed points at the universal point, lines 1216–1223, p. 41 ✓;
  - §3.2 standing hypothesis "G flat", line 1487, p. 52 ✓;
  - §3.9 Proposition (b), embedding into `I ⊗ k[G]`, lines 1688–1700, p. 60 ✓;
  - §4.2 "G flat" for derived functors, line 1923, p. 69 ✓;
  - §4.7 Lemma (a), `Hⁿ(G, N⊗k[G]) = 0` for n > 0, lines 2001–2004, p. 73 ✓;
  - §4.15, line 2123, p. 78, and p. 79a at line 2159 ✓.
- §8.1, conrad-rgs Definition 5.1.1, line 5651, p. 136 ✓. Nonempty base, `T ≃ D_S(M)` with `M` finite free, constant roots, root spaces free of rank 1 and constant coroots are all in the README.
- §8.2, conrad-rgs Definition 6.1.1 and Remark 6.1.2, lines 7725–7751, p. 186 (the following discussion is on p. 187) ✓. The `Spec(k×k)` Check is Remark 6.1.2.
- The README flags no locator as unverified.

**New and headline locators.**
- conrad-rgs (Appendix B), all matching the README's statements and hypotheses:
  - B.1.1, line 11518, p. 280;
  - B.1.3, line 11567, p. 281 ("S-affine … of finite presentation");
  - B.3.3, line 11922, p. 290 ("fppf closed subgroup");
  - B.3.4, lines 11955–11962, pp. 290–291;
  - B.3.6, lines 12055–12066, p. 293 ("all Z-tori are split").
- milne-iag, 2017 edition (`iAG2017`), all ✓:
  - 5.14 line 4449 p. 102; 5.18 line 4492 p. 103; 5.21 line 4534 p. 104; 5.25 line 4571 p. 105; 5.34 line 4643 p. 107;
  - 1.39 line 1134 p. 18; 12.23 line 9961 p. 240, over every field via `k_s`;
  - 12.54 line 10307 p. 248; 12.56 line 10330 p. 249;
  - 17.10 line 14547 p. 354; 17.97 line 15767 p. 383;
  - 21.45 line 18041 and 21.47 line 18098, pp. 438–439; 21.75 line 18457 p. 448;
  - 22.43 line 19732 p. 478.
- mcninch: §3.1 line 236 p. 6; (3.2.1) line 280 p. 7.
- conrad-feng: Definition H.1.1 and Example H.1.2, lines 10356–10381, p. 238; Proposition 12.3.1, line 5345, p. 127.

**Library declarations opened at the pins.**
- Tau Ceti `TauCeti/Algebra/AlgebraicGroup/`:
  - `DiagonalizableGroup/Scheme/Basic.lean:86` `groupScheme` (any `CommRing R`, `FGCommGrpCat`), `:276` `schemeFunctor_full`, `:289` `fullyFaithfulSchemeFunctor`;
  - `DiagonalizableGroup/Scheme/ClosedImmersion.lean:40`;
  - `DiagonalizableGroup/Exact.lean:92`;
  - `DiagonalizableGroup/CharacterLattice.lean:117,167`;
  - `MultiplicativeType/Basic.lean:56`;
  - `MultiplicativeType/Character/Descent.lean:46` (`PerfectField`);
  - `MultiplicativeType/Splitting.lean:34` (no separability claimed);
  - `MultiplicativeType/GaloisModule.lean:127`;
  - `GroupAlgebra/Galois/MultiplicativeType.lean:44`;
  - `Torus/Splitting.lean:51` (no split-iff-trivial-action theorem is pinned, so that target stands).
- Tau Ceti `TauCeti/AlgebraicGeometry/AffineGroupScheme/MultiplicativeType.lean`.
- Tau Ceti `TauCeti/LinearAlgebra/RootSystem/Weyl/Group.lean:470,476` (`finite_weylGroup_of_span_eq_top` needs spanning, so the §11B finiteness bullet is not a restatement).
- Mathlib `LinearAlgebra/RootSystem/WeylGroup.lean:55,118,136`.

**Cross-roadmap citations resolved on main (1bea835).**
- SchemeAndStackFoundations §§0.3, 0.7, 0.8, 0.9, 1.1, 1.5, 1.13–1.15, 2.6, 4.12 (headings present).
- ModularCurves §0E; RootSystems §§5.1–5.2.
- SmoothBundlesConnections, LieGroups, LieHighestWeight, AlgebraicTopology, DGFloer, ReflectionInvariantTheory, AlgebraicVectorBundles and IntegralLattices are present on main.
- ChevalleyGroups lines 60–85 (C2 takes 9B; "C0–C7 … denotes the semisimple specialization"). The README's new kept-variant clause agrees with it.
- ComplexComparisonPartII, FormalConnectionsOpers, IntegralHeckeAndGaloisDeterminants, AdelicAlgebraicGroups and InverseGaloisAndArithmeticFundamentalGroups appear only as consumers, never in a *Needs:* line.
- `roadmaps resolve` reports no cross-roadmap citation found nowhere. Its 18 Lean-name leads are all declarations of this `Suggested.lean`; I checked each with `#check`.

**Ownership against open pull requests.**
- GroupSchemesOverABase (#1522, through `roadmaps show`): see R05; this roadmap is the owner.
- ChevalleyGroups' open draft #697 exists. I did not read its head.
- The overlap check lists no dropped or revision-only ids.
- Lang's theorem moves down from ReductiveGroupsPartII into Layer 7a, which removes the upward edge main had.

**Adversarial pass.** "✓" means both sides agree.

| Statement | Instances | Values computed (statement / independent) | Result | Change |
|---|---|---|---|---|
| `isIso_coinvariantsQuotient_of_isNormal` | `μ_p⊂μ_{p²}`; `I=0`; `I=ker ε`; non-normal `B⊂GL₂` | `t^j` coinvariant iff `p∣j`: `k[t^p]≅k[s]/(s^p−1)`, `O(G)` free with basis `1,…,t^{p−1}` / `μ_p` ✓; `Δf=f⊗1⇒f=ε(f)` so `k` / point ✓; all `O(G)` / `G` ✓; `O(GL₂)^B=k` / `ℙ¹` not affine | true; normality needed | none |
| `linearlyReductive_iff_reductive_identityComponent` | `S₃`, `O₂`, `𝔾_a` in char 0; `ℤ/p` in char `p` | LR / `G°=1` reductive ✓; LR / `SO₂≅𝔾_m` ✓; `[[1,a],[0,1]]` indecomposable / `R_u=𝔾_a` ✓; `k[u]/(u^p)` indecomposable, not LR / `G°=1` reductive | true; `CharZero` needed | none |
| `linearlyReductive_iff_torus` | `𝔾_m`, `SL₂`, `𝔾_a`, trivial, `μ_p`, constant `ℤ/ℓ` | yes/yes; `⟨x^p,y^p⟩` uncomplemented / no ✓; no/no; yes / rank-0 split ✓; LR, not a torus (smoothness excludes); LR, not a torus (connectedness excludes) | true | R03 |
| `exists_levi_complement` | Borel of `GL₂/ℚ`; `𝔾_a`; `GL₂`; Greenberg `SL₂(W₂)` | `gu=(a,ax+b,d)` so coinvariants `k[a^±,d^±]`, `J=(b)`, identity ✓; `I_u=0`, `J=(t)`, `k→k` ✓; `J=0` ✓; no Levi (mcninch line 280) | true; char 0 needed | none |
| `exists_conjugate_eq_of_isMaximalTorus` | `GL₂×μ_p/k̄`; `S₃`; `SL₂/ℝ`; `V₄⊂PGL₂` | `T×1` conjugate by `GL₂(k̄)` ✓; `g=1` ✓; `SO₂(ℝ)` compact vs diagonal unbounded (algebraic closedness needed); `V₄` has dimension 0 and is not a torus | true | none |
| `exists_titsSystem_of_isBorel` | `GL₂/𝔽₂`; `SL₂/𝔽₃`; `𝔾_m`; `T'=gTg⁻¹`, `g=[[1,0],[1,1]]` | `|B|=2`, `B∩N=1`, `6=2+4` ✓; `|B|=6`, `|N|=4`, `|BwB|=36/2`, `24=6+18` ✓; one cell ✓; `B∩N(T')=k^×·⟨[[−1,1],[0,1]]⟩`, conjugate by `[[a,0],[a−d,d]]` is `[[−a/d,a/d],[d/a−a/d,a/d]]`, in `B` iff `a=±d` | true; `T⊆B` needed | none |
| `exists_levi_complement_of_isParabolic` | `P=G`; `B⊂GL₂/𝔽₂`; imperfect `k` | `J=0` ✓; `J=(b)` in char 2 ✓; every parabolic is `P_G(λ)` with Levi `Z_G(λ)`, conrad-feng lines 10375–10379 ✓ | true | none |
| `lang_surjective` | `𝔾_a`, `𝔾_m` over `𝔽₂`; constant `C₂` | `x²−x=a` solvable in `𝔽̄₂` ✓; `g^{q−1}=a` ✓; Lang map `≡1` misses the nontrivial point | true; connectedness needed | none |
| `plane_braid`, `halfTwist`, `halfTwistLoop` | `n=0,1,2`; `t=0,½,1` | `Fin(n−1)=Fin 0`, `π₁=1=B_n` ✓; `Conf₂≅ℂ×ℂ*`, `ℤ=B₂` ✓; `z(½)=(½−i/2, ½+i/2)`, counterclockwise ✓; `z(1)=(1,0)` ✓ | true | none |
| `nonempty_mulEquiv_artinGroup` | `±2/±1` on `ℂ`; `ι=∅`; `A₁×A₁`; `B₂` at `(1,2)` | `ℂ*/±1≅ℂ*`, `ℤ=Art(A₁)` ✓; `1=1` ✓; `ℤ²=Art(m=2)` ✓; root values `1,2,3,−1`, orbit of 8 = `|W(B₂)|`, free ✓ | true | R02 (carrier) |
| `corootReflectionGroup` vs native action | rank one | `closure{−id}={±id}` / `weylGroup.op={1,s}`, `s=−id` (`range_weylGroup_coweightHom`), same orbits | same object | R02 |
| §11B `A₂` Check | three lines in `ℂ²` | `H₁(complement)=ℤ³` / `Art(A₂)^ab=ℤ` | Check correct | none |
| §1.1 invariants | `μ_p` weight-one line | `μ_p(𝔽̄_p)=1` acts trivially / `1⊗t≠1⊗1` so `Mᴴ=0` ✓ | true | none |
| §1.1 Hochschild | `ℤ[t^±]` weight 1 | `d⁰1=1⊗(t−1)`; `d¹=t⊗(t−1)−(t⊗t−1⊗1)+(t−1)⊗1=0` ✓ | true | none |
| §1.1 injectives | trivial group over `ℤ` | `ℤ` acyclic / `2ℤ→ℤ`, `2↦1` needs `2x=1`: not injective ✓ | true | none |
| §8.1 | `SL₂`/`PGL₂`; `SL₂/𝔽₂` | `α=2e` / `α` generates ✓; `𝔽₂[t]/(t−1)²` length 2 ✓ | true | none |
| §8.2 | `x_α(2t)/ℚ`; `Spec(k×k)` | `2E₁₂≠E₁₂` ✓; signs `(+,−)` not constant ✓ | true | none |
| Layer 4/9D vs pin | `μ_n`; `μ_p/𝔽_p(a)` | `X*(μ_n)=ℤ/n` = pinned `geometricCharacterGroupEquiv`; exact sequence = pinned `isShortExact…` ✓; descent needs `PerfectField`, so this case remains a target | duplicate | R01 |
| 9D `B.3.3` Check | `μ₂` vs `V(t²−1, 2(t−1))/ℤ` | `2(uv−1)=2u(v−1)+2(u−1)` ✓; `ℤ[s]/(s²,2s)` has 2-torsion; fibres `ℚ`: point, `𝔽₂`: `μ₂` ✓ | true | none |
| 9D `B.3.4`/`B.3.6` Checks | `Spec ℤ`; `x²+y²=1/ℤ[½]`; `𝔽₅` | `π₁=1` so split ✓; `x=(u+u⁻¹)/2`, `y=(u−u⁻¹)/2i`, Galois `u↦u⁻¹` acts by `−1` ✓; `2²=−1` in `𝔽₅` ✓ | true | R04 (*Needs:*) |
| 3A.5e comparison | `𝔾_m→GL₂`; `z↦(e^z,e^{√2z})` | closed `{b=c=0, ad=1}`, `diag(1,−1)≠0` ✓; injective, images of `2πin` accumulate at `(1,1)` while `2πin` diverge ✓ | true | none |
| Layer 3 monomorphism criterion | Frobenius of `𝔾_a`; `μ_p→GL₁` | kernel `α_p≠1`: neither ✓; `k[t^±]→k[t]/(t^p−1)` onto: both ✓ | true | R04 (*Needs:*) |
| Milne Remark 12.56 | `μ_p` | linearly reductive, `G°=G` / "`G°` a torus" false | source error | R03 |
| Elementary generators | `SL₂(ℤ/4)` | `x_α(1)x_{−α}(−1)x_α(1)=[[0,1],[3,0]]`, `a=0` not a unit ✓ | true | none |
| 7C rank-one identity | `a=b=1` | `[[2,1],[1,1]]=[[1,0],[½,1]]·diag(2,½)·[[1,½],[0,1]]` ✓ | true | none |

## Not verifiable

- brieskorn-1971, "Satz, p. 57": the GDZ copy is an image-only scan and OCR is not available on this worker. The Bourbaki exposé (brieskorn line 97) attributes Proposition 1 to this paper, but the page and the numbering are unchecked.
- Kohls 2011, proposed in R03: paywalled (tandfonline returned 403), DOI 10.1080/03081080903402939.
- Settled as uncertified, not read: Waterhouse, Borel, Springer.
- Paywalled, cited without a text: Conrad–Gabber–Prasad 2nd ed.; Jantzen 2003 Part II §§3.18–3.19; Howlett–Lehrer; Dipper–Du; Carter; Lang 1956; Steinberg 1968; Serre; Gassmann; Demazure–Gabriel.
- The manifest key `milne-iag` points to the 2015 v2.00 notes, whose numbering differs from the 2017 edition the README cites. I read the cached 2017 and 2022 author copies (`iAG2017`, `iAG2022`).
- Cached, outside the sample and untouched by any change, not re-read this round: dudas-michel, riche, gros-kaneda, frenkel-kac, heden, salvetti, callegaro, birman-brendle, fox-neuwirth, fadell-neuwirth, arzhantsev, ernst, fang-lim-tan, sga1, conrad-adelic.
- ChevalleyGroups' open draft #697 was not read.

## Source issues

- **Error** in milne-iag (2017 edition) at Remark 12.56, p. 249: the source says an algebraic group in characteristic `p` is linearly reductive iff `G°` is a torus and `p` does not divide the index; it should say `G°` is of multiplicative type (`μ_p` is linearly reductive, not a torus); affects nothing; corrected in print at the author's 2022 revision, Remark 12.56.
