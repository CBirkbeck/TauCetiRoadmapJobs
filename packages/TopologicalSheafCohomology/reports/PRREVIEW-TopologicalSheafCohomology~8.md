# Review of TopologicalSheafCohomology (pull request #2533 at 7b1730f)
**Verdict:** accepted

**Summary.** Accepted: no finding. The head is the one the previous review read, and a fresh pass over every section finds the three stated headlines true on the degenerate cases, elaborating at the pins, and every sampled Stacks and Pardon locator on its stated page. One small correction is carried over, not repaired (§0.1 asks for an equivalence, and §§1.2–1.3 for two further results, that the pinned Tau Ceti already has and the README does not name); no format notes; nothing is left for a human to decide.

## C01 — §0.1 asks for the constant-ring equivalence, which the pinned Tau Ceti already provides, and the README names it nowhere

An implementer reading the first paragraph of §0.1 (line 57) and its unit/counit bullet (line 59) would build an equivalence that exists at the pin. `TopCat.sheafModuleCatEquivLocallyConstant` (`TauCeti/Topology/Sheaves/LocallyConstant.lean:491`) is the equivalence `X.Sheaf (ModuleCat.{u} R) ≌ SheafOfModules.{u} (locallyConstantRingCatSheaf X R)` for any ring R: a locally constant function acts by gluing the actions of its values on the opens where it is constant, the inverse restricts along the constant functions, and unit and counit are the identity on sections. This is the construction §0.1 describes. The previous review raised the same point; the text is unchanged.

The same holds, in §§1.2–1.3, for two results the README states as things to prove while naming `TauCeti.Topology.cechCohomology` from the same directory: finite-cover cofinality on a compact space is `TauCeti.Topology.finiteCechCohomologyIso` (`TauCeti/Topology/Sheaves/Cech/Cofinal.lean:96`, `CompactSpace` only), and the vanishing for a presheaf with P(∅)=0 and zero sheafification is `TauCeti.Topology.isZero_cechCohomology_obj_of_isZero_sheafify` (`TauCeti/Topology/Sheaves/Cech/LocallyZero.lean:153`, compact normal X).

A clause at each place would do, for example "Tau Ceti's `TopCat.sheafModuleCatEquivLocallyConstant` is this equivalence", with a bullet under "From Tau Ceti". What the pin lacks (the comparison with the native ring-sheaf module forgetful functors, compatibility with restriction and stalks, the canonical Čech/derived isomorphism) stays a target.

## Previous findings

The previous review had no finding. Its one small correction:

- C01 — not repaired (the head is unchanged): §0.1 still reads "Construct the equivalence between sheaves of R-modules and modules over R_X" (line 57) and the README does not name `TopCat.sheafModuleCatEquivLocallyConstant`. Carried over as C01 above.

## Verified sound

