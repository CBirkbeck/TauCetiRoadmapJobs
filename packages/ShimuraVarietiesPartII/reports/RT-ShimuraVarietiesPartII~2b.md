<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13091#issuecomment-6918723927 -->
Red team round 2 pass b (claude) of e3fbcf2

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the "torsion-free" Siegel level does not exist, so no level is "sufficiently small"

   **Location.** `packages/ShimuraVarietiesPartII/README.md:19`: "a Siegel level K′^p is compatible with
   K^p when it contains the image of K^p, is neat and torsion-free (for instance, contained in the
   principal congruence subgroup of a level N≥3 prime to p)". Used at `README.md:62`, `README.md:434`
   ("through elements of K′^p, which is torsion-free, so inertia acts trivially") and `README.md:438`.

   **Claim.** Compatible Siegel levels exist; every K^p contains a sufficiently small normal open
   subgroup; the principal congruence subgroup of level N≥3 is torsion-free.

   **Witness.** Every compact open subgroup of GSp(V)(A_f^p) contains GSp(Λ⊗Z_ℓ) for almost all ℓ, hence
   the element that is −1 at one such ℓ and 1 elsewhere, of order 2. For N=3, p=5: (1,…,−1 at 7,…)
   lies in the principal level 3. So no level is compatible, none is sufficiently small, and every
   statement about Hodge-type models (Conventions: "neat K^p means sufficiently small") is vacuous.
   The owner of the notion that is needed is PELModuli §M2.2 (`IsNeat`, the adelic condition of Lan,
   with `isNeat_principalCongruence`), which the README does not cite.

   **Repair.**

   - `README.md:19`, replace "is neat and torsion-free (for instance, contained in the principal
     congruence subgroup of a level N≥3 prime to p)" by: "is neat in the adelic sense of PELModuli
     §M2.2 (for every g=(g_ℓ) in K′^p, the roots of unity lying in the eigenvalue group of g_ℓ for all
     ℓ≠p together are trivial; every subgroup of the principal congruence subgroup of a level N≥3
     prime to p is neat), so that the objects of the Siegel moduli problem at level K′_pK′^p have no
     nontrivial automorphisms (PELModuli §M2.8)". Add: "No compact open subgroup of GSp(V)(A_f^p) is
     torsion-free as a group: it contains −1 at almost every prime."
   - `README.md:62`, last sentence: "Neatness of a level in this sense concerns its rational
     intersections only; the Siegel levels of §1.6 are neat in the adelic sense of PELModuli §M2.2,
     imposed in Conventions." Add to the PELModuli contract (`README.md:78`): "§M2.2 (adelically neat
     levels; subgroups of principal level N≥3 are neat) and §M2.8 (no automorphisms at neat level)".
   - `README.md:434`, replace the step (iii)⇒(ii) by (iii)⇒(i), the argument of HT Lemma 1.3.6: "Let
     F′/F be a finite Galois extension over which A_s has good reduction and R″ the integral closure
     of R in F′, a semi-local Dedekind ring finite and flat over R (F has characteristic zero). A_s
     has good reduction at every maximal ideal of R″, so the abelian scheme, its polarization, the
     chain and the level structure extend over R″ and give an R″-point of the Siegel model. Its two
     pullbacks to R″⊗_R R″ agree on the generic fibre, which is schematically dense because R″⊗_R R″
     is R-flat, and the Siegel model is separated, so they agree; by fppf descent the point descends
     to R. Its generic point lies in Sh_K, so it lies in the closure and lifts to S_K as in (ii)⇒(i)."
     Then (i)⇒(ii)⇒(iii) as written. Add PELModuli §§M2.2, M2.8 to the *Needs:* of both theorems of
     §1.6 and to the Layer 1 *Dependencies* line.
   - `README.md:438`: "The torsion-free Siegel level cannot be dropped" becomes "Adelic neatness of the
     Siegel level cannot be dropped".

   Tested on the witness: the element (1,…,−1 at 7,…) of the principal level 3 has eigenvalue group
   {±1} at 7 and a group without roots of unity at 3 (Serre's congruence lemma), so the common
   torsion is trivial and the level is neat in the sense of §M2.2. Tested on the Remark: GL₂(Ẑ^p)
   contains −1 with eigenvalue group {±1} at every ℓ, so it is not neat, and the j=0 example stays
   excluded; the descent argument uses only that the moduli problem is a separated algebraic space.

2. **F02** (P2) the Hodge-type existence theorem cites DvHKZ Lemma 4.2.1 for Siegel levels it does not cover

   **Location.** `README.md:473` ("the stabilizer in G(Q̆_p) of Λ⊗Z̆_p for the single lattice Λ") and
   `README.md:477`: "compare completions through the Siegel model at the level of the lattice or
   chain, which is canonical (DvHKZ Lemma 4.2.1)".

   **Claim.** For every single lattice Λ allowed by §0.1 the Siegel model of Λ is a canonical integral
   model, so DvHKZ Theorem 4.1.8 applies to the closure of Sh_K in it.

   **Witness.** DvHKZ line 1458 states the lemma for a parahoric of GSp. Take V with basis
   e₁,f₁,e₂,f₂, ψ(e₁,f₁)=1, ψ(e₂,f₂)=p², Λ their span (Λ∨/Λ≅(Z/p²)²), and G a torus stabilizing
   Λ, such as the common-norm subtorus of Res_(Q(i)/Q)G_m² on Q(i)². The stabilizer of Λ in GSp₄(Q_p) lies in that of the self-dual
   M=Λ+pΛ∨ and reduces mod p to the stabilizer of a nondegenerate plane, which contains no Borel
   subgroup: it is not quasi-parahoric, and "canonical at that level" is undefined.

   **Repair.** In the sketch at `README.md:477` replace the sentence on (d) by: "For (d), in the
   chain case GSp(L) is a parahoric of GSp(V), its Siegel model is canonical (DvHKZ Lemma 4.2.1) and
   DvHKZ Theorem 4.1.8 applies. In the single-lattice case pass first to Zarhin's self-dual lattice
   Λ′=(Λ⊕Λ∨)⁴ in V⁸ (§0.1 Check; PadicDifferentialEquationsAndRigidCohomology §RD.5.116): the
   stabilizer of Λ′⊗Z̆_p in G(Q̆_p) is that of Λ⊗Z̆_p, the Siegel model of Λ′ is hyperspecial, hence
   canonical, and Theorem 4.1.8 makes the normalization S′_K of the closure of Sh_K in it canonical.
   The morphism A↦(A×A∨)⁴ from the Siegel model of Λ to that of Λ′ is finite (quasi-finite, and
   proper by the good-reduction criterion), so it carries the closure for Λ finitely and
   birationally onto the closure for Λ′, and S_K=S′_K (KP §4.1.5; PaRa24 §4.5.2, pp.85–86)." Add
   PadicDifferentialEquationsAndRigidCohomology §RD.5.116 to the *Needs:* at `README.md:479`.
   Tested on the witness: Λ′ is self-dual, GSp(Λ′) is hyperspecial, the lemma applies, and the
   stabilizer of Λ′ in the torus is still its unique parahoric.

3. **F03** (P3) §3.9 reduction theorem: a hypothesis of §3.3 it does not assume, and an input with no owner cited

   **Location.** `README.md:811`: "S_(K°) its normalization in Sh_(K°)(G,X) with K°_p=G°(Z_p) (as in
   §3.3)"; `README.md:815`: "the topological invariance of the étale site"; `README.md:817`
   (*Needs:* §1.4; §1.7; §3.3; …).

   **Claim.** The theorem holds in the very-good Hodge setup alone, with every input listed.

   **Witness.** §3.3 (`README.md:687–689`) assumes condition (D); the theorem does not. Finite
   étaleness without (D) is DvHKZ Theorem 4.1.15 (line 1405), already in §1.7. Topological invariance
   is owned by `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:467` (§F.0.4) and is not cited.

   **Repair.** Replace "(as in §3.3)" by "(the relative normalization of the Hodge-type theorem of
   §1.7, finite étale over S_K; condition (D) of §3.3 is not used)". In the *Needs:* line replace §3.3
   by "EtaleCohomologyFoundations §F.0.4", add that section to the supplier contracts ("§F.0.4: a
   universal homeomorphism induces an equivalence of étale sites") and to the Layer 3 *Dependencies*.

4. **F04** (P3) functoriality sketch: properness does not follow from axiom (a)

   **Location.** `README.md:469`: "Its projection to S_K is an isomorphism on generic fibres and is
   proper by the extension property (a)."

   **Claim.** Axiom (a) makes the projection of the normalized graph closure proper.

   **Witness.** (a) is a statement about the pro-system in K^p; it gives no valuative criterion at one
   level. DvHKZ lines 1365–1381 argue otherwise: isomorphisms on completions give an open immersion
   by Zariski's main theorem, and (a) for the target gives surjectivity on F̄_p-points.

   **Repair.** Replace that sentence and "So the projection is an isomorphism." by: "Its projection to
   S_K is an isomorphism on generic fibres. … [completions] … So the projection is quasi-finite and
   birational onto a normal scheme, hence an open immersion (Zariski's main theorem). It is
   surjective: a point of the special fibre of S_K lifts to a point over the ring of integers O_F of
   a finite extension of Ĕ; the prime-to-p tower is trivial over it, so its image in the generic
   fibre of the target lifts to the pro-tower and extends over O_F by (a) for S′; the pair lies in the
   graph closure."

5. **F05** (P3) axiom (d) is not DvHKZ's axiom (iv)

   **Location.** `README.md:447` ("for every x∈S_K(k)") with `README.md:449`: "DvHKZ, Definition
   4.1.2, p.28, for quasi-parahoric 𝒢".

   **Claim.** The Definition is that of DvHKZ at quasi-parahoric level.

   **Witness.** DvHKZ lines 1157–1158 require the completion isomorphism at points over every
   algebraically closed field ℓ with an embedding of k_E; DvHKZ line 1460 calls this formulation
   stronger than that of PaRa24.

   **Repair.** After the locator add: "DvHKZ require (d) at the points over every algebraically closed
   extension of k_E; the Definition here asks it only over k, as PaRa24 does. The uniqueness and
   functoriality proofs use only k-points, and the Hodge-type theorem proves the stronger form
   (DvHKZ Lemma 4.2.1 and the proof of Theorem 4.1.8, p.31)."

Five new findings: one P1, one P2, three P3. The P1 was introduced by the round-1 repair of the
neatness convention. Files read whole: `packages/ShimuraVarietiesPartII/README.md` (1486 lines, 63
numbered sections, 69 bold targets, 77 *Needs:* lines, 104 Check bullets),
`packages/ShimuraVarietiesPartII/Suggested.lean` (45 lines, no declaration), `sources.toml`, and the
`gaps` list of `design/plan.json` (22 entries).

## Round-1 findings: state at this head

| Id | State | Witness at this head |
|---|---|---|
| 1a/F01 (P1) canonical model undefined, §1.6/§1.7 order | repaired | `README.md:420` is now "1.6 Extension over discrete valuation rings", `README.md:440` "1.7 Canonical integral models" with Definition (a)–(d) and two theorems, `README.md:481` "1.8 Strict comparison", whose sketch reads "By the Hodge-type theorem of §1.7 and its axiom (d)". gap:integral-local-shimura (`README.md:132`) ends "no statement about a Shimura model is part of the gap". Two new defects in the added text: S02, S04, S05. |
| 1a/F02 (P2) gap asked a local supplier for a global torsor | repaired | `README.md:811` "**Theorem (connected-level reduction).**" states the reduction here; the gap (`README.md:134`) asks only for the exact sequence and the v-sheaf local-model map. New defect: S03. |
| 1a/F03 (P3) "neat" redefined | partly repaired | `README.md:19` now cites AdelicAlgebraicGroups §4.3 and ShimuraVarieties §0.3, but adds "neat and torsion-free", which no level satisfies: S01. |
| 1a/F04 (P3) §3.1 Checks | repaired | `README.md:666–667`: A_int(GL₂)=GL₂(A_f^p)/Z_(p)^× and A_int/A_int°≅∏_(ℓ≠p)Z_ℓ^×; recomputed below. |
| 1a/F05 (P3) *Needs* of §0.3 and of the extension theorem | repaired | `README.md:270` and `README.md:428`, `436` list PELModuli §§M6.1–M6.4 and gap:siegel-chain-moduli. |
| 1a/F06 = 1b/F05 (P3) "corrected" naming | repaired | `README.md:342` "Layer 1: Local geometry of Hodge-type models"; "corrected" survives only at `README.md:1481–1485` under "Source conventions and corrections". |
| 1b/F01 (P2) companions without p-plain | repaired | `README.md:188`: "whose Frobenius eigenvalues at every closed point are algebraic numbers that are units at every finite place not above p"; same text in `design/plan.json`. |
| 1b/F02 (P2) finite-level criterion unowned | repaired in structure | `README.md:430` "**Theorem (finite level).**"; `README.md:955` lists §1.6. Its hypothesis and its step (iii)⇒(ii) rest on the unsatisfiable convention: S01. |
| 1b/F03 (P2) gap:compact-quotient-borel | repaired | `README.md:122`: statements (a), (b) with "the identity component of I is reductive"; K17 lines 1383–1394. |
| 1b/F04 (P3) Layer 7 Checks on an excluded datum | repaired | `README.md:1398`: "Take the torus T=Res_(Q(i)/Q)G_m at p=5"; (1∓2i)/5 has trace 2/5 and norm 1/5. |
| 1b/F06 (P3) restating Checks | repaired | `README.md:594`, `618`, `746`, `773`, `1337` are computed instances; recomputed below. |
| 1b/F07 (P3) locator | repaired | `README.md:1482`: "KPZ §7.3.1(2), p.86". |

## The pass: declarations and targets with computed values

`Suggested.lean`: 0 declarations, 0 section variables, 0 instances; one `import Mathlib`, one module
docstring, an empty namespace `TauCetiRoadmap.ShimuraVarietiesPartII`. No `#check` file was
elaborated because there is no name; the docstring's 7 headlines were compared with `README.md:15`
(same theorems, same sections). No padding exists.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, compatible Siegel level | principal level 3, p=5; any compact open | element (1,…,−1₇,…) of order 2 in every compact open subgroup | no torsion-free level exists | S01 |
| Conventions, H₁/H¹ | E: y²=x³+x over F₅ | affine counts 1,0,1,1,0; #E=4; trace 2; T²−2T+5; inverse roots T²−(2/5)T+1/5 | agrees | none |
| Conventions, norm versus power | ζ of order 24, q=25 | ζ·ζ⁵=ζ⁶; ζ⁻¹·ζ⁻⁵=ζ¹⁸; ratio ζ¹²=−1; δ²=ζ² | agrees | none |
| §0.1 Check 2 | E: y²=x³−x over F₃, A=E×E, Iwahori chain | 3 affine points, trace 0; ker F=α_p², lines form P¹ | fibre of dimension ≥1 | none |
| §1.6 finite level (iii)⇒(ii) | inertia image in K′^p | finite subgroup of a group that is never torsion-free | step unsupported; HT's route (iii)⇒(i) works | S01 |
| §1.6 Remark | y²=x³+p, p≥5 | Δ=−16·27·p², v_p(Δ)=2<12, c₄=0: additive, j=0 | agrees | wording, S01 |
| §1.7 Check 1 | modular curve minus supersingular points | supersingular lift over W(k)[1/p]: Galois is inertia, trivial on T^p; no extension | (a) fails, (b)–(d) hold | none |
| §1.7 Check 2 | blow-up at a supersingular point | chart p=tv: W[[t,v]]/(tv−p), special fibre tv=0; other chart t=pu: W[[u−a]] regular | (d) fails at the node only, as stated | none |
| §1.7 Check 3 | GSp₄, p=3, Iwahori | N→hyperspecial finite; chain model has a P¹ over E×E | N not canonical | none |
| §1.7 Hodge type | Λ with ψ(e₂,f₂)=p² | Λ∨/Λ≅(Z/p²)²; stabilizer in GSp₄ reduces to that of a nondegenerate plane, no Borel | Lemma 4.2.1 not applicable | S02 |
| §1.7 functoriality | f derived isomorphism | f(Z_G) centralizes f(G_der)·Z_G′=G′; G_ad≅G′_ad | ad-isomorphism, as gap (vi) needs | none |
| §3.1 Checks | GL₂, hyperspecial | Z_(p)^×∩∏Z_ℓ^×={±1}; (A_f^p)^×=Q_(>0,(p))×∏Z_ℓ^×; π₀=Ẑ^×/Z_p^× | both ∏_(ℓ≠p)Z_ℓ^× | none |
| §3.5 Check | N=9, p=5 | (Z/9)^× of order 6, Q(ζ₉) unramified at 5; Q(ζ₄₅) ramified | agrees | none |
| §3.6 Check | w=[[0,1],[p,0]]; diag(p,1) | wMw⁻¹=[[d,c/p],[pb,a]]∈I; [[a,pb],[c/p,d]]∉I for c=p | agrees | none |
| §3.8 Check 3 | GU(1,1), Q(i), p=5, scalar i | i·ī=1; order 4 | agrees | none |
| §3.9 theorem | GL₂ edge midpoint; PGL₂ | det w=−p, extended-building fixer is I, connected; PGL₂ fixer has 2 components | reduction needed only when π₀≠1 | S03 |
| §4.9 Checks | (1∓2i)/5; π²=−3; δ_D=[[0,−1],[5,0]] | rank 2, e=1; e=2, Z(γ²)=GL₂; δ_D²=−5 | agrees | none |
| §4.5 Remark | SL₂, d=diag(3,1) | normalizer determinants ±(a²+b²), even 3-adic valuation; 1/3 has −1 | agrees | none |
| §5.3 Checks | 2, −2, −1, −11 mod 5 | 2, 3 non-squares; 4, 4 squares; rank 3=2+1 | agrees | none |
| §5.4 Checks | f₁=e₁+e₂/5, t=(1,2) | t·f₁=f₁+f₂/5 outside the lattice; Gram determinant u² | agrees | none |
| §6.3, §7.2 Checks | γ=(1−2i)/5 | trace 2/5, norm 1/5; γ²=(−3−4i)/25: −6/25, 1/25 | agrees | none |
| §7.1 Check 4 | χ₃χ₇ level | K₃=G(Z₃); K^p∩G(Q₃) of index 2 | agrees | none |
| gap:open-curve-companions | Frobenius 3, ℓ′=3 | 3∉Z₃^× | excluded by p-plain | none |
| gap:compact-quotient-borel | G_m, I=1; GL₂, I=B | F^× not compact; P¹(F) compact, B not reductive | both hypotheses needed | none |
| gap:integral-local-shimura (vi) | PaRa26 §5.1 | centre to centre, adjoint isomorphism, same point of the adjoint building | same hypotheses | none |
| gap:general-connected-reduction (i) | PaRa26 line 505; DvHKZ line 1565 | sequence on étale sheaves and on v-sheaves over Spd Z_p | as stated | none |

Dependency check (the command of the brief): `depcheck: 265 roadmaps, 2607 edges, 0 problem(s)`; no
UPWARD, CYCLE or `moved:` line. `roadmaps resolve` on the README: no citation and no Lean name
found nowhere.

## Verified sound

- **Declarations read:** 0. The two pinned names in the docstring and the 11 in the README were
  verified in round 1 and the file is unchanged since; no headline is statable at the pins
  (integral Shimura models, B(G), local models and tower local systems are absent).
- **Targets read:** 69 bold targets in 63 sections, with every API bullet, Check and Remark.
- **Locators verified this round (new or changed text):** 31, all correct. PaRa24: Proposition 2.6.3
  (line 1660, p.40), Theorem 2.7.7 (2059, p.48), Corollary 2.7.10 (2117, p.50), Proposition 4.1.2
  (3236, p.77), (4.2.1) and Conjecture 4.2.2 (3272–3292, p.78), Theorem 4.2.4 (3314, p.79), Theorem
  4.3.1 and Corollary 4.3.2 (3457–3464, pp.82–83), §4.5.2 (3576–3633, pp.85–86, the torsor on p.86),
  Theorem 4.5.2 (3642, p.87), §4.9.1 (4179, p.99). PaRa26: Definition 2.4.1 (293, p.7), Theorem
  2.5.5 (367, p.9), Propositions 3.2.1–3.2.2 (499–517, pp.12–13), Proposition 5.3.1 (1433, p.35).
  DvHKZ (printed page = PDF page − 4 in the body): Definition 4.1.2 (1141, p.28), Theorem 4.1.8
  (1214, p.30), Proposition 4.1.10 (1261, p.31), Corollary 4.1.13 (1385, p.34), Theorem 4.1.15
  (1405, p.35), Lemma 4.2.1 (1458, p.36), Theorem 4.2.3 (1470–1482, pp.36–37), Remark 4.2.4 (1483,
  p.37), Proposition 4.3.3 (1549, p.38), Lemma 4.3.4 (1565, p.39), Theorem 4.3.6 (1624, p.40),
  Theorem A.3.3 (1990, printed p.50). HT Lemma 1.3.6 (764–773, p.17), §1.3.2 (696–715, p.15),
  Corollary 1.3.16 (915–925, p.20). The round-1 locators (about 120 and 74 in the two passes) were
  not repeated.
- **Checks tested:** 27 recomputed (table), among them every Check added or changed in round 1.
- **Sibling citations checked:** 20 at main or at the open head. AdelicAlgebraicGroups §4.3 (main,
  line 4609: neat elements by one faithful representation, a neat element of finite order is 1);
  ShimuraVarieties §0.3 (`neat_sublevels`, normal of finite index); PELModuli §§M2.2, M2.8, M4.5,
  M4.6, M6.1–M6.4; NeronModelsAndSemistableAbelianVarieties §§5.1–5.2;
  HeckeStacksAndLocalShtukas §§HS2.1, HS2.10, HS2.11, HS2.13; DiamondsAndVStacksPartII §§D7.6, D9.8,
  D10.11; EtaleCohomologyFoundations §F.0.4.
- **Gaps:** 22 slugs, the same in `design/plan.json` and in the README, each with a named supplier.
  The four reworded in round 1 are precise and ask for local statements only; the README wording of
  gap:component-specialization and gap:rg3-r-smooth-tori differs from the plan's by a cross-reference
  ("as in Conventions", "of Layer 0") and not in content.
- **Ownership.** `scratch/overlaps.md` lists no shared roadmap, no dropped id and no second copy.
  No roadmap on main or at an open head read through the roadmaps tool owns Pappas–Rapoport
  canonical integral models. Adelic neatness has an owner (PELModuli §M2.2): S01.
- **Policy.** The pull request changes only `packages/ShimuraVarietiesPartII/`. No `lemma`, no
  `set_option`, no pull-request number, no process narrative outside "Source conventions and
  corrections", every target has a locator.
- **Wording.** 9 passages of the new text set beside their sources (Definition of §1.7 against
  PaRa24 Conjecture 4.2.2 and DvHKZ Definition 4.1.2; the three §1.7 API bullets against PaRa24
  lines 3293–3299; the sketches of §1.7(2) and §3.9 against DvHKZ lines 1274–1381 and 1576–1620;
  §1.6 against HT lines 764–773; gap items (ii), (v), (vi) against PaRa26 lines 499–511, 367–377,
  1279–1305): no shared run beyond 9 words, each a forced hypothesis list.

Source independence: 9 passages compared with 4 sources (PaRa24, PaRa26, DvHKZ, HT), none shared;
largest share KZ, 68 of about 197 locators; contents compared with KZ: independent (Layers 0–4
draw on HT, KPZ, KP, PaRa24 and DvHKZ; Layers 5–7 use KZ §§4.3–4.4, 5.2 and 5.1 with 5.3,
reordered, the order inside Layer 5 forced by §5.5 → §5.6 → §5.9 → §5.10 and Layer 7 after Layer 6
by §7.4 needing §6.3).

## Not verifiable

- Noot's theorem behind gap:noot-coarse-comparison, Borel–Tits Proposition 9.3, Anschütz's theorem
  and Gleason's formal neighbourhoods behind the PaRa26 items: cited by the sources, not in the
  cache; only their assignment to a supplier was checked.
- Finiteness of the Zarhin morphism between Siegel models used in the repair of S02: argued from
  quasi-finiteness and the good-reduction criterion, not checked against a printed statement.
- KZ, HT and K17 are cited in preprint pagination; agreement with the published numbering was not
  checked. DvHKZ and PaRa26 are cited by arXiv numbering, as the manifest records.
- No Lean was elaborated: the file has no declaration and this pass runs no build.
- Ownership against the open pull requests whose files the brief does not give was checked only
  through the roadmaps tool.

## Source issues

- **Gap** in DvHKZ at Theorem 4.2.3, proof, p.36: the source says the stabilizer in GSp of the lattice supplied by its reference is a parahoric and applies its Siegel lemma; it should first make the lattice self-dual or a periodic self-dual chain, since a direct sum of lattices can have a non-parahoric stabilizer; affects the proof.

## For the human reviewers

- **Licence.** HT and K17 are read from author pages (`sources.toml`, `licence_class = "author-page"`); KZ, PaRa24, PaRa26 and DvHKZ from arXiv, each recorded as not collated with its journal version.
- **Scope.** gap:integral-local-shimura items (i), (v), (vi) ask HeckeStacksAndLocalShtukas for integral local Shimura varieties and their completions; `reports/FIX-RT-ShimuraVarietiesPartII~1.md` records that its scope paragraph excludes integral representability.
- **Scope.** Neatness now has three meanings across suppliers (AdelicAlgebraicGroups §4.3 rational, PELModuli §M2.2 adelic, the README's "sufficiently small"); S01 picks the adelic one for Siegel levels.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "e3fbcf2559d13990640be55f34330df59d2e8c60", "job": "RT-ShimuraVarietiesPartII~2b", "model": "fable", "worker": "chris-x52"} -->
