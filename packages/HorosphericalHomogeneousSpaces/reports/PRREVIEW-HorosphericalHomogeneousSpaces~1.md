# Review of HorosphericalHomogeneousSpaces (pull request #3141 at 817f2c6)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason only: the folder has no `Suggested.lean`, so the roadmap has no acceptance test and nothing to build. The mathematics held up on every instance I computed (the rank-one curve of §2.1, the character lattice of `P_I` for `SL₂`, `GL₂`, `PGL₂`, the unsaturated example `μ_n ⊂ G_m`, the dimension formula), and every locator into [Pas06] and every step taken from [MT26] is in the text where the README uses it. There are four small corrections and three format notes, none blocking; one question of scope (characteristic zero only) is left to the human reviewers.

## R01 (P2) — The folder contains no `Suggested.lean`, so no headline is stated or declared not statable

A roadmap is accepted against its Lean file: an implementer cannot tell which of the headline theorems are meant to be stated on the pinned carriers and which wait for a supplier, and the module `TauCetiRoadmap.HorosphericalHomogeneousSpaces.Suggested` cannot be built. The folder at this head holds `README.md` and `metadata.toml` only. The README also writes `IsHorospherical H` and `IsStandardHorospherical H` in code font (§0.2, lines 106–107), which reads as a claim that the Lean file declares them.

The smallest change: add `Suggested.lean` with `import Mathlib` and the individual `TauCeti.*` modules used, a module docstring that lists the headlines (the bijection `(I,M) ↦ H_(I,M)`, uniqueness of the standard conjugate, the structure theorem `N_G(H) = HT` parabolic with torus quotient, the open Borel orbit and dimension formula), and for each either its statement with `sorry` or one line saying which carrier is missing. The standard parabolic `P_I` and the root datum of the actual `(G,T)` are supplier targets not yet in the pinned library, so the two classification statements are presumably not statable and are then only named in the docstring; a file that states nothing is acceptable when it says why. The two predicates of §0.2 have real bodies on pinned carriers (`TauCeti.FiniteTypeCommHopfAlgCat.unipotentRadical` in `Unipotent/Radical/Construction.lean:129`, `TauCeti.HopfIdeal.conjugate` in `HopfIdeal/Conjugation.lean:75`, `TauCeti.HopfIdeal.IsParabolicOverAlgClosed` in `Parabolic/Basic.lean`), so they should be declared only if a stated headline uses them; otherwise write the two names in prose in the README.

## C01 — One Tau Ceti declaration and five Tau Ceti files named in the README are not in the pinned library

An implementer who opens the cited places finds nothing. At the pin of the manifest (Tau Ceti `2fd255d`):

- §0.1 line 86 cites `TauCeti.HopfAlgebra.conjugationComoduleAlgebra` in `Hopf/Conjugation/Coaction.lean`. Neither exists. The only declaration of that short name is `BialgHom.conjugationComoduleAlgebra` (`DiagonalizableGroup/Centralizer/Smooth.lean:208`), the conjugation action of a diagonalizable group `D(X)` on `G`, which is a different object. What the pin has for `G` acting on itself is the algebra map `conjugationAlgHom : H →ₐ[R] H ⊗[R] H` (`Hopf/Conjugation.lean:66`).
- `Submodule.stabilizerHopfIdeal` is in `Representation/Stabilizer.lean:193`, not `Representation/Stabilizer/Basic.lean`.
- `Fppf/Quotient/Homogeneous/SchemeMap.lean` and `.../Scheme.lean` (§2.2, line 186) and `Tangent/RootSpace/BaseChange.lean` (Dependencies table) do not exist; the folder `Fppf/Quotient/Homogeneous/` holds `Basic`, `Torsor`, `BaseChange`, `Coinvariants`, `GeneralLinear`.

Cite `conjugationAlgHom` and make the comodule-algebra structure on `O(G)` part of the §0.1 target; correct the path of the stabilizer; drop or replace the three missing files.

## C02 — The steps taken from [MT26] carry no locators, and its "heights" are Frobenius heights

§2.1 and Layer 3 cite "[MT26]'s Lie-subalgebra stability, root-intersection 'heights' lemma and smooth-case statements" and "[MT26], characterization by character kernels" without numbers, so a reader cannot check the adaptation without searching the paper. In the HAL version the places are: Proposition 3.8 (Lie subalgebras containing `Lie(U)`), Lemma 4.1 (the curve with value `u_{−γ}(−x²)`), Lemma 4.2 (`H ∩ U_{−γ} = P ∩ U_{−γ}`), Proposition 4.4 and Remark 4.3 (`P = HT`, torus quotient), Proposition 5.4 and Corollary 5.5 (connected, then smooth `H`), Proposition 4.7 and Corollary 4.9 (character kernels and the classification). I checked each against the README's use. Add them.