| Statement | Instances tried | Roadmap side (computed) | Other side (source, library, Lean) | Result | Change |
|---|---|---|---|---|---|
| §0.1 headline `nonempty_moduleCohomologyForgetIso` | point with F=ℤ/4; F=ℤ/2 over 𝔽₂; X=∅; R=0 | V RⁿΓ: ℤ/4,0,0,…; ℤ/2 case H¹=0; ∅ and R=0 give 0 | Extⁿ(ℤ,ℤ/4)=ℤ/4,0,…; ℤ/2 not divisible yet H¹(pt)=0; `Iso.refl`, `infer_instance`, `simp`, `rfl`, `exact?` all fail | true, not padding | none |
| §0.1 acyclic-resolution bullet (sample) | flasque class against the two conditions | every sheaf embeds in a flasque one; flasque/flasque cokernel flasque, Γ exact | stacks-derived line 2835 (15.6, p.56): same two conditions; line 2966 (16.7, p.59); stacks-cohomology line 812 (12.3, pp.18–19) | supported | none |
| §0.1 Check on ℤ/4 at a point | cokernel-iterated and cosimplicial resolutions | iterated: ℤ/4,0,0,…; cosimplicial: dⁿ=Σ(−1)^i = 0,1,0,1,…, so H⁰=ℤ/4, H¹=0/0, H²=ℤ/4/ℤ/4=0 | stacks-cohomology line 3083 (30.1, pp.65–66); SchemeAndStackFoundations §2.5 defines G^{n+1} by cokernels | true | none |
| §0.1 Checks on scalars | ℤ→ℚ, ℤ→𝔽₂, two points, R=0 | ℤ/2⊗ℚ=0, 0→ℚ→ℚ→0 exact; 2⊗𝔽₂=0 not injective; Γ(R_X)=ℤ², (2,3)(a,b)=(2a,3b) | pinned `LocallyConstant.lean` docstring: global sections R×R on two points | true | C01 |
| §0.2 (sample) | point, ℤ --2→ ℤ in degrees 0,1; shift by 1 | H⁰=ker 2=0, H¹=ℤ/2; F[1] differential −2 | stacks-cohomology lines 114–126 ((3.0.1)–(3.0.3), p.3), line 3110 (30.2, p.66); Mathlib shift sign (−1)^k | consistent | none |
| §1.1 prism sign (TS1.1, sample) | point, two-index cover, singleton refinement, a=0, b=1 | h(c)=c₀₁; hδ(a,b)=b−a=T_b−T_a | stacks-cohomology line 2184–2185 (§20.25, p.47): T_{t′}−T_t; line 1072 (§20.15, p.24): γ−γ′ with the same h, gives a−b | README right; source misprint | none |
| §1.1 ordered complex and Checks | 0, 1, 2 indices; reversal; mod 2 | (a,b)↦b−a, H⁰ diagonal, H¹=0; one-index tuple complex 0,1,0,1; reversal sign −1 | stacks-cohomology lines 1821–1883 (23.1–23.6, pp.40–43; Remark 23.5 line 1874, p.41); pardon line 5262 (footnote 42, p.119) | true | none |
| §1.2 (TS1.2, sample) | ∅ with P(∅)=ℤ; Sierpiński; ℚ; point | ∅: {∅} gives ℤ, empty family gives 0, colimit 0; Sierpiński: H⁰={(a,a|)}≅P(X), H¹=0; ℚ: finite cover bounded | pardon lines 5231, 5237, 5240, 5267 (A.4.1–A.4.4, pp.119–120); stacks-cohomology line 407 (9.2, p.10); `Cech/Colimit.lean:61–70` | true | C01 |
| §1.3 headline `nonempty_cechCohomologyIsoRightDerived` (sample) | ∅; point; S¹ two arcs, ℤ, n=1 | ∅: 0; point: F(pt),0,…; S¹: (a,b)↦(b−a,b−a), Čech¹=ℤ | RⁿΓ: 0; F(pt),0; R¹Γ(S¹;ℤ)=ℤ; stacks-cohomology line 1169 (16.2, pp.26–28: Hausdorff quasi-compact, all n); five probes fail | true, elaborates | none |
| §1.3 presheaf Checks | {a,b}: P(∅)=ℤ else 0; P({a,b})=ℤ else 0 | tuple complex C⁰=0, C¹=ℤ², cocycle c_ab+c_ba=0, Čech¹=ℤ, P^#=0; second: sections die on singleton cover | `LocallyZero.lean:153` keeps P(∅)=0 and states the same counterexample | true | none |
| §1.3 fixed-cover bullet | S¹ one-set cover | H¹ of cover 0 ≠ ℤ, hypothesis fails as stated | stacks-cohomology line 678 (11.6, p.15): all finite intersections acyclic | consistent | none |
| §1.4 (sample) | point, ℤ --2→ ℤ; unit square; b=−1, m=1 | H⁰=0, H¹=ℤ/2; D²: −1+1=0; (−1)^{pq}D conj = d+(−1)^qδ; bidegrees (0,1),(1,0),(2,−1) | stacks-cohomology line 2129 (sign (−1)^{p+1}d_F on p+1 indices), lines 2196, 2229 (25.1–25.2, pp.47–48); pardon line 5386 (A.4.13, p.122) | true | none |
| §1.4 page-of-descent claim | repeated point cover, (0,1) | T₀=0, T₁=1 on C⁰; h lowers Čech degree by 1: internal filtration E₁, Čech filtration E₂ | stacks-cohomology line 2145 (h formula) | true | none |
| §2.1 headline `properFiniteFiberStalk` (TS3.5, sample) | {a,b}→pt; (0,1)→ℝ; two origins→ℝ; empty fiber | (3,1)↦(3,1); ℤ→0 not iso; ℤ→ℤ² diagonal; empty fiber V=Y∖f(X), F(∅)=0 | closes by `isIso_fiberStalkMap F hf.isClosedMap (hfin y)` (`FiberStalk.lean:256`); docstring says so; pardon lines 4931, 5202, 5321 | true; proved at pin, stated as such | none |
| Godement contract, lines 9 and 47 | C=`ModuleCat.{u} R` | abelian, colimits, products; `Sheaf.H` comparison abelian only | `godementResolution` signature at pin: Abelian, HasColimits, HasProducts, HasSheafify; SchemeAndStackFoundations README line 4271 on main | matches | none |
| Line 30, no pinned acyclic-resolution comparison | grep of pinned Tau Ceti | claims absent | `rightDerivedIsoOfResolution`, `rightDerivedΓIsoGodement` not at the pin; only vanishing half in `SheafCohomology/AcyclicResolution.lean:83` | accurate at pin | none |

