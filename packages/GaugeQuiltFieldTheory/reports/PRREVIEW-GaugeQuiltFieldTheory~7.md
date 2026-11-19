# Review of GaugeQuiltFieldTheory (pull request #2577 at 1b98d46)

**Verdict:** needs changes

**Summary.** One finding blocks: §3.1 now owns the connected Cerf theorem, but its plan has no input for the step that compares two Morse data. That step needs one-parameter Cerf theory on bordisms and the Gay–Kirby connected-fibre homotopy, and neither is a target here or a cited supplier. Every other statement I computed holds, including the three Lean theorems, the normalization `c₁ = 2r[Ω]`, the monotonicity adapter, the relative-spin parity choice and the weighted-adjoint Check. There are three small corrections (an overview clause that the layers do not state, a rank-one Check that calls an isomorphism an identity, a locator whose source assumes spin) and one format note. Nothing is left for a human to decide.

## R01 (P2) — The connected Cerf theorem of §3.1 is a target whose plan has no input for its one-parameter step

§3.1 (line 268) makes the connected Cerf theorem a target in the decorated setting: any two connected Cerf decompositions are related by the moves. Layer 5's field theory depends on it through the extension principle. Its plan, though, has inputs only for single Morse functions, so an implementer has nothing for the comparison of two Morse data, which is the substance of the theorem.

The *Needs* line of §3.1 (line 270) lists §0.1, GeometricTopology §1.3 and §1.3.1, and Wehrheim–Woodward. GeometricTopology §1.3.1 on main covers a single Morse function on a triad: existence, regular bands and the elementary handle step. It says nothing about paths of functions, and its scope excludes handle calculus (its line 156). For Theorem 2.2.11, Wehrheim–Woodward give only remarks on the proof (ww-coprime lines 387–422). Their route uses two inputs:

- the genericity of one-parameter families (Thom–Mather and Cerf: only cusps and crossings of critical values);
- the result they attribute to Gay–Kirby (their reference 18, Theorem 2, Geom. Topol. 19 (2015); ww-coprime line 394), which they use to keep the level sets connected along the homotopy.

Neither input is a target here or a cited supplier section. HeegaardFloer §1.5 (M.5) on main owns "the ordinary one-parameter Cerf theorem", but only on closed manifolds (its Lane M, line 219), and §3.1 does not cite it. No roadmap on main or in an open pull request states the Gay–Kirby result.

Smallest change: add two targets to §3.1, each with a locator:

- the one-parameter Cerf theorem for adapted functions on a compact bordism, fixed near both ends, with HeegaardFloer §1.5 (M.5) in the *Needs* line for the closed case;
- the connected-fibre homotopy theorem, with its Gay–Kirby locator.

Alternatively, take the route of Wehrheim–Woodward Remark 2.2.12 (relative Reidemeister–Singer through Motto's thesis, Chapter 4, and Milnor's rearrangement) and name those inputs instead.

## C01 — The overview's Lagrangian embedding for every compression body is not a target of the layers

The overview (line 5) says: "If `Y` is a compression body between surfaces of positive genus, restricting connections to the two ends embeds the moduli of `Y` as a Lagrangian correspondence". §2.1 (line 152) proves an embedded Lagrangian image only "For each elementary connected one- or two-handle bordism, and for cylinders". The statement is true (Wehrheim–Woodward Theorem 3.4.3 with Lemma 3.4.4; for `k` one-handles from genus `g`, `dim M(Q) = (2g−2+k)(r²−1)`, half of the product), but a reader who looks for it in Layer 2 finds only the elementary case. Either say "elementary bordism" in the overview, or extend §2.1's target to compression bodies between surfaces of positive genus.

## C02 — The rank-one Check of §4.2 calls the functor of the point correspondence the identity; it is only isomorphic to it

Line 321: "the point correspondence `pt ⊂ pt⁻ × pt`, whose functor on the point-quilt category is the identity". With `F_L` defined by concatenation (line 315), this functor sends the length-zero object of `C(pt)` to the length-one sequence `(pt)`. §4.1 keeps sequences distinct (line 295), so `(pt)` is a different object. The functor is isomorphic to the identity in `H⁰Fun` and represents the identity morphism in `A∞(4)/S`, which is all the Check needs. A possible wording: "whose functor represents the identity of `C(pt)` in `A∞(4)/S`".