The word "heights" in the source means the Frobenius height of the group scheme `P ∩ U_{−γ}`, which is 0 or ∞ in characteristic zero; in the next sentence the README's "induction on root height" means the height of a root. Saying "the lemma comparing `H ∩ U_{−γ}` with `P ∩ U_{−γ}`" removes the clash. The same paragraph says "the source's conjugation curve": name [MT26], Lemma 4.1. The textbook locators "Milne (2017), Chapter 1 (normalizers)" and "Milne (2017), quotients and torsors" would likewise be more useful with a section or result number.

## C03 — Three supplier labels in the Dependencies table are not headings of ReductiveGroups

The table says its labels "name their prose targets", but ReductiveGroups on main has no item titled "Tangent space at the identity / `Lie(G)`" (Layer 2 is one untitled paragraph), §3A.2 is titled "Local closedness and the reduced orbit model", not "Constructible image and local closedness", and there is no item "BN-pairs / Tits systems" (the Tits system is inside the Layer 7 item "Bruhat decomposition"). The other labels resolve as written, as do FlagVarieties §§2.1, 2.2, 3.1, 3.2, 4.1 and its three contracts. Cite "RG Layer 2", "RG 3A.2 'Local closedness and the reduced orbit model'" and "RG 7 'Bruhat decomposition'".

## C04 — "Realizable now" and the description list fewer suppliers than the layers use

Line 251 and the pull request's description say "Layers 1–4 consume ReductiveGroups Layer 7 and FlagVarieties §2". By the README's own table, Layer 1 also needs RG 4 and 6, Layer 2 needs RG 2, 3 and 7C, Layer 4 needs FlagVarieties §§3.1 and 3.2, and the independent layer needs RG 3A and FlagVarieties §4.1. Either list them or say "the suppliers of the Dependencies table". The description should also say that the pull request adds no Lean file, or stop saying so once R01 is repaired.

## N01 — Layer headings and the opening

The layers are headed "Layer 0 — …" and "Independent layer"; the site's structure page and the coverage summary read headings of the form `## Layer k: <title>`, so "Layer 0: …" and an id for the independent layer (for example "Layer 5") would let them be tracked. The opening would be recognised as the overview if it began `**Summary.**`.

## N02 — Wording tied to the present state of the library

"Realizable now", "the existing APIs" (line 250), "existing `Tangent/RootSpace.lean`" (table) and "a first step towards" (line 11) describe a moment in time; a supplier contract ("at the pinned Tau Ceti, Layer 0 needs only …") says the same thing timelessly.

## N03 — Two Checks that would pin the classification

The roadmap has no Checks. Two that could fail for a wrong convention: for `G = SL₂` the standard horospherical subgroups are exactly `SL₂`, `B` and `μ_n ⋉ U` (`n ≥ 1`), matching `I = S, M = 0` and `I = ∅, M = nℤ` with `n ≥ 0` (the opposite labelling of `I` would give `X(P_S) = ℤ`); for `G = PGL₂`, `X(T) = ℤα` and `⟨α^∨, α⟩ = 2` give `X(G) = 0`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 normalizer, action `(g·f)(x)=f(g⁻¹xg)` | composition law; `H=1`, `H=G` | `(g·(h·f))(x)=f(h⁻¹g⁻¹xgh)=((gh)·f)(x)`; `N_G(1)=N_G(G)=G` | left action; holds | C01 (pointers) |
| §0.2 definitions | [Pas06] Def. 1.1 | source: `H ⊇ U` (Pas06 line 247, printed p. 12); README "standard" = source's notion | agrees | R01 (names) |
| §0.3 Lie inclusion | `A` connected, `K=Stab(W)` | `Lie(A)⊆Lie(K)` stabilises `W`; pinned `LieStable.lean:85` needs connected, char 0, alg. closed: all in Conventions | holds | none |
| §0.3 curve extension | `R[t] → R[t,t⁻¹]` | ideal of `H_R` maps to 0 in `R[t,t⁻¹]`, injective, so 0 in `R[t]` | holds | none |
| Layer 1 `X(P_I)` | `SL₂`, `GL₂`, `PGL₂`, `I=∅`, `I=S` | `SL₂,S`: `n=0`; `GL₂,S`: `(a,b)`, `a=b` (= ℤ·det); `PGL₂,S`: `2m=0`; `I=∅`: `X(T)` | holds, incl. non-simply-connected | N03 |
| §2.1 step 1 constants | types A, B, G | `N_{γ,δ}=±(r+1)`, `r≤2`: values ±1, ±2, ±3; invertible in char 0 | holds | C02 |
| §2.1 step 3 curve | `SL₂`, `a=z²`, `y=x/z` | `u_−(y)u_+(a)u_−(−y) = [[1−zx, z²],[−x², 1+zx]]`; at `z=0`: `u_−(−x²)`; MT26 line 754–761 same matrix | holds | C02 |
| §2.1 step 4 disconnected `H` | `SL₂`, `H=μ₂·U` | `N_G(H)=B=HT`; `B/H=G_m/μ₂≅G_m` torus | holds | none |
| §2.2 characters and torsor | `G=G_m`, `H=μ_n`; `H=P` | `M_H=nℤ`, rank 1; `H=P`: `M=0`, rank 0; `(gH)(pH)=gpH` well defined since `H⊲P` | holds | C01 |
| Main theorem part 1 | `G_m`, `M=nℤ`; `GL₂`, `I=∅`, `M=ℤ·det`; `M=0` | `H=μ_n`; `H=B∩SL₂`, `N_G(H)=B=P_∅`; `H_(I,0)=P_I`; `X(P/H_(I,M))=M` by duality | bijective on instances | N03 |
| Main theorem part 2 | `H'=gHg⁻¹` both standard | `P'=gPg⁻¹` standard, so `P=P'` (FV §3.1), `g∈P(k)` (FV §3.2), `H'=H` | holds | none |
| Open orbit, dimension | `G_m/μ_n`; `H=P`; general | `Bn₀P=Bn₀TH=BTn₀H=Bn₀H`; `1=0+1`; `dim G/P=dim G/P+0` | holds | none |
| Convention `I` = Levi roots | FV §2.1, Pas06 p. 11 | FV: `P_J ⊇ U_{−α}`, `α∈J`, `P_∅=B`, `P_S=G`; Pas06: `P_I=⟨B,W_I⟩`; same | consistent | none |

