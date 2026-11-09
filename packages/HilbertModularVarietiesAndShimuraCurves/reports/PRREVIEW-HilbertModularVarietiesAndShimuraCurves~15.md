# Review of HilbertModularVarietiesAndShimuraCurves (pull request #1005 at 7c9252d)

**Verdict:** needs changes

This is a full review. The head is the one the previous review read, so nothing in the folder has changed. There are four findings:

- **R01 (P2)** carries over, narrowed. QuaternionArithmetic (#1722) repaired its half during this review: its head moved to 4a6edeb8. ArithmeticFuchsianGroups (#2026, 5fdb26da) has not.
- **R02–R04 (P3)** are new:
  - R02 and R03 are wrong locators in two sampled targets.
  - R04 is garbled notation in code spans.

README means `TauCetiRoadmap/HilbertModularVarietiesAndShimuraCurves/README.md`. Line numbers in other roadmaps refer to the README at the head named.

## R01 (P2) — ArithmeticFuchsianGroups §1.2 restates the e=1 case of §R18.5.16a item 1 without citing it

This finding is carried over from R01 of the previous review. No repair report marks it `not actionable in this package`. It is now narrowed to ArithmeticFuchsianGroups.

**Location.** README:2365, §R18.5.16a item 1, owned here: the two maximal orders of `O₀(𝔭^e)` are "the ends of the path of length e in the tree of homothety classes", over every discrete valuation ring.

**Claim.**
- This roadmap is at merge-order line 160 and owns the local form of Eichler orders, including the pair of maximal orders at distance e.
- ArithmeticFuchsianGroups is at merge-order line 284. Its §1.2 states the case e=1 as its own target.
- Its §1.2 *Needs:* line does not name this roadmap, so one object has two owners.

**Witness.** #2026 at 5fdb26da:
- README:575–577 states the order-to-tree adapter: adjacent vertices give maximal orders that meet in an Eichler order of level `v`.
- The *Needs:* line at README:620–623 lists §1.1, EndoscopicTransferAndUnitaryTraceComparison, AdelicAlgebraicGroups, ClassicalArithmeticCompletion §7.60 and RG2.2. It does not list this roadmap.

**Repair.** Nothing in this folder changes. In #2026:
- the §1.2 *Needs:* line adds HilbertModularVarietiesAndShimuraCurves §R18.5.16a, item 1 at e=1;
- the adjacency clause of the adapter is marked as consumed;
- the vertex bijection and the normalizer statements stay as ArithmeticFuchsianGroups' own.

If the edit cannot be made there, the repair report records this finding as `not actionable in this package`, with that reason.

**Test of the repair.**
- Over `ℤ₂`, the adjacent lattices `ℤ₂²` and `ℤ₂⊕2ℤ₂` have intersection of endomorphism rings `O₀(2)`.
- `[GL₂(ℤ₂):K₀(2)]=#ℙ¹(𝔽₂)=3` (§R18.5.16a item 4). This agrees with #2026's own Check at README:616 that `Γ₀(2)` has index 3.

## R02 (P3) — §R18.5.4: BC91 Part II §2 is on pp.73–76, not pp.79–84

**Location.** README:1862, the source of §R18.5.4, cites BC91 “Part II §§2, 5.16, Definition 8.1, pp.79–84, 97–98, 107”.

**Claim.** The page ranges pair with the three items in order, so §2 is given as pp.79–84. §2 is not on those pages.

**Witness.** In the BC91 full-volume scan, printed page = PDF page − 5.
- §2, the Cartier theory of formal O_D-modules, opens at BC91 line 2558 on printed p.73.
- Its (2.1) defines special modules by the rank-one Lie condition at lines 2564–2573, also on p.73.
- §3 opens at line 2704, on p.77. So pp.79–84 are §3: Lemmas 3.4–3.7, Proposition 3.8 and Definition 3.11.
- (5.16) starts at line 3428, on p.98.

**Repair.** Cite: “Part II §2, (2.1), pp.73–76; (5.16), p.98; Définition (8.1), p.107”. The statement of §R18.5.4 is unchanged.

**Test.** The definition in §R18.5.4 is supported on the corrected pages:
- p.73 has the rank-one condition on Lie over `O′⊗B`;
- p.107 has Def. 8.1's height-4 special modules with a height-zero quasi-isogeny.

## R03 (P3) — §R18.4.3: CDN20 §5.2.1 p.41 does not contain the torsion criterion

**Location.** README:3430 gives the source as “CDN20 §5.2.1, p.41; NT16 Proposition 3.7(3), pp.31–32”. The theorem it supports is the torsion and reduction criterion from vanishing localized `H⁰` (README:3417).

**Claim.** CDN20 §5.2.1 sets up the Shimura curves `Sh_n(U)` and states Proposition 5.2, the de Rham and Hyodo–Kato multiplicity statements. Nothing on pp.41–42 concerns torsion, freeness or degree-0/2 vanishing.

**Witness.** The source that does carry these inputs is MS19 Propositions 2.3–2.4, pp.9–10:
- CDN20 lines 1597–1661 (pp.40–42) contain only the setup and Proposition 5.2.
- MS19 lines 444–480 (pp.9–10) prove that `H⁰` and `H²` are Eisenstein, using the adjoints `S*=S⁻¹` and `T*=S⁻¹T`.

**Repair.** Replace the CDN20 locator with MS19 §§2.9–2.10, Propositions 2.3–2.4 and their proofs, pp.9–10. Keep NT16 Proposition 3.7(3) for the adjoints. State that the freeness and the reduction isomorphism follow from the coefficient sequence, as the proof route already says.

**Test.** MS19's adjoint formula is the README's `ι`.
- For `(T,S)=(1,2)` over `𝔽₇`, `(S⁻¹T,S⁻¹)=(4,4)`, as in the Check at README:3428.
- This is the m versus m* distinction the theorem keeps.

## R04 (P3) — Garbled notation: `×` written as the word "times", and comma subscripts

**Location.**
- README:2534: “`B̌ times \ [M_n times B̌(A_f^v) times/U]`”.
- README:2119: “B̌ times in `I(ℚ)`”.
- README:2198: `H_n=(B_p/O_B, p×X)/U_p(n)`.
- README:2799 and 2805: `C_U=D×\D_f×/(U A_F, f×)` and `D× (U A_F, f×)`.
- README:3641, 3669 and 3675: `T_w=π₂,*π₁*`.

**Claim.**
- These are not mathematics. The word "times" stands for the unit-group sign.
- In `O_B, p`, `A_F, f`, `O_E, p` and `π₂,*` the subscript reads as a list. For example, `O_B, p×X` cannot be parsed as `O_{B,p}^×` times X.
- The same carriers are written correctly elsewhere, for example `O_{B,v}` at README:2660 and `A_{F,f}×` at README:2795.

**Witness.** README:2534 next to README:2554, which writes the same quotient correctly as `B×\ [M_n×B(A_f^𝔭)×/U]`.

**Repair.** Write the following:
- `B̌×\[M_n×B̌(𝔸_f^v)×/U]` at 2534, and `B̌×` at 2119;
- `O_{B,p}`, `O_{B′,p}`, `O_{E,p}` and `O_{B,v}×` at 1965, 2004, 2161, 2178, 2198, 2206, 2302, 2304 and 2326;
- `𝔸_{F,f}×` at 2302, 2799, 2805, 2814, 2959 and 2969, with `DoubleCoset.Quotient (D×) (U·𝔸_{F,f}×)` at 2805;
- `π_{2,*}π₁*` and `δ†=(π_{1,*},π_{2,*})` at 3641, 3669 and 3675.

**Test.** With the corrections, README:2534 and README:2554 express the same quotient in matching notation.

## Previous findings

- **R01 — partly repaired.**
  - QuaternionArithmetic (#1722) moved from 5b4cda93 to 4a6edeb8 during this review.
    - Its §1.11 (README:854–856) now consumes “Hilbert modular varieties §R18.5.16a item 1” for the unique pair at path length e, and proves only the converse, the path and the superorders.
    - Its §7.1 (README:1730–1733) consumes §R18.5.16c items 1–2 and states `T(𝔭_v)=B(v)ᵗ`. Its §§7.2–7.3 *Needs:* lines (README:1758, 1778) cite §R18.5.16c.
    - Its Dependencies line (README:1890) lists §R18.5.16c and R18.5.17a.
    - The broader `T(𝔫)` for every order and ideal is a stated generalization, so this half is repaired.
  - ArithmeticFuchsianGroups (#2026) is unchanged at 5fdb26da. This is R01 above.

## Verified sound

### Gate, build, form

- **Gate.** I reran the full gate on 7c9252d. Every rule is 0, it prints `OK`, and it exits 0. The worker's gate.md also has `build=0`.
- **Dependency check.** Output, exactly: `depcheck: 238 roadmaps, 2345 edges, 0 problem(s)`, exit 0. There is no UPWARD, CYCLE or moved line. This roadmap is at merge-order line 160.
- **Elaboration.** `lake env lean` on `Suggested.lean` (absolute path, run from the worktree root) exits 0 with no output at all.
  - The file has `module`, `public import Mathlib`, one module docstring and an empty namespace `TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves`.
  - It has no `set_option`, no declaration and no sorry.
  - `module` with `public import Mathlib` is also the form of ModularCurves/Suggested.lean on main.
- **`#check @` comparison and one-tactic padding probe.** Both are vacuous: the file declares nothing, so there is no padding and no section-variable loss.
- **Folder and scope.** The folder holds README.md, Suggested.lean and metadata.toml (`topic = "math.NT"`).
  - Nothing outside the folder changed.
  - There are no process words, LaTeX delimiters or pull-request numbers in the README.

### Pinned declarations

- **Names elaborated.** All 102 Mathlib and Tau Ceti names that the README attributes to the pins elaborate with `#check @`, with no error, in one scratch file. It imports Mathlib and 24 Tau Ceti modules at 2fd255d; I first built five missing oleans with `lake build <module>`, which unpacked them from cache. The names include:
  - every `TauCeti.ClassFieldTheory.*` name;
  - `TauCeti.SU2.*`;
  - `HeckeRing.GL2.deg_heckeT`;
  - `NumberField.card_elementaryTwoQuotient_units`, `units_sq_index_eq` and `unitsMulEquivTorsionProdMultiplicative`;
  - `TauCeti.LocalCoefficientSystem.{pullback, monodromyRepresentation, constantFunctor, twistedCochainComplex, twistedCohomology, twistedCochainComplexCoefficientMap}`;
  - `TauCeti.GL2Borel.{mem_iff, diag}`;
  - the `DoubleCoset` refinement and fibre lemmas;
  - `Submodule.leftOrder_isOrder` and `Subalgebra.leftOrder_toSubmodule`;
  - `groupCohomology.exists_div_of_norm_eq_one` and `groupCohomology.H1ofAutOnUnitsUnique`;
  - `HeckeCoset`, `IsHeckeTriple` and `MvPolynomial.eval₂Hom`;
  - `NumberField.Units.instZLattice_unitLattice` and `NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`.
- **Contravariance claim of §R18.4.12.** TauCeti/AlgebraicTopology/Cohomology/Twisted/Basic.lean at the pin builds the twisted cochains as `Hom` from twisted chains (line 80, `linearYonedaObj`). Its docstring calls this cohomology with coefficients in the dual. So the README is right that the pinned complex must be applied to `L_(W∨)`.
- **Hecke carriers.** Mathlib/NumberTheory/HeckeRing/Defs.lean has only `IsHeckeTriple`, `HeckeCoset`, `HeckeCosetModule` and `HeckeRing`. It has no action on functions on adelic double cosets.
- **Absent objects.** The pins have no Eichler orders, Brandt matrices, Drinfeld half-plane, Hilbert moduli or Shimura-curve cohomology.
  - The only "Brandt" in Mathlib is a graph-theory author.
  - The only "Eichler" occurrences are Eichler integrals and transvections.
- **Miracle flatness (§R18.4.30).** Tau Ceti has the ring case at TauCeti/RingTheory/RegularLocalRing/MiracleFlatness.lean (`TauCeti.Algebra.flat_of_isCohenMacaulay`). It also has the module criteria `Module.IsCohenMacaulay.isRegular_iff_supportDim_add_length_eq_supportDim` and `Module.Flat.of_flat_quotSMulTop_of_isLocalHom`. It does not state the module form.
  - That module form is a target of DeformationAndDerivedPatchingAlgebra §3.3, which the README cites.
  - So §R18.4.30 owns only the support-dimension specialization and the two nodal transfers. There is no duplication.

### Headlines and statability

- **Headlines.** The headline theorems are:
  - §R18.5.15, Čerednik–Drinfeld;
  - §§R18.4.32–R18.4.33, the curve Ihara lemma and saturation;
  - §R18.3.8, the definite Ihara lemma;
  - §§H6.2–H6.8, torsion twists with local points;
  - and the deep inputs §§R18.5.7, R18.5.11, R18.5.12c, R18.4.29, R18.4.30 and H6.5.
  The module docstring lists exactly these, with the missing carrier for each group.
- **The definite Ihara lemma.** It is the closest to statable. It would need four things that are not at the pins:
  - a topology on `(D⊗_F 𝔸_{F,f})×`;
  - Hecke operators acting on functions on `D×\D_f×/H`, where Mathlib has only the types;
  - local splittings to define `T_v`, `S_v` and `H₀(w)`;
  - the KW Eisenstein ideal.
  That is a long ad hoc encoding, which the rules exclude. The docstring's account is correct.
- **§R18.4.30.** It is stated on the patched local-type rings, which are not at the pins.

### Seeded sample (15 targets)

The brief's sample gave only labels, so I drew them deterministically, seeded with the head SHA, from the README's **Theorem/Definition/Construction/Comparison** paragraphs in the brief's order.

| # | Target | Source and locator checked | Result |
| --- | --- | --- | --- |
| 1 | §H6.3 Theorem | DP94 §2.4, p.65 (lines 236–240): Stein factorization `T` finite étale over `ℤ[1/n]`, geometric fibres irreducible | Supported. Tay02 §1, p.13 is under Not verifiable |
| 2 | §R18.1.5 Definition | YZ18 §3.1, pp.550–551 (lines 768–787): `G″=B××_{F×}E×` with `a∘(b,e)=(ba⁻¹,ae)`, `ν=(q(b)eē,e/ē)`, `G′` by `ν₁∈ℚ×`, `h_E=(1,z⁻¹,…,z⁻¹)` with the first component at τ | Supported exactly |
| 3 | §R18.5.4 Definition | BZ22 (5.18)–(5.20), pp.38–39 (lines 2026–2051); BC91 Def. (8.1), p.107 (line 3773); special modules (2.1), p.73 | **R02** (page range of §2) |
| 4 | §R18.3.27 Theorem | KW09 Proposition 7.6, pp.66–67 (lines 3094–3124): `T_v`, `U_v` scaled by `χ(π_v)`, `(f|⟨h⟩)_χ=χ⁻¹(h)f_χ|⟨h⟩`, maximal ideal preserved | Supported |
| 5 | §R18.3.25 Theorem | KW09 §7.4, p.63 (lines 2908–2925, `Δ_v=Δ′_v/Δ′_v[N]`); §7.5, p.66 (lines 3071–3086: `det u_v` a square in `k_v×`) | Supported |
| 6 | §H1.4 Construction | BHW23 Notation 5.1, p.1740 (lines 1243–1257) and Def. 5.3, p.1741 (line 1282); PEL type stated at line 1263 | Supported |
| 7 | §R18.5.10 Theorem | BC91 III §5.3.1, pp.141–142 (lines 5131–5157): Γ_i act very freely, every vertex moved distance > 2 for small `U^p`; BZ22 proof of Prop. 6.6, pp.47–48 | Supported. The README's own proof route is sound: a finite displacement set S by discreteness, then a normal `U^v_1` avoiding S∖{1} |
| 8 | §R18.4.12 Comparison | Car86a §§2.1–2.2, pp.417–420 (lines 379–447); Mil Thm 21.1 and Rem. 21.2, p.130 (lines 5007–5011); pinned twisted complex (above) | Supported. "pp.129–131" contains p.130 |
| 9 | §H2.4 Theorem | DP94 Prop. 2.7, p.65 (line 256); Thm 2.2, p.64 (line 226): flat lci over `ℤ[1/n]`, so p-torsion-free coordinate rings | Supported |
| 10 | §H1.2 Definition | DP94 §§1.1–1.5, 2.1, pp.60–64 (lines 97–216): symmetric `A→A∨` sheaf, positivity via ampleness (1.4), L-polarization (2.1.3) | Supported |
| 11 | §R18.4.32 Theorem | MS19 Thm 6.5 with conditions (1)–(2), Remarks 6.6–6.7, p.34 (lines 1700–1717); proof p.38 (lines 1931–1958) | Supported, including the `√5∉F` remark |
| 12 | §H2.2b Theorem | BHW23 §5.1.2, p.1744 (lines 1391–1401: representing scheme over `ℤ[1/N]`); DP94 §2.1, p.64 (proper morphism to polarized moduli) | Supported |
| 13 | §R18.3.17 Construction | KW09 §7 opening, p.58 (`[U_v:(O_D)_v×F_v×]=2`, lines 2668–2670); Lemma 7.2 and Remark, pp.60–61 (lines 2794–2831) | Supported. PRR23 is under Not verifiable |
| 14 | §R18.5.16 Comparison | BC91 III Thm (5.2), p.140, comments pp.140–142 (lines 5091–5157) | Supported |
| 15 | §R18.4.3 Theorem | NT16 Prop. 3.7(3), pp.31–32 (lines 1412–1424); CDN20 §5.2.1, p.41 | **R03** (CDN20 locator) |

### Adversarial pass

Each row gives the values computed on each side.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| §H0.0 sign transport | F=ℚ, `C=diag(1,−1)` | `h(i)=[[0,1],[−1,0]]`: `h(i)e₁=−e₂`, `ψ₀(e₁,−e₂)=−1`, so `−ψ₀(e₁,h(i)e₁)=1>0`; for e₂, `−ψ₀(e₂,e₁)=1` | Correct |
| §H0.1 dimensions and centre | g=1, 2 | `4g`, `3g+1`: 4,4; 8,7; derived `3g=6`; centre point `(1,−1)` squares agree and lies off the diagonal | Correct |
| §§H0.3, H0.5 lattice and stabilizer | dual of `O⊕c⁻¹𝔡⁻¹` | dual of `c⁻¹𝔡⁻¹` is `c` and dual of O is `𝔡⁻¹`, so `c⊕𝔡⁻¹=cL_c`. The row action forces entries `Ô,(c𝔡)⁻¹;c𝔡,Ô`. `diag(2,1)` has non-unit determinant | Correct |
| §H0.4 `ℚ(√2)` different | `x²−2` | `f′(√2)=2√2`, so `𝔡=(2√2)` | Correct |
| §H1.6 Check `e₂→e₁` | `J=[[0,1],[−1,0]]` | `J[[a,b],[0,1]]J⁻¹=[[1,0],[−b,a]]`, which fixes `e₁` in row convention | Correct |
| §H2.1 Check `k[T]/T²` | `W=⟨Te₁,Te₂⟩` | dim 2; `W^⊥=W`; T kills W, so not free | Correct |
| §H2.5a transport | F=ℚ, c=ℤ, b=2ℤ | `cb⁻²=(1/4)ℤ`; `b⊗cb⁻²=(1/2)ℤ=b⁻¹c`; `cb²` gives 8ℤ | Correct |
| §H2.8 Check at ε=1 | lifts 0, p | `|0|≥|p|` fails, giving the empty domain; `|p|≥|p|` gives the whole domain | Correct |
| §H3.2 `ℚ(√2)`, M=12 | `ε=1+√2` | `ε⁴=17+12√2≡5`, `−ε⁴≡7 (12)`; `ε⁸=577+408√2≡1 (12)` | Correct |
| §H3.3 CM fixed point | `ℚ(√3)`, N=7, `S=[[1,1+i],[1−i,−1]]` | `S†=S`, `S²=3I`; `f†f=97+56S=ι(η)`; `f≡4iS`, `f²≡−48≡1 (7)`, trace 0; on +1 line `S=−2i`; `η≡−1 (7)`, `η∉S₇`, `η²∈S₇` | Correct |
| §H3 Examples | `ℚ(√3)`, `ℚ(√2)` | `N(2+√3)=1`, so `Δ(1)` has order 2; `N(1+√2)=−1`, so `Δ(1)=1` | Correct |
| §H4.4 adjugate | `uI₂`; u,v unipotent | `adj(uI)=uI`; `det γ·γ` gives `u³`; `uv=[[2,1],[1,1]]≠vu=[[1,1],[1,2]]` | Correct |
| §H4.8 Check | `E[p]⊂E[p²]` | rank `p²=p^{ng}`; `e_{p²}(x,y)=e_p(x,py)=1` on `E[p]` | Correct |
| §H4.19 counterexamples | `ℚ(√2)`, p=3, N=4; p=2, N=5 | `η=17+12√2`: `≡1 (4)`, `≡−1 (3)`, `±η∉U₁₂`; ε has order 12 mod 5, `−ε⁶≡1`, `U_{2ⁿ·5}=⟨ε^{3·2ⁿ}⟩`; `Δ_n(5)≅ℤ/6`, ×2, limit ℤ/3; bound `12·4≥6` | Correct |
| §H5.2 cusps | e=5 with ±1; e=3, L=ℚ(ζ₃) | `ℚ(ζ₅)^{±1}=ℚ(√5)`; `L⊗L=L×L` | Correct |
| §H5.5 nonprincipal c | `ℚ(√10)`, `(2,√10)` | `a²≡±2 (5)` impossible; disc 40, so 5 ramifies | Correct |
| §H6.4 Check | `+I₂` | `det=1`, cannot reverse a pairing that needs `det=−1` | Correct |
| §H6.5 worked Check (headline input) | `x³−3x+1`, l=7, p=19 | disc `−4(−27)−27=81`; no root mod 7; roots 3, 7, 9 mod 19; `q_v=343≡1 (19)`; `π₇³=−10−9√−3`; `√−3≡±4 (19)` gives 11, 7; `ε̄₇(Frob)=19≡5` | Correct |
| §H6.5 (C2)–(C3) | Hilbert class fields | `H(ℚ(π_l))⊂H(N₀)` since `H(K)L/L` is unramified abelian; `1−4l≡1 (l)`, so unramified at l | Correct |
| §R18.1.1a Check | disc 6, level `1+7M₂(ℤ₇)` | `2⁻¹≡4 (7)`, so `c₂=4`, `c₂⁻¹=2`, `c₂²≡2`, `2·2=4`; ord(4)=ord(2)=3 | Correct |
| §R18.1.5 Check | `(a⁻¹,a)` | `ν₁=a⁻²·a²=1`, `ν₂=a/ā=1` | Correct |
| §R18.1.6 Check | `ℚ(√5)`, `E=F(i)` | `Φ₁+Φ₂=2Ψ+τ₁+τ₂`: weights (1,1) at τ, (2,0) elsewhere | Correct |
| §R18.1.9 Check | (2,2) | class of `(1,4)` in G″, not 1 | Correct |
| §R18.2.3 Check | `B_v=M₂(ℚ_p)` | `#M₂(ℤ/p)=p⁴`, `e₁₁` part `p²`; `H[O_F]=0` | Correct |
| §R18.2.12 Check | z=1+i | `‖dz‖=2·Im z=2`; `2|z|=2√2` | Correct |
| §R18.2.17 Check | `t³−t²−3t+1`, p=37 | f(30)=26011=37·703, f(4)=37; f′(4)=37≡0, f′(30)≡10; disc 148=4·37 | Correct |
| §R18.3.2 Check | `Sym²(ℤ₂²)` | Gram `[[0,0,2],[0,−1,0],[2,0,0]]`, det 4; rank `(k−1)^d=9` for d=2, k=4 | Correct |
| §R18.3.3 Check | sign `C₂` | `ℤ₂` invariants 0; mod 2 invariants `𝔽₂` | Correct |
| §R18.3.7 Check | `ℚ(√3)` | `x²−3y²=−1` impossible mod 3; `h=1`, `h⁺=2`, Minkowski `√12/2<2` | Correct |
| §R18.3.8 (headline) | MS19 p.35 step, `k=(1 1;0 1)` | `ω⁻¹kω=(1 ϖ⁻¹;0 1)∉H`; `ωkω⁻¹=(a,bϖ;c/ϖ,d)∈H` for `k∈H₀(w)`; MS-non-Eisenstein implies KW-non-Eisenstein by Chebotarev | Correct; the README's correction of MS19 holds |
| §R18.3.10 Check | `ℚ(√17)`, `(−1,−1)` | `(i+j)²=−2`, `Nrd=2`; 2 splits (17≡1 (8)); 4 ramified places | Correct |
| §§R18.3.12, R18.3.25 Checks | `Δ′=C₈`, N=2 | `C₈/C₈[2]=C₄`, `C₈/C₈²=C₂`; kernel {0,4} lies in {0,2,4,6}; `ad=(a/d)d²` | Correct |
| §R18.3.15 Check | `𝔽₇`, q=3, det 6 | `S=3⁻¹·6=2` | Correct |
| §R18.3.17 (sample) | ψ(NrdΠ)=4; r=2 | `r²=ψ(π)⁻¹`, so r=1/2 passes and r=1 fails; `r^{±2}=4, 1/4`; right-translation eigenvalue `r⁻¹` | Correct |
| §R18.3.32 | r=±1/3, ψ=9 over ℤ₂ | `γ(Frob)=r⁻¹=±3`, `γ²=9=ψ`; the inverse would give 1/9 | Correct |
| §R18.4.3 (sample) | `(T,S)=(1,2)` over `𝔽₇` | `ι=(S⁻¹T,S⁻¹)=(4,4)≠(1,2)`; the coefficient sequence gives `H¹[λ]=0` and `H²=λH²`, so 0 | Correct statement; R03 is the locator |
| §R18.4.7 Check | `C_K=1`, `𝔽₇`, q=3 | `T=q+1=4`, `S=1`; roots `χ(c)`, `qχ(c)`, with sum `(1+q)χ` and product `qχ²` | Correct |
| §R18.4.12 (sample) | ℤ₂ circle, monodromy −1; interval | differential `u⁻¹−1=−2`: `H⁰=0`, `H¹=𝔽₂`; over ℂ both 0; relative: `R→R²` diagonal, `H¹=R` | Correct |
| §§R18.4.14–R18.4.15 | q=2, T=3, S=2 and S=1 | `G(0,1)=(3/2,3)`; `Δ=9−9=0`, `G(1,−1)=0`; `GJ=Δ`, computed entrywise; `δ†δ` entries `(q+1, π_{1,*}π₂*=S⁻¹T)` | Correct |
| §R18.4.18 | `σ=σ₀^{1−l}` | `J^{1−l}=J`; `a^{1−l}=1` by Fermat | Correct |
| §R18.4.19 Check | `F_v=ℚ_l` | `d²+[F_v:ℚ_l]=5` framed generic fibre; θ fixed gives 4, Krull 5 | Correct |
| §R18.4.30 | k[[t]] examples | `2=1+1`, flat; `M=k` has depth 0 < 1, not MCM | Correct |
| §§R18.4.32–R18.4.33 (headlines) | `x↦(x,0)` | cokernel O; reduction `O/λⁿ` is free with λ-torsion | Correct |
| §R18.4.34 Check | g=2, w=4 | `q₀=3·2=6`, `a=2`, degree 7; `H¹(F(k))` weight `7−4=3=w−1` | Correct |
| §R18.5.2 Check | ℚ₂, n=1, z=2 | ball `v(z−2)>1` about 2∈ℙ¹(ℤ/4) removes it; CDN's balls `v(z−x)>1` about 0, 1, ∞ keep it | Correct; CDN20 misprint below |
| §R18.5.4 Checks | `[K:ℚ_p]=2`; `[π]` | group height 8; `[π]` relative height 4, absolute `4f`, versus group `4ef` | Correct |
| §R18.5.8 Checks | Λ | `(1,0)∉Λ`; `(1,−1)↦1`; `(−1,−1)↦0` | Correct; matches BZ22 line 2488 |
| §R18.5.9 Checks | ℤ with shifts | +3 has displacement 3 > 2; +2 has displacement 2, fails | Correct |
| §R18.5.11 Check | q=2 | dualizing degree `−2+(q+1)=1` | Correct |
| §R18.5.12b Check | `3+2√2` | conjugates positive, norm `9−8=1` | Correct |
| §R18.5.15 (headline) | disc 6, v=2; BZ22 Thm 6.7 | invariants 1/2 and 0; BZ descent `id×|Π⁻¹×τ_c` (line 2570), corrected to right s by §R18.1.1a | Correct |
| §R18.5.16a Checks | `ℤ_p+pM₂`; `O₀(4)` over `ℤ_(2)`; Hurwitz level 3; `ℙ¹(ℤ/4)` | index `p³`; c∈{0,1,2}, the {1,2} pair meets in level `2+(−1)=1`; 24/4=6, w=12, 3, mass ratio 4; 6 points, 12 unimodular rows, `2·6=4·3`, `4·12=16·3` | Correct |
| §R18.5.16a conjugation Check | `n=(0 1;ϖ^e 0)` | `n(a b;c d)n⁻¹=(d,cϖ^{−e};ϖ^e b,a)` | Correct |
| §R18.5.16b Checks | `S₃`; `M₂(ℚ)` level ℓ | `⟨t⟩\S₃/⟨t⟩` has 2 elements; with `A₃`, 1 and 2; `GL₂(ℤ)` transitive on ℓ+1 cosets | Correct |
| §R18.5.16c Checks | D=23; `ℚ(√10)` | rows sum to 3; `B·diag(2,1,3)` symmetric; `1/2+1+1/3=11/6=22/12`; `ζ_F(−1)=70/60=7/6`, mass 7/6 for weights (12,2,3,4); `w_jB_ij=w_iB_ji` holds entrywise | Correct |
| §R18.5.17a incidence | dart `x→y` | `a_*U=q[y]`; `b_*U=T[y]−[x]` | Correct |
| §R18.5.18 Check | Tate, `v(q)=ℓ` | `Φ=ℤ/ℓ`, monodromy ℓ | Correct |
| §§R18.4.24, R18.4.26 Checks | disc 6 and q=5; pq and q | finite discriminant 30 with 4 places; p with 2 places | Correct |

### Ownership and duplication, by object

- **QuaternionicModularForms (#934, e40ec426).** Its §0.3 also states the group-theoretic refinement fibres. It is on this job's excluded-supplier list, so owning them here (§R18.5.16b, on the pinned Tau Ceti fibre lemmas) is the only admissible side. This is not a finding.
- **HilbertModularForms (#1724, 73285f0f).**
  - Its §10.3 defines nothing new: it reads Brandt matrices from QuaternionicModularForms §3.1 (README:2312).
  - It cites this roadmap twice (README:155, 1513), for polarization classes.
- **Other neighbours.**
  - HilbertModularSurfaces (#1730) cites §§H0.3, H1.1, H1.10 and H5.2 (README:328).
  - HilbertModularVarietiesAndShimuraCurvesPartII (#1745) consumes R18.1 and R18.3 (README:60).
  - AutomorphyLiftingBeyondTaylorWiles (#1824) has "Ihara avoidance", which is a different object.
- **Excluded suppliers.** No excluded supplier is cited.
- **Fully qualified names.** Suggested.lean declares no fully qualified name, so it cannot collide with another roadmap's.

### Citations and supplier order

- **Leads from the resolve tool.** All six resolve:
  - `LocallySymmetric.SheafDerived.isoSingular` and `LocallySymmetric.FrankeInput` are at ArithmeticLocallySymmetricSpaces (#871), README:832 and 528.
  - `CanonicalModel.minimal_defined_over_reflex` is at ShimuraVarieties (#933), README:2782.
  - `OrderIdeles.completion` and `OrderIdeles.unit_change` are at ClassicalArithmeticCompletion on main, README:16154–16155.
  - The other two are module names present at the pin.
- **Section ids checked this round.** AdelicAlgebraicGroups §4.1 has the simply-connected Hasse kernel, as used by §R18.5.12b. Also checked: §§4.2–4.6 and 5.3; PELModuli M0.9, M0.12, M3.2 and M5.4.
- **AlgebraicTopology Layer 6.** It exists only at #1652 (README:1731). The README anchor matches its heading, and the description's merge-order paragraph names #1652.
- **Overlaps.** overlaps.md reports no other pull request changing this roadmap and no dropped id.

## Not verifiable

- **Tay02.** The cached file is an image-only scan, and OCR is not installed on this worker. This affects §§H6.1–H6.5 (§1, pp.6–13), including the sampled §H6.3's second locator.
- **PRR23 §1.4.2, pp.31–33 (sample §R18.3.17).** It is the Cambridge edition, behind a paywall. The statement was checked mathematically instead (table above).
- **Voi21 printed pages.** The published PDF host is refused as paywalled by the sources service. Theorem numbers were verified at r12; the printed pages in §§R18.5.16a and R18.5.16c are unchecked.

## Source issues

- **Misprint** in MS19 at proof of Theorem 6.8, p.35: the kernel relation is written with `g(xω)`. With the paper's own `π₂=ρ_{ω⁻¹}` (§2.11), it should be `g(xω⁻¹)`; otherwise the function is not `H₀(p)`-invariant. Affects the proof.
- **Misprint** in CDN20 at §1.2, p.12: `U_n` removes balls of valuation radius `n·v_p(ϖ)` about lifts of `ℙ¹(O_F/ϖⁿ)`, which keeps K-points such as 2∈ℚ₂ at n=1. The centres should be lifts of `ℙ¹(O_F/ϖ^{n+1})`. Affects a stated result.
- **Gap** in KW09 at Lemma 7.2, proof of (i), p.61: it infers that `γ_v` is independent of f from the residual representation. When `q_v≡−1 mod p` and `ρ̄` is unramified at v, both square roots of `ψ_v` give the same residual representation; the lemma needs `1+q_v≠0` in k or `ρ̄` ramified at v. Affects a stated result.