## C03 — Ma'u–Wehrheim–Woodward Theorem 1.2 is cited for composing relatively spin correspondences, but it is stated for spin ones

§4.3 (line 329) proves strip shrinking for replacements that satisfy "all the admissibility, grading, spin and background conditions of §3.2", and cites Ma'u–Wehrheim–Woodward Theorem 1.2. That theorem assumes spin structures (mww-functors lines 90–95). It only remarks that the relatively spin case involves a shift of the background class (lines 96–97) and does not state that case. §2.3 shows that `L_2` is not spin, so the relatively spin version is the one this roadmap uses. One clause would fix this: "(the spin case is Theorem 1.2 there; the relatively spin version, with its background shift, is proved here through the cancellation of §2.4)".

## N01 — The rank-one Check of §1.4 (line 111) writes `c₁ = 2r[ω]` where Conventions 3's normalized form `Ω` is meant; `ω` is not defined at that point.

## Questions for the author

- §4.3 (line 329) ends with "Concatenation remains the object operation when such geometric replacement is unavailable". Does this mean that `F_L` acts on objects by geometric composition whenever a replacement exists? If so, §4.2's definition by concatenation (line 315) should say so, and C02 changes accordingly. I could not settle which reading the layers intend.

## Verified sound

| statement | instances tried | values computed on each side | result |
|---|---|---|---|
| §0.1 decorated bordisms (WW Definitions 2.2.1, 2.2.6) | cylinder; one-handle `g→g+1`; degrees of the ends | `⟨c₁(Λ_Q),[X₊]−[X₋]⟩ = ⟨c₁, i_*∂[Y]⟩ = 0`; 2.2.1(b) at most one critical point (ww line 205); 2.2.6 equal indices (line 299) | supports the text |
| §1.1 adapter from R5; ineffective kernel | `g≥1` coprime; `r=1`; `g=0, r≥2` | R5 on main (line 307): fixed positive-definite `Ad`-invariant `B`; central stabilizers give kernel `μ_r·I`; `r=1`: trivial; `g=0`: excluded by "`g ≥ 1`" | holds |
| §1.2 relation model and Checks (WW Remark 3.3.7, eq. (31); Theorem 3.3.3(c)) | `r=2, ζ=−1`; clock and shift `r=2,4`; `g=0`; `ζ↔ζ⁻¹` | `A(BA⁻¹B⁻¹)=A·A=−1`; `CS=ζSC`; `det C=(−1)^(r−1)` for even `r` (`r=4`: `i⁶=−1`); empty product `1≠−1`; `[B,A]=[A,B]⁻¹` | all hold; (31) at ww line 1333 |
| §1.3 normalization and dimension (WW Remark 3.2.2(b), (26), Proposition 3.3.2, Theorem 3.3.3(a)) | `U(1)` Jacobian; `r=2` generator of `π₂`; `r=3, g=2`; `U(r)` count | `Ω(2πe,2πf)=1`; DFL line 274: area `2π²` under `−∫tr`, `c₁=2`, so `[Ω]=c₁/4`; `2·8=16`; `U(r)` adds `2g` | `c₁=2r[Ω]` holds; WW's literal form is off by `4π²` |
| §1.5 naturality and tensoring (WW Lemma 3.3.6) | `r=3, d=5, ℓ=−1`; shift-by-`ℓ` variant | `d′=2`, `ζ=e^(4πi/3)` unchanged; `d=4` would give `e^(2πi/3)`; Lemma 3.3.6(a),(b) at ww lines 1292–1297 | holds |
| §1.6 rank two (DFL Remark 2.2, eq. (2.5), Lemma 2.43) | DFL's trace; `r=2` class | DFL line 189: `tr(AB)` on `su(2)`, so (2.5) is `−∫tr₂`; `4π²τ_WW=π²`; sequence at line 244; holonomy `(−1)^l` at line 682 | supports the text |
| §2.1 elementary correspondences (WW Definition 2.2.6, Lemma 3.4.4, Theorem 3.4.3) | cylinder; `r=2` handle `1→2`; handle from the sphere | diagonal of dimension `(2g−2)(r²−1)`, half; `M(Q)=S³`, `3=(2·1−1)·3`, `dim H¹(X₊)=6`; `[C,1]=1≠ζ` gives `∅` | holds; Lemma 3.4.4 needs positive genus (line 1387) |
| §2.4 composition of lifts (SpinGeometry G4, FukayaTheory FK1.1) | bundle count in the stable identity | both sides `B₀+2B₁+B₂`; `TL₀₁⊕TL₁₂ ≅ TL₀₂⊕TM₁` from the transverse sequence | consistent |
| §2.5 orientation lines (orientations paper, Theorem 1.0.1) | `D` invertible; `diag(0,1,…,1)` | signs `+1`, `−1`; ww-orientations line 189 orders `det(coker)*⊗det(ker)`; HeegaardFloer F0.0 `det ker⊗(det coker)*` | order matches the source; reorder needed for F0.0 |
| §2.6 monotonicity adapter (FukayaTheory FK3.1, FK6.1) | `r=2` sphere with `c₁=2`; incoming factor | `μ=4`, area `1/2=τ_WW·2=τ_FK·4`; `τ_FK=τ_WW` gives `1`; on `M⁻`: `−2, −4, −1/2` | holds |
| headline: handle `L_2` not spin (§§2.2–2.3) | `r=2, d=1, g=2→3`; uniform background choices | `s*TL₂≅TN₂⊕E₂`, `w₂=0+α mod 2≠0` (ss-newstead Proposition 1; ss-rank-two lines 30, 862); `B_g=E_g` gives `0`; `B_g=0` gives `0` | identity holds only with the parity choice |
| §3.1 connected Cerf theorem (WW 2.2.1, 2.2.2, 2.2.9, 2.2.5, 2.2.11, 2.2.13) | inputs of the route | ww lines 387–397: Thom–Mather genericity and Gay–Kirby; *Needs*: GeometricTopology §1.3, §1.3.1 (single functions) | R01 |
| §3.2 replacements (WW Lemma 3.4.4, proof of Theorem 3.5.1) | critical-point cancellation | WW Remark 3.5.4(a) (line 1561): composite is the diagonal; Lemma 3.5.3: `H²` vanishes for each move | supports the text |
| §4.1 objects and degrees (WW Remark 3.5.2; MWW Theorem 1.1) | `|m_k|` mod 4; length-one object | `|m₃|=−1≡3`; arity-two terms of degree `1`; homological convention puts `m₃` in degree `1`; FK4.1 signed, FK6.1 monotone | holds |
| §4.2 rank-one Check | `F_pt` on `C(pt)` | length-zero object goes to `(pt)` of length one | C02 |
| §4.3 weighted adjoints; MWW Theorem 1.2 | `φ=λs`, eigenvalue `a` | `e^((a−2λ)s)∈L²_φ` iff `a<λ`; for `−∂_s+A` iff `a<−λ`; MWW line 92 assumes spin | adjoint Check holds; C03 |
| §4.4 shift target | `k=0`; `a=1, b=−1` | reflexive; `G S_D⁻¹ F S_C ≃ GF` through `S_D⁻¹F≃FS_C⁻¹`; `[S_C]=[id]` | holds |
| §4.5 two functor levels (MWW 1.1; WW 2.2.13, 3.5.1) | statements at their lines | MWW lines 63–70: functor for each admissible correspondence; WW line 460: unique extension; line 1489: symplectic-valued theory | supports the text |
| §5.1 field theory (WW Theorem 3.5.1) | `r=1`; sphere ends, `r≥2` | WW for coprime positive `d, r`; README adds `r=1` points and the zero category, whose identity is the zero functor | consistent |
| `relationModuli_genus_one` | `r=1`; `r=2`; one-tactic probe | `SU(1)` trivial, one orbit; `r=2` pair unique up to conjugation; `simp` leaves goals | true, not padding |
| `relationSet_stabilizer_central` | eigenspace `m=1` at `r=2`; control `ζ=1`; `g=0` | `ζ^m=1` forces `m=2`; `ζ=1` gives stabilizer `SU(2)`, excluded; `g=0, r≥2` vacuous | true; `exact?` finds only itself |
| `relationModuli_simplyConnected` | `g=1`; `r=1`; `g=0` | point; point; `g=0` empty, and Mathlib's notion needs nonempty, so `1 ≤ g` is needed | true; `infer_instance` fails |
| overview: compression bodies | `k` one-handles from genus `g` | `(2g−2+k)(r²−1)` is half of `(4g−4+2k)(r²−1)`; §2.1 states only the elementary case | C01 |
| headlines not statable at the pins | `M(P,δ)`; correspondences; field theory | no connection moduli, Stiefel–Whitney classes only of quadratic forms, no Cerf decompositions, `ℤ`-graded `A∞` only | module docstring names each |