- Source locators checked against the text: 9 of [Pas06] (Def. 1.1, Ex. 1.2, Prop. 1.3, Def. 1.4, (1.4.1), Rem. 1.5, Prop. 1.6 and proof, paragraph after Def. 1.7; printed pp. 12–14 all correct, Pas06 lines 247–316); 8 results of [MT26] located (lines 469, 739, 762, 774, 777, 808, 836, 911–961).
- Library declarations opened at the pin: 17 (15 found as cited, 1 found under another path, 1 absent; see C01), plus 20 cited files (5 absent).
- Cross-roadmap citations resolved on main: every ReductiveGroups label of the Dependencies table (3 carry other titles; see C03), 5 sections and 3 contracts of FlagVarieties.
- Dependency check: `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. Both suppliers are on main.
- Automatic checks: one failure, the missing Lean file, raised as R01. No elaboration was possible: there is no file to elaborate, and so no `#check` comparison and no one-tactic probe.
- Duplication: no declaration or roadmap on main or at an open head states horospherical subgroups, the normalizer of an arbitrary closed subgroup over a field, or the Lie-inclusion criterion; FlagVarieties' scope excludes horospherical spaces and scheme-theoretic normalizers by name.

Overlap check: read FlagVarieties, ReductiveGroups, GroupSchemesOverABase (main); nothing shared (GroupSchemesOverABase owns `N_G(H)` only for `H` of multiplicative type). The open heads of ClassicalGroupsPartII, ReductiveGroups and PadicHodgeTheoryPartII were searched for the objects, not read in full.

Source independence: 11 passages compared with 2 sources ([Pas06], [MT26]), none shared beyond formulas; largest share Pas06, 7 of 15 citing places; contents compared with Pas06 (seven numbered items of its Chapter 1 against six layers): independent. Milne, Humphreys and Borel were not read.

Research link: The headline is the classification of horospherical homogeneous spaces of Pasquier (2006, Prop. 1.6), the starting point of the theory of horospherical varieties; the structure theorem is proved by the route of Maccan–Terpereau (2026), who extend the classification to characteristic `p ≥ 3`. Rests on the README and both texts.

## Not verifiable

- Milne, *Algebraic Groups* (2017), Chapter 1 (normalizers), §13.b, "quotients and torsors": no legal open copy of the published text; not read.
- Humphreys, *Linear Algebraic Groups*, §13: not read, same reason.
- Borel, *Linear Algebraic Groups*, 11.16: not read, same reason.
- Statability of each headline at the pins: not tested by elaboration, since the folder has no Lean file.

## Source issues

- **Misprint** in MT26 at Lemma 4.1, p. 14 (MT26 line 741): the source says the conclusion is that `u_{−γ}(x²)` lies in `H(R)`; it should be `u_{−γ}(−x²)`, as its own proof computes (MT26 line 761); affects nothing.

## For the human reviewers

- Scope: the roadmap fixes an algebraically closed field of characteristic zero and puts positive characteristic out of scope (README lines 31–32), although [MT26] classifies for `p ≥ 3`; whether that restriction fits the general-library principle is yours to decide.
- Licence: [MT26] was read from its HAL deposit (CC BY 4.0); the pull request's author is one of its two authors. [Pas06] was read from the HAL thesis archive.
- Not tested: the three textbooks (Milne, Humphreys, Borel) were not read; five locators rest on them.
