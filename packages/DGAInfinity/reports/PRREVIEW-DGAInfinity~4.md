# Review of DGAInfinity (pull request #2574 at 9f84816)

**Verdict:** accepted

**Summary.** Accepted: a full re-read of every layer, with the signs, Checks and worked examples recomputed and the sampled locators read in the sources, found no false statement, no missing hypothesis and no supply defect. The previous review had no findings to repair; its two format notes are unchanged, since this head is the one it read. There is one small correction (the description of `D_∞(A)` in §5.1) and two format notes, none blocking. Two ownership facts are left to the human reviewers.

## C01 — In §5.1, "`D_∞(A)` is the homotopy category of `A∞` modules" is true only for the strictly unital modules, and Keller's Section 4.2 proves it for a different class

§5.1 (line 1057) defines `D_∞(A)` as the localization of strictly unital `A∞` modules and then says "so that `D_∞(A)` is the homotopy category of `A∞` modules (Keller, Introduction, Section 4.2)". Read with all `A∞` modules the sentence fails: for `A = k`, the complex `k` with every `m_n = 0` for `n ≥ 2` is an `A∞` module with nonzero cohomology on which the unit acts by zero, so it is a nonzero object of the homotopy category of all modules and isomorphic to no unital one. Keller's theorem at that place (KellerIntro2001 lines 606–610) is about all `A∞` modules over an `A∞` algebra with no unit condition, and his `D_∞A` is their homotopy category; the unital case is his Section 4.3, Theorem (a) (lines 612–616), and Keller, *A-infinity algebras, modules and functor categories*, Section 4.9 (Keller2006 lines 843–846), where `D_∞(A)` consists of the homologically unital modules.

The smallest change: "so that `D_∞(A)` is the homotopy category of strictly unital `A∞` modules", with the locator extended to Section 4.3, Theorem (a), or to the 2006 survey, Section 4.9. §6.2 and the first headline of the overview already say "strictly unital `A∞` modules" and need no change.

## N01 — Three targets carry no locator at the claim

The Serre identity of §10.3 (line 1685) and the radical comparison of §10.4 (line 1705) cite no source at the claim; Bondal–Kapranov appear only in the Layer 10 introduction. The ring case of §3.5 (line 837, a morphism whose linear part is a chain-homotopy equivalence has an inverse up to homotopy) has none either.

## N02 — In the Layer 8 introduction, "is proved there" could be read as pointing to Keller

Line 1378 reads "the precise comparison of §8.3 is proved there from the component equation of §2.2". Directly after the clause about Keller, Section 3.3, "there" can be read as Keller's section, which only remarks the lift. "is proved in §8.3" would say what is meant.

## Previous findings

- The previous review, of this same head, had no findings and no small corrections. Its format notes N01 (locators in §§10.3 and 10.4) and N02 (the Layer 8 introduction) stand unrepaired and are N01 and N02 above.
- The repairs it confirmed were re-read and hold: "not conilpotent as soon as every tensor power `M^{⊗n}` is nonzero" (§0.2); "whenever `x·y = 0 = y·z`" (§8.3); "This is a construction, not an identification" (§2.4); "Toën, Definition 7.1 and Theorem 7.2(2), with the internal Hom of Theorem 6.1" (§6.5); "This is the locally proper notion" (§9.1).

## Verified sound