- Source locators read at their lines: 38 (ww-coprime 22, mww-functors 6, ww-orientations 2, dfl-atiyah-floer 3, ss-newstead 2, ss-rank-two 3); the seeded sample covered all 15 targets.
- Library declarations opened at the pins: Tau Ceti `CategoryTheory/AInfinity/Basic.lean:83`, `HomotopyCategory.lean:99, 104, 294, 335, 385, 396`, `Unit.lean:57, 75`, `Functor/Basic.lean:97`, `Functor/Comp.lean:419`, `Functor/HomotopyCategory.lean:191, 237`, `Geometry/Symplectic/Manifold/TwoForm.lean:115`, `TwistedProd.lean:47` (`pr₁*σ − pr₂*τ`), `Lagrangian/Manifold.lean:120`, `Topology/Algebra/UnitaryGroup.lean:115`; Mathlib `Matrix.specialUnitaryGroup`; no pinned statement of the twisted relation, connection moduli, Fukaya categories or bordism decompositions.
- Cross-roadmap citations resolved on main (7f401c6): HamiltonianReduction R5; SmoothBundlesConnections B1–B5; CharacteristicClasses C3.2; GeometricTopology §§1.1, 1.3, 1.3.1; SpinGeometry G4; HeegaardFloer Layers 2–5 (F0.0, F1.1, F1.3, F1.4) and M.5; FukayaTheory FK0, FK1.1, FK3, FK3.1, FK4.1, FK4.2, FK6.1; DGAInfinity Standing conventions and Layer 2; DifferentialGeometry Layers 5, 6, 8; AlgebraicTopology §2.6, Layers 4 and 6, §6.1; InstantonFloerTheory cites GQ1 and GQ2–GQ5, all mapped by Conventions 8; the open HeegaardFloer revision keeps F0.0, F1.1, F1.3, F1.4 and M.5.
- Automatic checks: the worker's checks all passed and a rerun of the gate on this head passed every check; dependency check `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; no change outside the folder.
- Elaboration of `TauCetiRoadmap/GaugeQuiltFieldTheory/Suggested.lean`: three `declaration uses sorry` warnings (lines 59, 67, 78), nothing else; `#check @` of all five declarations matches README §1.2 (`1 ≤ r`, `IsPrimitiveRoot ζ r`, `1 ≤ g` for simple connectivity), no binder lost; an `rfl` example confirms that `ConjAct` acts on tuples by simultaneous conjugation; the one-tactic probe (`simp`, `infer_instance`, `simp_all`, `exact?`) closes nothing.
- Headlines: the genus-one point, simple connectivity and central stabilizers are stated; the properties of `M(P,δ)`, the elementary correspondences with the non-spin handle, and the connected field theory are each named in the module docstring as not statable, with the carrier they lack; no padding.
- Previous review: its two findings concerned the description of the pull request that added this folder and were repaired there, so none applies here; this pull request's description agrees with the head (the renumbering, the new Layer 0, the two new suppliers, the three new Checks, 39 in all).
- Overlap check: read InstantonFloerTheory, FukayaTheory, HeegaardFloer (main and its open revision), DGFloer, SurfaceGroupCharacterVarieties, MappingClassGroupsAndCanonicalRepresentations; the rank-two odd-degree surface moduli is owned here (Layer 1) and consumed by InstantonFloerTheory IF9; FukayaTheory excludes gauge field theories and quilt functors (its line 34); SurfaceGroupCharacterVarieties owns the untwisted varieties (`∏[A_i,B_i]=1`), not the twisted `SU(r)` model; nothing else shared; the pull request that also changes FukayaTheory and FourManifolds was not among the checkouts given, so FukayaTheory was read on main.