- Source locators checked against the text: 25 (stacks-cohomology 15, stacks-derived 2, pardon 8), all on the stated pages.
- Library declarations opened at the pins: 23 by `#check` or by file and line (Mathlib 8, Tau Ceti 15), every path in the supplier contracts confirmed.
- Cross-roadmap citations resolved on main: SchemeAndStackFoundations §2.5 (line 4271); ImplicitAtlases §§0.5–0.11, §0.7, §6.5 (lines 163–266, 216, 766, 84–88); CharacteristicClasses C1.2b (lines 715, 747) and S0–S5; ComplexKahlerGeometry K2 (line 324).
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with three `sorry` warnings (lines 34, 53, 72) and nothing else; the `#check @` types of the three declarations agree with the README statements (no binder lost); one-tactic probes fail on lines 34 and 53, line 72 closes with one term as its docstring says.
- Automatic checks: all passed at this head; the change touches only `README.md` and `Suggested.lean` of the folder.
- Pull request text: title and every sentence of the description hold against the diff with main (two declarations renamed or removed, two added, no heading changed, no supplier added or dropped).
- Ownership: no open pull request changes this roadmap; no other roadmap, on main or open, states the Čech/derived comparison, the stalk theorem or a declaration of the same name.

Overlap check: read ImplicitAtlases, SmoothBundlesConnections, GromovWittenTheory; the open-cover Čech colimit and its derived comparison are owned here (SmoothBundlesConnections' scope says so, ImplicitAtlases §0.7 and GromovWittenTheory consume TS1.1–TS1.2 and §1.4); compact-cover K-presheaf hypercohomology is owned by ImplicitAtlases; nothing has two owners.

Source independence: 14 passages compared with 3 sources (stacks-cohomology, stacks-derived, pardon), none shared beyond forced phrases; largest share stacks-cohomology, 15 of 24 locator citations; contents compared with stacks-cohomology: independent (Layer 0 draws on its §§3, 12, 30, Layer 1 on §§9, 11, 15, 16, 23, 25, out of order; Layer 2 on none).

Research link: §§1.1–1.2, 1.4 and 2.1 are the Čech foundations of Appendix A of Pardon (arXiv:1309.2370v6) for virtual fundamental cycles, consumed by ImplicitAtlases §0.7 and through it GromovWittenTheory; rests on the README's scope section and pardon Definition A.4.3, Lemmas A.4.8 and A.4.13.

## Not verifiable

- none: every cited text was read at its locator.

## Source issues

- **Misprint** in stacks-cohomology at §20.15 (tag 09UY), p.24: the source says the map of the first index function minus that of the second equals dh+hd; it should be the second minus the first, as the computation in §20.25, p.47, gives for the same h; affects nothing.
- **Misprint** in pardon at Lemma A.3.2, p.118: the source says the compact set K lies in X; it should be K in Y, since the neighborhoods are preimages of opens of Y containing K; affects nothing.
- **Misprint** in pardon at Remark A.4.1, p.119: the source says each member indexed by β lies in the member indexed by f(α); it should be f(β); affects nothing.

## For the human reviewers

- none