| Statement | Instances tried | Values computed (README / source or library) | Result |
|---|---|---|---|
| Convention 9, relations `n = 1…4` | every `(r, s, t)` with `r+s+t = n` in `(−1)^{r+st}` | `n=2`: `+,−,−`; `n=3`: `+,+,−,+,+,+`; `n=4`: `+,−,−,+,−,+,−×4`; element signs `ε(p)`, `−ε(p)` from `|m₁|=1`, `|m₃|=−1` | matches |
| Convention 10 `(MC)` | `n = 1, 2`; `s^{⊗n}` on `α^{⊗n}`; KellerIntro2001 lines 966–970 | sign `(−1)^{n(n−1)/2}`: `dα − α² = 0`; Keller (7.1) has the same sign on `δ` itself | true |
| §0.2 tensor coalgebras (sampled) | `M = k·x`; `M = ℚ/ℤ` over `ℤ` | `(1,…,1)` coordinate of `Δ̄^{(n)}` is `x^{⊗(n+1)} ≠ 0`; `ℚ/ℤ ⊗ ℚ/ℤ = 0`, completed = `M`, `Δ̄ = 0` | true |
| Layer 0 example, suspended unit | `(s⊗s)(a⊗e)`, `(s⊗s)(e⊗a)` | `b₂(sa, se) = (−1)^{|a|} sa`; `b₂(se, sa) = sa` | true |
| §1.2 DG categories (sampled) | `p = q = 1`; `Λ(x)`, `|x| = 1`, `d = 0` | `f ≫ g = −g ∘ f`; `H⁰ = Z⁰ = k` in degree 0 | true |
| §2.1 opposite and tensor | pin `Opposite.lean` lines 22, 81; `B = Λ(y)` | exponent `(n−1).choose 2` = `(n−1)(n−2)/2`; `m₂(a⊗y, a′⊗1) = (−1)^{|a′|} m₂(a,a′)⊗y` | matches |
| §2.2 component equation | arity 2; KellerIntro2001 lines 307–313 | left `f₁m₂ − f₂(m₁⊗1) − f₂(1⊗m₁)`; right `σ = 0` for both terms; `σ = Σ(r−j)(i_j−1)` equals Keller's `s` | true |
| §3.3 `m₃^H` and Layer 3 example | arity-3 morphism equation with `f₂ = −h m₂(i⊗i)`; `Λ(a,b,c)`, `dc = ab` | `m₃^H = p m₃ + p m₂(h m₂,·) − (−1)^{|x|} p m₂(·,h m₂)`; `m₃([a],[a],[b]) = p(a·c) = [ac]`; cohomology rank `1+2+2+1 = 6` | true |
| Layer 3 example, `m_n^H = 0`, `n ≥ 4` | trees with ≥ 2 internal edges | two edges into one vertex: `c·c = 0`; in a row: `c·y` has no `ab` component, `h` kills it | true |
| §3.5 Whitehead and unit strictification (sampled; headline; Lean) | `A = B = 0`; `A = k[ε]/(ε²)`, `dε = 1`, `B = 0`; KellerIntro2001 lines 505–509, Keller2006 lines 305–307 | `(dh₁+h₁d)(1) = 1`, `(dh₁+h₁d)(ε) = ε`; `e = 0` is a cohomological unit of an acyclic algebra, `B = 0` works | true; sources match |
| §3.4 Kadeishvili (headline) | KellerIntro2001 lines 252–257; Keller's example lines 281–294 | `m₁ = 0`, `m₂` induced, quasi-isomorphism lifting identity, unique up to non-unique isomorphism; `m₃(a,b,c) = e` | matches |
| §4.1, §4.2, §4.4 Checks | `C = k ⊕ kx`; `A = k ⊕ kx`, `x² = 0`; `k⟨x⟩`, `dx = x²`; `Λ(x,z)` | `|s⁻¹x| = |x|+1`; `d(x²) = x³−x³ = 0`, `dx + x² = 2x²`; twisted `m₁`: `dy − αy + (−1)^{|y|}yα`, Keller lines 1007–1011 agree | true |
| §5.1 derived categories (sampled) | `A = k`, module `k` with zero action; `ℤ/2 ⊗^L ℤ/2` | zero-action module: `H* ≠ 0`, unit acts by 0; `Tor` gives `ℤ/2` in degrees `−1, 0` | C01 |
| §5.3 shift signs | `r = s = 1`, `p = 0`; `r = 0`, `s = 1` | raw `−d f`, normalized `+d f`, identification `(−1)^{r·1} = −1`; second: `−da` | consistent |
| §6.1 quasi-equivalence invariance (sampled) | `k` against `M₂(k)` (§6.3 Check) | `H⁰` endomorphism rings `k ≠ M₂(k)`: Morita, not quasi-equivalent; §6.1 claims only the forward direction | true |
| §6.2 module equivalence (headline) | KellerIntro2001 lines 612–616, 733; Keller2006 lines 843–846 | `DA` ≃ homologically unital part of `D_∞A`; restriction along a quasi-isomorphism an equivalence | consistent |
| §6.3, §6.4 Morita and generators (sampled; headline) | `G = k ⊕ k⟦1⟧`; KellerDeriving1994 lines 509–514, 646–647, 1073–1080 | `End(G)`: degrees `0,0,1,−1`, dimension 4; Lemma 4.2(c), Theorem 5.3, Theorem 8.1 as cited | true |
| §6.5 Morita bicategory (sampled) | Toen2007 lines 1220–1232, 1111 | Definition 7.1(2) `RHom(Ĉ_pe, D̂_pe)`; 7.2(2) pull-back onto `RHom(C, D̂_pe)` | matches |
| §7.1 DG quotient (sampled) | `C = B = k`; Drinfeld2004 lines 218–227, 434–438 | `k⟨ε⟩`, `d(εa) + ε d(a) = a`: acyclic; Main Theorem 1.6.2 and §3.1 as cited | true |
| §7.2 Verdier comparison | Drinfeld2004 lines 480–484 | conditions (3.3), (3.4) are the two flatness alternatives; Theorem 3.4 | matches |
| §7.3 `A∞` quotients (sampled) | LyubashenkoOvsienko2006 lines 296, 333, 391, 407; LyubashenkoManzyuk2008 lines 145–150, 238–240 | Definition 2.1, Proposition 2.2, §§2.5, 2.6; Main Theorem 1.3 (existence, universal property), Corollary 1.6 (uniqueness) | matches |
| §7.4 `K₀` sequence | `B = {k ⊕ k}`; Chebolu2006 lines 460–466 (page 10); Mathlib `Generators.lean` line 134 | classes of `B`: `2ℤ ⊂ ℤ`, quotient 0: not exact; with `B′`: `ℤ → ℤ → 0`; `triangEnvelope` is retract-closed | true |
| Layer 7 example | `1 → 2 → 3`, quotient by `P₂` | `P₂^⊥` generated by `S₁`, `S₃`; no arrow `1–3`: all `Ext` vanish; `ℤ → ℤ³ → ℤ² → 0` | true |
| §8.1 Hochschild (sampled) | `k`, `M₂(k)`; first-order deformation | `HH⁰ = k`, `HH^{≥1} = 0` both; derivations `0` against `M₂(k)/k` (dimension 3); cocycle identity from `t`-coefficient | true |
| §8.3 and Layer 8 example | `⟨[a],[a],[b]⟩`; `A = k`, `x=y=z=1`; pin `Massey.lean` line 60 | `[a]² = [a][b] = 0`, indeterminacy `0`, value `{[ac]}`; `⟨1,1,1⟩ = ∅`; pin assumes `hxy`, `hyz` | consistent |
| §9.1 smooth and proper (sampled) | dual numbers; KellerICM2006 lines 905–909 | `dim Extⁿ(k,k) = 1` all `n`: not smooth; Keller's "proper" is Morita to a perfect DG algebra | true |
| §9.3 Calabi–Yau completion | `C = k`, `n = 2`; Keller 2011 (arXiv v5) Theorems 4.8, 5.2; pin `Ginzburg/Basic.lean` line 130 | `|t| = 1−n = −1`; Adams: `0 + 2·1 = 2` (loop), arrows `1 + 0`, reverse arrows `−1 + 2`; class in `HH_{n−2}` | true |
| §9.5 HRR (sampled) | Shklyarov (arXiv v3) Theorems 3.4, 3.5, 6.2 | `Σ(−1)ⁿ dim Hⁿ(N ⊗_A M) = ⟨Eu N, Eu M⟩` for proper `A`, `N ∈ Perf A`, `M ∈ Perf Aᵒᵖ`; nondegenerate if also smooth | matches |
| §10.1 `K₀(Perf)` (sampled) | dual numbers; `Λ(ε)`, `|ε| = 1` | `K₀ = ℤ·[A]`, `χ(A,A) = 2`; `Λ(ε)`: `χ(A,A) = 1−1 = 0`, `[A] ↦ [k] = 1 ≠ 0`, both radicals everything | true |
| §10.2 handedness | `Q = 1 → 2`; pin `EulerForm.lean` line 57 | `⟨d,e⟩_Q = Σ d_v e_v − Σ_{a→b} d_a e_b`; `⟨e₁,e₂⟩_Q = −1`, `⟨e₁,e₂⟩_{Qᵒᵖ} = 0 = ⟨e₂,e₁⟩_Q` | true |
| §10.3 Serre identity (sampled) | `S ≅ [d]`; `P_i`, `I_i`; pin `Projective/EulerForm.lean` line 98 | `χ(X,Y) = χ(Y,X[d]) = (−1)^d χ(Y,X)`; `χ(P_i,P_j)` = number of paths `j → i` at the pin | true |
| §10.4 radicals | pin `NumericalQuotient/Basic.lean` lines 90, 96 | `leftRadical = ker b`: `χ(x,−) = 0` ⟺ `χ(−,Sx) = 0` ⟺ `Sx` in right radical | true |
| §10.5 Chern character (sampled) | `A = k`, characteristic `p` | `ch(p[k]) = p·1 = 0` in `k`; `χ(p[k],[k]) = p ≠ 0` in `ℤ`; §9.5 states `χ` "as an element of `k`" | consistent |
| §11.2 Koszul duality (headline) | `1 → 2 → 3`, `a = e₂ae₁`, `b = e₃be₂`, right modules | `Ext¹(S₂,S₁) ∈ e₁Ee₂` like `a*`; `[a*][b*] ∈ Ext²(S₃,S₁)`; dimensions `6/5` and `5/6` | consistent |
| §11.4 Check | `A = k[x]`, `|x| = 0` | `E(A) = Λ(ξ)`, `|ξ| = 1`; `E(E(A)) = Π_n k·xⁿ = k⟦x⟧` | true |
| `Suggested.lean`, three theorems | elaborated types against §3.5; `simp`, `rfl`, `infer_instance`, `trivial` on each | `[Field K]`, `f.IsQuasiIso`, `AA.CohomologicallyUnital`, `AA.IsMinimal` all in the signatures; `simp` only reorders existentials; none closes | no padding |