Source independence: 18 passages compared with 6 sources. The longest shared run is one 10-word noun phrase naming the holonomy construction (§1.2 against ww-coprime line 1346); otherwise only formulas and hypothesis lists are shared. The largest share is ww-coprime, about 77 of 106 locators. Contents compared with ww-coprime §§2–4: independent. §§2.2–2.6, 4.2 and 4.4 have no counterpart there, and Cerf theory follows the moduli because §3.2 needs Layer 2.

Research link: Layer 1 is the coprime surface moduli whose rank-two case Daemi–Fukaya–Lipyanskiy (2021) use for their Atiyah–Floer comparison, consumed by InstantonFloerTheory IF9. Layers 2–5 are Wehrheim–Woodward's connected Floer field theory (arXiv 2016, v2 2018) built on Ma'u–Wehrheim–Woodward's `A∞` functors (2018). This rests on the README's overview and references and on the sources read.

## Not verifiable

- Atiyah–Bott (1983), Theorem 9.12: paywalled; the README cites it only as cited in Wehrheim–Woodward's proof, which ww-coprime line 1266 confirms.
- Gay–Kirby (2015): not in the manifest and not opened; R01 relies only on Wehrheim–Woodward's account of it (ww-coprime line 394).
- Drezet–Narasimhan (1989): mentioned only as cited in Wehrheim–Woodward's proof of Proposition 3.3.2 (ww-coprime line 1220).