- Source locators checked against the text: 27, in 11 texts (KellerIntro2001, Keller2006, KellerDeriving1994, KellerICM2006, Drinfeld2004, LyubashenkoOvsienko2006, LyubashenkoManzyuk2008, Chebolu2006, Toen2007, and Shklyarov and Keller's Calabi–Yau paper read from arXiv).
- Library declarations: all 332 names written with a `TauCeti.`, `CategoryTheory.` or `DerivedCategory.` prefix have a declaration at the pins; 14 opened and compared (among them `AInfinityAlgebra.op`, `StrictUnit`, `CohomologicalUnit`, `AInfinityHom.Homotopy`, `IsIso`, `IsQuasiIso`, `IsMinimal`, `leftRadical`, `eulerForm`, `ginzburgTwoAdamsDegree`, Mathlib `linearHomComplex`, `trW`, `triangEnvelope`). None of the three stated theorems is proved at the pin.
- Cross-roadmap citations resolved on main: GrothendieckEulerForms Smallness, §§2.4, 3.7, 4.4, 5.1–5.6, 7.1–7.2; ZigzagPreprojective §§5.2, 6.1, 7.1; McKaySkewGroup §3.3; HopfologicalAlgebra §6.1; GeneralAlgebraicKTheory §§11.3, 11.4, 11.4a, 11.6, 11.7. `InternalGrading.IsHomogeneous`, which the citation tool lists as found nowhere, is declared at `Suggested.lean` line 81.
- Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Automatic checks on this head: all pass; nothing outside the folder is changed.
- Elaboration: `lake env lean` on `Suggested.lean` gives only the three `sorry` warnings (lines 101, 114, 125); one `import Mathlib`, four `TauCeti.*` imports, no `set_option`, no sorried data. The `#check` comparison of all six declarations with the README changed nothing.
- Pull-request description against the head: 43 Checks in 30 blocks and 52 *Needs:* lines, as stated; the moved sections, the removed declarations and the supplier GrothendieckEulerForms are all stated.
- Headline theorems: Kadeishvili (at the pin), Whitehead and unit strictification (stated), the module equivalence, derived Morita, DG quotient and `K₀` sequence, HRR and Calabi–Yau completion, Serre identities, Koszul duality (each named in the module docstring with the carrier it lacks).

Overlap check: read HochschildHomologyAndHKR (open head), ZigzagPreprojective, RationalHomotopyModels, StablePeriodicCurved, GrothendieckEulerForms, HopfologicalAlgebra and GeneralAlgebraicKTheory (main); DerivedInfinityCategories and the open revisions of GrothendieckEulerForms and ZigzagPreprojective were searched by object only. HochschildHomologyAndHKR owns the ungraded theory and cites Layer 8 here for DG and `A∞` Hochschild theory; the Morita bicategory, DG quotients, Calabi–Yau completions and unit strictification are stated nowhere else. One shared object: the `K₀` sequence of a thick subcategory, owned by §7.4 here and also stated by HopfologicalAlgebra §6.1, which consumes this roadmap and so cannot supply it; left to the human reviewers.

Source independence: 14 passages compared with 9 sources (Convention 8, §§2.2, 3.3, 3.4, 3.5, 5.1, 6.4, 6.5, 7.1, 7.2, 7.4, 9.1, 9.5 and the `Suggested.lean` docstrings); none shared beyond what the mathematics forces (the labelling of the transfer trees, the defining relation `dε_U = 1_U`). Largest share KellerIntro2001, 18 of about 94 source mentions; contents compared with KellerIntro2001 (its Sections 3–7: algebras with minimal models, modules, triangulated structure, standard functors, twisted objects): independent, since the layers separate transfer from the definitions, put categories with algebras, and have no counterpart there for Layers 1 and 6–11. Getzler–Jones, Beilinson–Ginzburg–Soergel and Bondal–Kapranov could not be read.

Research link: Layers 3, 6 and 9 state Kadeishvili's minimal-model theorem (1982), Keller's derived Morita theorem (1994) and Keller's deformed Calabi–Yau completions (2011); Layer 7 is Drinfeld's DG quotient (2004). ZigzagPreprojective builds its Ginzburg algebras and Koszul theory on them. Rests on the README (§§3.4, 6.4, 7.1, 9.3, Downstream consumers) and on the sources read.

## Not verifiable

- Getzler–Jones (Layers 0 and 8, braces and signs): the Project Euclid page refused automated reading; no other legal copy was found.
- Beilinson–Ginzburg–Soergel, Section 2 (§11.2): the publisher's page is on a host the sources service does not classify; the handedness of `Ext ≅ A!` was checked on the quiver `1 → 2 → 3` instead.
- Bondal–Kapranov (§§9.4, 10.3), Lyubashenko's *Category of A∞-categories* (§3.5), May, Gerstenhaber, Kadeishvili, Positselski, Brav–Dyckerhoff, Balmer–Schlichting, Schlichting and Thomason were not opened; the statements resting on them were checked by computation where the table says so.
- The published numbering of Toën, Shklyarov and Keller's Calabi–Yau paper was not compared with the arXiv versions read.

## Source issues

- none

## For the human reviewers

- Ownership: §7.4 states the `K₀` sequence for a thick subcategory of a triangulated category; HopfologicalAlgebra §6.1 on main states the same (`TauCetiRoadmap/HopfologicalAlgebra/README.md` lines 606–611) and consumes DGAInfinity. One of the two should cite the other.
- `TauCetiRoadmap/StablePeriodicCurved/Suggested.lean` (main, line 2) imports this roadmap's Lean module; that is why `Suggested.lean` keeps three graded definitions no headline here uses.