## Source issues

- **Error** in ww-coprime at Theorem 3.3.3(a) and Proposition 3.3.2, printed pp. 28–29: the source states `c₁ = 2r[ω]` for the form of eq. (26), built from the basic inner product `−Tr`; it should be `c₁ = 2r[ω/(4π²)]`, since the class of that form is `4π²` times the normalized one; affects a stated result.
- **Error** in ww-coprime at Theorem 3.3.3(b), printed p. 29: the source says the genus-zero moduli is empty for every coprime `(r,d)`; it should assume `r ≥ 2`, since for `r = 1` the twist is trivial and the moduli is a point, as the proof on p. 30 shows; affects a stated result.
- **Misprint** in ww-coprime at Theorem 3.3.3, final clause, printed p. 29: the source says the moduli is always connected and simply connected; it should say so for genus at least one, since by part (b) the genus-zero moduli is empty; affects nothing.
- **Misprint** in ww-coprime at Remark 3.3.4, printed p. 30: the source says the genus-zero moduli is empty exactly when `d/r` is an integer; it should be the reverse (empty when `d/r` is not an integer), as the proof on the same page says; affects nothing.
- **Error** in ww-coprime at Theorem 3.4.3, printed pp. 32–33: the source says the Lagrangian of an elementary bordism is spin, treating it as a principal `G₀`-bundle; it should say relatively spin: it is associated to the `PSU(r)` framing bundle, and for `r=2`, `d=1`, genus `2→3` has `w₂ ≠ 0`; affects a stated result.
- **Misprint** in ww-coprime at the proof of Theorem 3.4.3, printed p. 33: the source cites a "Lemma 3.3.2" for a square root of the canonical bundle; it should cite the even Chern numbers of Theorem 3.3.3(a); affects nothing.
- **Misprint** in ww-coprime at Definition 2.2.9(c), printed p. 9: the source describes the cylinder-cancellation move as critical point cancellation; it should name it cylinder cancellation; affects nothing.

## For the human reviewers

- none
