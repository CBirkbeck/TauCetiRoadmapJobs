# Review of MetaplecticAutomorphicForms (pull request #1063 at 22bee85)

**Verdict:** accepted

No P1 or P2 finding. The push gate passes at this head (every scanner 0, depcheck 0, targeted build OK); the dependency check run for this review reports `depcheck: 205 roadmaps, 1432 edges, 0 problem(s)` with no UPWARD or CYCLE line; `lake env lean` on `TauCetiRoadmap/MetaplecticAutomorphicForms/Suggested.lean` reports exactly four `declaration uses sorry` warnings and nothing else. The six findings below are P3 notes (locators, supplier attribution, Needs-line hygiene, Lean form); the author may take or leave them.

## R01 (P3) — 0.14 cites Kudla96 I.2 for a statement it does not contain

Location: `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` line 265, "(Kudla96, I.2 pp.6–10)" for the product Haar measure on `H(W)` being left and right invariant and symplectically invariant.

Claim: Kudla96 I.2 pp.6–10 supports the Haar-measure statement of 0.14.

Witness: Kudla96 lines 161–374 (pages 6–10) mention Haar measure only as `dµ_g(y)` on `ker(c)\Y` (Proposition 2.3, Lemma 2.4) and `dx` on `X` (line 339). No sentence states that the product of Haar measures on `F` and `W` is a bi-invariant Haar measure on `H(W)`, nor its invariance under `Sp(W)`.

Repair: cite a text that proves it (the unimodularity of `H(W)` and the product formula follow from the group law and are in Weil64 I §4 conventions, or any textbook treatment of Haar measure on nilpotent groups), and keep Kudla96 I.2 only for the `X`/`Y` measure conventions it fixes.

## R02 (P3) — 6.19 cites BFH90 (2.2)–(2.3) for the Fourier–Jacobi extraction

Location: `README.md` line 1792, "(BFH90, §2 equations (2.2)–(2.3), printed 551–552, PDF 10–11)".

Claim: these equations define the extraction of a Fourier–Jacobi coefficient of a smooth automorphic form by integration over the Heisenberg centre against `ψ_m⁻¹`.

Witness: BFH90 lines 421–433: (2.2) is the Fourier expansion of a function `Φ_j` that is a Jacobi form from the outset (its §1, (1.6)–(1.9)), and (2.3) extracts the coefficients `B_j(g;T,R)` by integrating over the Siegel-unipotent box and the elliptic torus. No integral over the Heisenberg centre, and no passage from a form on the larger group to a Jacobi form, appears.

Repair: cite the standard source of the Fourier–Jacobi coefficient (Eichler–Zagier, *The theory of Jacobi forms*, §6, or Piatetski-Shapiro's Fourier–Jacobi expansion) for the first two sentences, and keep (2.2)–(2.3) for the last sentence (elliptic-variable Fourier extraction), which they do support.

## R03 (P3) — Weil64 and GZ86 "PDF" page numbers do not match the linked copies

Location: `README.md` lines 178, 311, 362, 408, 482, 542, 1154, 1316, 3469 (the References note "Page numbers refer to the linked version").

Claim: for Weil64, printed 193–194 is PDF 51–52, printed 148 is PDF 6, printed 157 is PDF 15, printed 161–162 is PDF 19–20, printed 186–187 is PDF 44–45; for GZ86, printed 270 is PDF 47.

Witness: in the linked copy (Weil64, `webhomes.maths.ed.ac.uk/~v1ranick/papers/weil2.pdf`), PDF 51–52 carry printed 183–184 (lines 1358, 1394, §§33–34), and §41 with Lemmes 4–5 and Théorème 6 is at PDF 66–67 (lines 1706–1756, printed 193–194); PDF 6 carries printed 147 (line 172), PDF 16 printed 155 (line 416), PDF 44 printed 177 (line 1152). The printed numbers are right in every locator I checked; the PDF numbers are off by between one and fifteen pages. The linked GZ86 copy (wstein.org) is an image-only scan whose cached text is empty (lines 3–4 of its header); the same paper from Zagier's MPIM page (DOI 10.1007/BF01388809) has text, with IV §1 (1.1) at its page 55 (line 1800) and Lemma (2.3) at pages 60–61 (lines 1947–1998).

Repair: recompute the PDF numbers against the linked copy or drop them and keep the printed pages (which are correct), and link the MPIM text copy of GZ86.

## R04 (P3) — 8.85 attributes BFH's Proposition 7.1 identification to AutomorphicLFunctionsAndLocalFactors AL.3

Location: `README.md` line 3421, "AL.3 identifies `L(s,D₀)=L_N(s+k/2−2,f⊗χ_{D₀})/L_N(2s+k−4,Sym²f)` ... and `L(s,0)=...`".

Claim: the supplier AL.3 states these identifications.

Witness: AL.3 (AutomorphicLFunctionsAndLocalFactors at its open head, `roadmaps show`, lines 1865–2313) states Rankin–Selberg factors and function-field factors; the only symmetric-square mention in that roadmap is AL.4.2.3 (line 2722), which imports symmetric-square transfers from their owners. The identification is BFH90 Proposition 7.1, printed 588 (lines 2042–2053), which this roadmap's 8.73–8.74 prove; the symmetric-square L-function is the adjoint lift of GL2AutomorphicRepresentationsAndTransfer R17.4.13 (line 2083: `Ad(π)=Sym²π⊗ω_π⁻¹`), already in 8.85's `*Needs:*`.

Repair: write "8.73–8.74 identify ..., with the Rankin–Selberg factors from AL.3 and the symmetric-square L-function from GL2AutomorphicRepresentationsAndTransfer R17.4.13"; the `*Needs:*` line is already right.

## R05 (P3) — Needs lines carry duplicates and a blanket prerequisite that blocks classical targets behind Layer 5

Location: `README.md` lines 265, 311, 408 (AL.0 listed twice in one line); lines 1894, 1916, 1928, 1944, 1985, 2025, 2041, 2091, 2159, 2279, 2291, 2343, 2359 and most other Layer 7 targets (`5.5` as a prerequisite).

Claim: each `*Needs:*` line lists what the statement and its route need, item by item.

Witness: 7.5 defines `b(d,s)=(4π)^{−1/4}|d|^{−3/4}Λ(s,χ_d)` from the completed Dirichlet L-function and lists `*Needs:* 5.5` (the adelic metaplectic Whittaker coefficient of 5.5); 7.7 (a product of two such numbers), 7.13, 7.16, 7.21 and 7.28a likewise. None of these statements or routes uses an adelic constant term. 0.14 lists "AutomorphicLFunctionsAndLocalFactors AL.0 (self-dual Haar measure, local Fourier inversion); AutomorphicLFunctionsAndLocalFactors AL.0 (self-dual Haar measures)".

Repair: delete `5.5` from the Layer 7 targets whose statement is classical (keep it where the adelic comparison 7.49 or the companion 7.29a is actually used), and merge the duplicated AL.0 items into one clause each.

## R06 (P3) — Lean and README form

Location: `Suggested.lean` lines 5–50 and 77, 187; `README.md` line 11.

Claim: the module docstring is titled "<title>: target signatures" and the file carries `/-! ## Layer k: <title> -/` comments in README order when it states targets of several layers; roadmap folders are cited by name and section.

Witness: the docstring title (line 6) is the roadmap title without ": target signatures"; the file states targets of Layers 1 and 8 under `namespace StoneVonNeumann` and `namespace GenusTwo` with no layer section comments; README line 11 cites the folder RepresentationTheory/ClassicalGroups as the backticked Lean-looking path `TauCetiRoadmap.RepresentationTheory.ClassicalGroups` (the resolve tool flags it; the folder exists on main at `content/TauCetiRoadmap/RepresentationTheory/ClassicalGroups/README.md`, Layer 0 at its line 175).

Repair: retitle the docstring, add `/-! ## Layer 1: Stone–von Neumann and the oscillator normalizer -/` and `/-! ## Layer 8: Genus-two Jacobi and Eisenstein analysis -/`, and write "RepresentationTheory/ClassicalGroups Layer 0" in prose.

## Verified sound

**Principles.** No route-specific shortcut (dyadic places and positive characteristic are kept wherever the sources allow; where a source restricts, the target restricts and says so, e.g. 3.9, 3.11, 3.20, 3.16). No re-planned roadmap: every object another roadmap builds is imported (rank-one circle cover from GL2AutomorphicRepresentationsAndTransfer R17.4.13a; theta multiplier and half-integral Kloosterman sums from GeometryOfNumbersAndQuadraticArithmetic §4.3; `GSp₄⁺(ℝ)` from AutomorphicFormsOnReductiveGroups §6.4; Bessel, Whittaker, Laplacian, resolvent and Eisenstein theory from AutomorphicSpectralTheory). No upward or cyclic supply (below). No copied passages (locators and own wording throughout). No algorithm. `Suggested.lean`: single `import Mathlib` plus two `TauCeti.*` modules that exist and are built at the pin; no `set_option`, no sorried data (the three `def`s and one `abbrev` have real bodies), no `lemma`, no `#eval`.

**Ownership against open work.** MaassForms (#1717, line 174), SiegelModularForms (#1714, lines 48–54), SymplecticReidemeisterTorsionModSquares (#1645, line 133) and ExceptionalThetaCorrespondencesForG2 (#1736, lines 13, 99–101) each defer the half-weight Maass carriers, the degree-two metaplectic and BFH side, the metaplectic cover and the local theta modules to this roadmap by section number. HeisenbergImprimitivity (#1149, line 50) states "No Stone–von Neumann theorem". HalfIntegralWeightModularForms (#1721) owns holomorphic half-integral-weight forms, their Shimura lift and holomorphic plus space, a different carrier from the weight-one-half Maass space of 7.2. ThetaSeries on main (lines 28–33) excludes half-integral weight. No open `Suggested.lean` declares `SiegelSpace` or a genus-two theta (`roadmaps grep --lean-only` finds none). This roadmap is the owner of what it declares.

**Supplier-order audit.** `tauceti-roadmap gate --depcheck ... --movable` on this README: `depcheck: 205 roadmaps, 1432 edges, 0 problem(s)`. ORDER.txt lists MetaplecticAutomorphicForms at line 134 after its suppliers (GeometryOfNumbersAndQuadraticArithmetic 65, AutomorphicLFunctionsAndLocalFactors 77, EndoscopicTransferAndUnitaryTraceComparison 132); the roadmaps it names only as consumers are later (NoncompactQuantumSymmetry 138, ModularityAndLanglandsExtensions 176, QSeriesPartitionsAndMockModularForms 231, GrossZagierAndArithmeticHeights 317). Every cited supplier section resolves at the supplier's current head or on main (line numbers in `roadmaps show` output, or in the main README): AL.0 (294) with AL.0.2/0.3/0.4/0.5 (514, 626, 743, 814) and vector-space Poisson AL.0.4.2 (770), local inversion AL.0.3.3/0.3.5 (667, 699), AL.1 (879), AL.2 (1509), AL.3 (1865) with AL.3.10.1 "Curve additive analysis" (2313); ArithmeticGaloisRepresentations §2.7 (2086) with "Global inputs" (2141, 2169); SmoothRepresentationsOfLocalGroups SR.0.2 (619), SR.2.1–2.3 (1836, 1965, 2125), SR.3a.1 (2257) with node *admissibility-of-irreducibles* and Schur (2338–2342), SR.3.1 (2490), SR.3.3 (2793), SR.4.1–4.4 (3109–3377), SR.5.2 (3758) with the radical/cosocle paragraph (4303), SR.6.3 (4960); AutomorphicSpectralTheory §§0.6–0.7 (192, 209), 0.25 (520), 0.26–0.28 (555, 584, 593) with `eulerIntegral` (562), `decayingNormalization` (564), `whittaker_w_order_symm` (566), 1.1–1.3 (891–935), 1.12–1.13 (1122, 1141), 1.16 (1282), 1.16a (1309), 1.20–1.21 (1373, 1392), 2.1–2.6 (1530–1643), 2.4a (1613), 2.17 (1811), 2.19 (1829), 4.17a (2642); AutomorphicFormsOnReductiveGroups §§0.1 (88), 0.3–0.4 (142, 165), 2.1 (300), 2.4 (397), 2.7 (468), 3.1–3.2 (507, 524), 4.1–4.2 (607, 625), 4.5 (690), 5.4 (793), 6.4 with `positiveSimilitude` (1006, 1012), 6.8 (1090), 7.2–7.3 (1134, 1173); GL2AutomorphicRepresentationsAndTransfer R16.0.1 (401), R17.1.1 (1357), R17.4.13a (1986), R17.4.13 (2081); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.3 (4454, 4473); GeometryOfNumbersAndQuadraticArithmetic §2.9 with `SignedHermitianSpace`, `signedHermitianAdjoint` (777) and `signedHermitianTransfer` (812), §3.4 (1232), §4.3 (1709) with the two named paragraphs (1734, 1742) and `halfIntegralKloosterman` (1750–1753); AdelicAlgebraicGroups §§0.2–0.4 (642, 739, 852), 1.1 (1011), 1.2 (1161), 1.5 (1366), 2.2–2.4 (1658–1886), 3.4–3.5 (3141, 3474), 4.4–4.5 (4633, 4888). On main: IntegralLattices Layer 1 (590), 1G (642), 1H (667), Layer B (981), B2 (1032); FuchsianOrbifolds Layer 6 (344); GlobalQuadraticForms Layers 3, 4, 7, 8 (325, 375, 742, 871) and 4.4 with the archimedean symbol (443, 463); ModularForms Layers 0, 2, 4, 6, 7 (259, 383, 532, 678, 708); QuadraticFormInvariants 6C (1984); RepresentationTheory/ClassicalGroups Layer 0 (175) and RepresentationTheory/CompactGroups Layer 5 (318); Completed/ProfiniteArithmetic 3.4 (672); Completed/OrthogonalL2Bases A2–A3 (174, 188); Completed/OrthogonalSpinGroups Layer 0 (331); Completed/GlobalNumberFields; NoncompactQuantumSymmetry M5.AffineG5 (5890, consumer). The four "citations found nowhere" leads (GanTakeda16, GanIchino16, SunZhu15, BaruchMao10) are source ids, not roadmaps. The `halfIntegralKloosterman` formula at GN line 1753, `Σ_d ε_d^{−(2ℓ+1)}(c/d)e((m d⁻¹+n d)/c)`, agrees with 7.12's description, and for odd `ℓ` the exponent `−(2ℓ+1) ≡ 1 (mod 4)` gives `ε_d`, as 7.12 says.

**Library declarations at the pins.** A scratch `#check` file with the 104 Mathlib and Tau Ceti names of the supplier contracts and of 0.9a, 3.23, 4.2, 3.5, 8.11 elaborated with one unknown identifier, which was my own mis-prefixing: `SymplecticGroup.mem_iff'` is at `Mathlib/LinearAlgebra/SymplecticGroup.lean:185` in `namespace SymplecticGroup`, as the README writes it. Definitions opened: `Representation.IsIrreducible` is `IsSimpleOrder (Subrepresentation ρ)` (`Mathlib/RepresentationTheory/Irreducible.lean:29`), so it excludes `E = 0`; `IsNonarchimedeanLocalField` extends `IsValuativeTopology`, `LocallyCompactSpace`, `ValuativeRel.IsNontrivial` (`Mathlib/NumberTheory/LocalField/Basic.lean:45`), so the field is nondiscrete and locally compact with positive characteristic allowed; `ContRepresentation` bundles only `G →* V →L[R] V` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:54`), which is why 1.2 carries `hcont` explicitly; `Representation.IntertwiningMap` (`Intertwining.lean:36`); `TauCeti.FactorSet.Extension.instTopologicalSpace` is the product topology transported along `equivProd` (`TauCeti/Topology/Algebra/GroupExtension/FactorSet.lean:82`), with `homeomorphProd` (89), `isTopologicalGroup` (160), `continuous_inl` (174), `continuous_rightHom` (179), `isClosedEmbedding_inl` (197, needs `T1Space G`), `isOpenMap_rightHom` (216); `equivProd`, `mul_left`, `mul_right`, `inv_left`, `inv_right`, `inl`, `groupExtension`, `canonicalSection`, `rescaleEquiv`, `rescaleEquiv_apply` at `TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean` 186, 211, 216, 228, 232, 292, 341, 354, 410, 430; `TauCeti.BilinForm.isometryGroup` (`Isometry.lean:153`), `isometryGroupEquivIsometryEquiv` (173); `TauCeti.SymplecticForm.IsLagrangian` (`Lagrangian/Basic.lean:99`, real scalars, as the README says); `TauCeti.HeisenbergGroup` with `equivProd` and `commutatorElement_eq` (`SpecificGroups/Heisenberg.lean` 55, 68, 113). All eight `TauCeti` modules cited have object files at the pin.

**Lean form.** `lake env lean` on the file: four `sorry` warnings only. `#check @name` for the eleven declarations (scratch copy) reproduces the elaborated types of the worker's signatures file; no section binder is lost (the two unitary theorems carry `[CompleteSpace H]`, `[FiniteDimensional ℝ X]`, `[BorelSpace X]`, `[μ.IsAddHaarMeasure]` in their elaborated types; the smooth theorem carries `[IsNonarchimedeanLocalField F]`, `[FiniteDimensional F X]`, `[T2Space X]`, `[ContinuousSMul F X]`). The one-tactic probe (`rfl`, `simp`, `infer_instance`, `intros; simp` in sequence on a scratch copy) fails on all four sorried theorems, so none is padding. `(1 / 2 : ℂ)` in `theta_fourier_transform` is `2⁻¹` (`norm_num`), not natural-number division. The four definitions are exactly those the three headline statements need; `example`s are absent. Imports are `Mathlib` and two existing `TauCeti.*` modules.

**Headline theorems.** The README's end theorems (Summary): Howe duality, conservation and see-saw (Layer 3), Weil product formula and global Weil representation (Layer 4), theta lifts (5), Siegel–Weil, Rallis and nonvanishing (6), Duke–Imamoḡlu–Tóth trace identities and the Shimura bijection (7), the BFH export (8). None is statable at the pins: Mathlib has no Weil index, metaplectic cover, smooth representation category of a p-adic group, adelic Schwartz space, automorphic form on a cover, weight-one-half Maass form or Kohnen plus space, and Tau Ceti adds none of these (grep of both pins for `WeilIndex`, `Metaplectic`, `SchwartzBruhat`, `MaassForm`, `Kohnen` returns nothing). The docstring names each missing carrier (lines 29–49). The three stated results, smooth Stone–von Neumann with scalar commutant (1.1), unitary Stone–von Neumann with its Hilbert multiplicity form (1.2) and the genus-two theta inversion (8.24), are deep statements on native carriers and are the right choice; 8.24 is checked below as a mathematical statement.

**Source sample.** All fifteen seeded targets and the unverified-flagged locators were read at the cited text (cache ids: Kudla96 800ed01b, Weil64 22df47cb, IP23 058fda94, GQT cde6b7ad, DIT16 Annals a67de715, DIT11 Annals 8f2b8ed3, Biro00 d1a49be2, BFH90 d50ad2f1 (OCR), GZ86 MPIM text copy 8afee839, SunZhu15 dbd11f45).

- 0.1: Kudla96 lines 75–85 (I.1, p.3): Heisenberg law `(w₁,t₁)(w₂,t₂)=(w₁+w₂,t₁+t₂+½<w₁,w₂>)`, right action of `Sp(W)`. The README's general bilinear `B` with coefficient-first coordinates specialises to this with `B=ω/2` as the Conventions say. Supported.
- 0.14: not supported at the locator (R01).
- 3.31: IP23 lines 5304–5431 (Lemmas A.18–A.20, PDF 104–106): `s̃(α,α⁻¹,1)=γ_F(J,½ψ)(−2abJ₁,J)_F`, `ŝ₁(ι([α,α⁻¹],1))=(u,J)_F`, `µ=γ_F(J,½ψ)(−2abuJ₁,J)_F`, with `a,b≠0` by continuity (line 5301–5303). Product `(u,J)(−2abuJ₁,J)γ_F(J)=γ_F(J)(−2abJ₁,J)` equals `s̃`. Supported as written.
- 5.2: Weil64 lines 1706–1756 (§41, printed 193–194): Théorème 6 (continuity and left invariance of θ under `r_k(s)`), Lemmes 4–5 (Schwartz majorants on compacta). The README claims only continuity and normal convergence from the source and owns the derivative and height bounds. Supported; PDF numbers wrong (R03).
- 5.13: GZ86 (MPIM copy) line 1800–1803 (IV §1 (1.1), printed 270): `θ_𝒜 ∈ M₁(Γ₀(D),ε)`. Supported.
- 6.19: locator supports only the last sentence (R02).
- 7.17: DIT16 lines 1214–1226 (printed 976): (8.7) with an orthonormal basis of `V_r`; the extraction drops the conjugation bar, as the README warns. Supported.
- 7.19: DIT16 lines 1279–1312 (printed 977): (8.10)–(8.11), principal term with factor `2/3` and `Γ(s−sign d/4)/(4π|d|Γ(2s))`, sum over `n≡0,1(4)` with `Φ⁺` defined for `n≠0` (so the `n=0` term is the separate constant term, as 7.19 says), prefactor `Γ(s−sign n/4)Γ(s−sign d/4)/(3√π 2^{2−2s}Γ(2s−½)√|nd|)`, `I` for `nd<0`, `J` for `nd>0`. Supported.
- 7.23: DIT16 lines 1442–1459 (Lemma 6, (9.3), printed 979–980): hypotheses `d′,d<0`, `D` nonsquare, all `m∈ℤ`. The README's sign and orientation statements were recomputed (table rows 26–27): with `C_Q` oriented from `z` to `γ_Q z` using (2.11) (lines 225–231, clockwise for `a>0`: the example `Q=[1,1,−1]`, `γ_Q=[[1,1],[1,2]]` moves the top point `−½+1.118i` to `0.571+0.319i`), the unfolded integral is `−it∫₀^π…`, which is what 7.23 states; DIT11's `g_Q` (its (3.1), line 881) is `γ_Q⁻¹` as DIT16's footnote 8 says. Supported; see Source issues.
- 7.29: DIT16 lines 1498–1522 (printed 981): (10.1)–(10.3), `Shim ψ(z)=y^{1/2}Σ 2a_ψ(|n|)K_{ir}(2π|n|y)e(nx)`, `a_ψ(n)` from the Euler product, defined via some `d` with `b(d)≠0`. Supported; independence of `d` is the roadmap's own (correct) addition.
- 7.32a: Biro00 lines 1706–1733 (printed 128–129): `W=W₀⊕W₁`, `W₀={f : b_f(n)=0, n>0, n≡0,1 (4)}`, orthonormal basis adapted to the splitting, lifts vanish on `W₀`, the finite rank argument for `W₁`. Supported, including that no `W₀=0` is claimed.
- 8.32: BFH90 lines 668–726 ((3.1)–(3.8), printed 557–558): `W^±`, the Iwasawa data (3.2), `x₂′=−x₃(x₁+x₄)/(1+x₁²+x₃²)` (3.8), root positive at `X=0` and continued; convergence for `Re s>2`. Supported (the `(y₁y₂)^{4−s}` exponent is not legible in the OCR; see Not verifiable).
- 8.62: BFH90 lines 1676–1693 (printed 580): `H(Q,s;C,T,R)` with prefactor `(2mN³)⁻¹`, the root and `(det Y/|det Z|²)^{s/2}` factors, and the shift identity with `T=(U+N^{2−j}RRᵀ)/(4m)`. Supported.
- 8.66: BFH90 lines 1847–1858 (printed 583–584) and 2073–2082 ((7.1), printed 589): the summation set `α,δ>0`, `β mod Nδ`, `N|β`, `α|Nn₂δ`, the factor `(αδ)^{−s}`, `L(s,Δ)=L(s,Δ,N⁻¹)`. Supported.
- 8.80: BFH90 lines 2566–2572 (printed 601) and 2591–2602 (printed 602): the theta components are genuine automorphic forms with a Whittaker model; continuation via Selberg–Langlands with poles only where the constant terms (`L(s,0)`, `P(s,0)`) have poles, at zeros of `L(2s+k−4,Sym²f)`, to the left of `s=2`. Supported; the Weyl equation `E(s,F)=E(4−s,M(w,s)F)` is the roadmap's formulation (consistent with `ν=s−2`, row 39).

Further locators read while checking: Kudla96 Lemma 2.2 line 216–236 (0.15: translation-and-phase formula, identical to the Lean formula), Lemma 2.4's proof lines 339–352 (0.18: `S(X)` is the space of smooth vectors in `L²(X)`); GQT §2.5 lines 452–484 (6.1: `τ(H_r)=1` for `ε₀≠0`, `2` for `ε₀=0`, `O₁` and `O_{1,1}` `1/2`; `I=τ(H)⁻¹∫θ`), §3.1 lines 581–589 (5.7: convergence iff `r=0` or `m−r>d(n)`), Theorem 7.1 lines 1619–1627 (6.4: `c_{m,n}=1` for `s>0`, `2` for `s≤0`, `τ(H₀)/[E:F]=1` except `O₁`); SunZhu15 Proposition 1.6 lines 161–170 and Theorem 1.10 lines 278–281 (3.16: `d=0,1,2,3,4` for symplectic, quaternionic Hermitian, (skew-)Hermitian, quaternionic skew-Hermitian, symmetric `V`; `n_{t₁}+n_{t₂}=2 dim U+d`); DIT16 lines 632–709 (7.1, 7.4–7.8, 7.36–7.38: (5.14), `E*_{1/2}` constant term, `b(d,s)`, (5.15), Theorem 4 (5.16) with footnote 4, the Remarks on `⟨F,F⟩=6`), line 1331 footnote 7 (7.11), lines 1231–1235 (7.10 `pr⁺=⅔WU+⅓`), lines 1380–1387 (7.21, `S_m=S_{−m}=S̄_m`), lines 1473–1480 (7.22, Lemma 8); GZ86 (MPIM) lines 187–192 (5.12, (5.2) printed 229) and 1947–1998 (5.14–5.15, Lemma (2.3) printed 274–275).

**Adversarial table.** One row per statement checked; values computed on each side.

| # | Statement | Instance | Left | Right | Result | Change |
|---|---|---|---|---|---|---|
| 1 | 0.1–0.3 law, inverse, commutator | `B(x,y)=x₀y₁` on ℤ²; `B=0` on ℤ | `α(e₀,e₁)=1`, `α(e₁,e₀)=0`; `(3,4)⁻¹=(−3,−4)`; `[p,q]=inl(B(x,y)−B(y,x))` | commutator of `e₀,e₁` has central value 1; symbolic expansion of `pq p⁻¹q⁻¹` gives `B(x,y)−B(y,x)` | agree | none |
| 2 | 0.9 polarization identity; 0.10 equivalence | `B(x,y)=x₀y₁` on ℚ², `x=(2,3)` | `½ω(x,y)+q(x+y)` | `B(x,y)+q(x)+q(y)` (symbolic, equal); `(0,(2,3))↦(3,(2,3))` | agree | none |
| 3 | 0.12 third Check | `B=2xy`, `χ(n)=(−1)ⁿ` | `χ(B(x,y))=(−1)^{2xy}=1` | value at `(3,4)` is `χ(3)=−1` | agree | none |
| 4 | 0.13 additional check | `e(x,y)=(2x,y)`, `f=swap` | `e(f(1,1))=(2,1)` | `f(e(1,1))=(1,2)` | distinct, as claimed | none |
| 5 | 0.15/1.1 Schrödinger formula is a representation of `E_{½ω}` | symbolic `h=(t,(x,y))`, `h′=(t′,(x′,y′))` | exponent of `ρ(h)ρ(h′)`: `t+t′+B(u,y)+B(u,y′)+B(x,y′)+½B(x,y)+½B(x′,y′)` | exponent of `ρ(hh′)` with `hh′=(t+t′+½(B(x,y′)−B(x′,y)),…)`: same | agree; Lean formula = Kudla Lemma 2.2 | none |
| 6 | 1.1 Lean, degenerate field | `char F=2` | `halfPairing` divides by 2, junk 0, group abelian, irreducibles one-dimensional, conclusion false for `X≠0` | `h2 : (2:F)≠0` is a hypothesis | excluded | none |
| 7 | 1.1 Lean, `X=0` | `Y=0`, group `=` centre | irreducible smooth with character `ψ` is one-dimensional (`IsSimpleOrder` excludes `E=0`) | `schwartzBruhat (0)`: compactly supported locally constant functions on a point `≅ ℂ` | agree | none |
| 8 | 1.2 Lean, trivial space | `H=0` | `hirr` vacuous, conclusion `0 ≃ L²` false | `[Nontrivial H]` present; multiplicity theorem gives `I=∅` for `H=0` | excluded / consistent | none |
| 9 | 2.1 Checks | ℝ, `ψ=e(t)`, `q=ax²`; ℚ₂, `ψ₂=e(−frac₂)`, `q=x²` | `γ=e^{πi sgn a/4}`; Gauss sum over `½ℤ₂/ℤ₂`: `1+e(−¼)=1−i` | normalized `(1−i)/√2` | agree | none |
| 10 | 2.2 `γ(a,η)²=(−1,a)_F` | ℝ, `a<0` | `γ(a)=e^{πi(−2)/4}=−i`, square `−1` | `(−1,a)_ℝ=−1` for `a<0` | agree | none |
| 11 | 2.3 Leray graph Check | `L₂=F(e₀+e₁)`, `T e₁=e₀` | `q(ye₁)=½ω(ye₁,ye₀)` | `−y²/2` | agree | none |
| 12 | 3.1 tensor form; kernel | `ω⊗ω` on ℚ²⊗ℚ²; scalars | `(ω⊗ω)(e₀⊗e₁−e₁⊗e₀, same)=0−(1)(−1)−(−1)(1)+0=2` | kernel `{(aI,a⁻¹I)}` with `a²=1`: `±(I,I)` | agree | none |
| 13 | 3.9 Checks (central sign) | even tower, genuine `π` | `−1` acts on `S⊗π∨` by `(+1)(−1)=−1≠1` | coinvariants `0` for every `r` | agree | none |
| 14 | 3.16 conservation constants | Sun–Zhu Prop 1.6 | `d=0,1,2,3,4` | README list identical; `U=0`: `0+4`; `Sp₂`: `2·2+4=8` | agree | none |
| 15 | 3.31 product of splittings | IP23 A.18–A.20 | `ŝ₁µ=(u,J)(−2abuJ₁,J)γ_F(J)` | `γ_F(J)(−2abJ₁,J)=s̃` (using `(u,J)²=1`) | agree | none |
| 16 | 5.7 range Checks | `(m,r,n)=(2,0,1),(2,1,1),(3,1,1)`, `ε₀=1` | `d(1)=2`; `s₀=(2−2)/2=0`; `1>2` false; `2>2` false | README: convergent / exceptional / outside | agree | none |
| 17 | 5.12 Checks | `K=ℚ(i)` | `w=4`; ideals of norm 1, 2, 3: `(1)`, `(1+i)`, none | `r(1)=r(2)=1`, `r(3)=0` | agree | none |
| 18 | 5.14a Poisson constant | lattice `b⊂ℂ`, dual `b⁻¹𝔡⁻¹` | `f̂(ν)=(i/2z)e^{−2πiN(ν)/z}`, covol `N(b)√|D|/2` | `i/(√|D| N(b) z)` | agree | none |
| 19 | 6.1, 6.4 constants | GQT §2.5, Thm 7.1; `m=n=0` orthogonal | `τ=1` (`ε₀≠0`), `2` (`ε₀=0`), `½` for `O₁`, `O_{1,1}`; `c=1` (`s₀>0`), `2` (`s₀≤0`) | README identical; `s₀=(0−1)/2=−½` | agree | none |
| 20 | 7.4 constant term at `s=3/2` | formula | `2^{3/2}Λ(3)y^{1}+2^{−1/2}Λ(−1)y^{0}` | README Check | agree | none |
| 21 | 7.8 `‖θ‖²=2π` | numeric: six `Γ₀(4)\SL₂(ℤ)` cosets over the standard domain, `y≤200`, tail `6·200^{−1/2}` | `5.85891+0.42426=6.28317` | `2π=6.28319`; `(3/π)·2π=6` | agree; DIT16's "6" is the mass-one normalization | none |
| 22 | 7.12 Checks and identification | `c=4`; odd `ℓ` | `K_{1/2}(0,0;4)=1+i`, `K(1,0;4)=i+1`; `−(2ℓ+1)≡1 (4)` so `ε^{−(2ℓ+1)}=ε` | README values; GN line 1753 formula | agree | none |
| 23 | 7.13–7.14 Checks and reality | `c=4,8` | `K⁺(0,0;4)=4`, `K⁺(1,1;4)=(1−i)·2·(−1−i)=−4`, `K⁺(1,2;4)=−4`, `K⁺(1,1;8)=0`, `K⁺(1,3;8)=0`, `K⁺(1,0;8)=4√2` | all real | agree | none |
| 24 | 7.18 Checks | `c=4` | `K⁺(−3,−4;4)=(1−i)2(1+i)=4`; `K⁺(1,−3;4)=−4` | README | agree | none |
| 25 | 7.20a Checks | `D=−20`; `D=48` | `[1,0,5]→(−4/1)=1`, `[2,2,3]→(−4/3)=−1`; `[2,0,−6]→(−3/2)=−1` | README | agree | none |
| 26 | 7.21 Checks | `d=1,d′=5,c=4` | roots `b=1,3`; `S₀=2`, `S₁=−2`, `S₂=2`; mod `2a`: one rep, mod `4a`: two | README incl. factor ½ | agree | none |
| 27 | 7.23/7.20a orientation and sign | `Q=[1,1,−1]`, DIT16 (2.11) `γ_Q=[[1,1],[1,2]]` | `γ_Q(−½+1.118i)=0.571+0.319i`: clockwise for `a>0` | clockwise parametrization `θ:π→0` gives `∫_{S_Q}f_φ dτ=−it e(−2mb/c)I(t)`, `Σ_b … =S_{−m}=S_m` | `Φ_m=−it∫`, as README | none |
| 28 | 7.31 factor four | `w=s/2+¼`, pole at `w₀` | `Res_s=(2s₀−1)·2R=4irR` | `Res_w=(2w₀−1)R=irR` | ratio 4 | none |
| 29 | 8.1–8.3 shift and discriminant | symbolic; `(a,c,ℓ)=(1,8,e₀)`, `(1,1,e₁)` | `Δ(S_ℓ p)=4aQ+4a²c(ℓx)²−4ac(Rx)(ℓx)−c[(Rx)²−4a(Rx)(ℓx)+4a²(ℓx)²]` | `4aQ−c(Rx)²`; `(8x₀²,−2e₀)`, `(x₁²,e₀−2e₁)`, `Δ=4`, `−8` | agree | none |
| 30 | 8.17 Checks | `(m,ν,λ)=(8,e₀/8,e₀),(1,e₀/4,e₀)`; translate 1 at `Z=iI,m=1` | `e(2)=1`, `e(½)=−1`, `e(i)=e^{−2π}` | README | agree | none |
| 31 | 8.21 theta pairing | `ρ`-integral then `λ`-tiling; `a=1,2`, `Z=iI₂` | `det Y·∫_{ℝ²}e^{−4πaλᵀYλ}dλ=√det Y/(4a)`; `¼`, `⅛`; `ν=0,Z=iI`: `Σ_L∫e^{−4π|L+λ|²}=¼` | README; BFH prints `/(2N₀)` | README right | Source issue |
| 32 | 8.24 (Lean `theta_fourier_transform`) | Poisson on `ν+2aℤ²`, Gaussian with `A=Z/(2a)`, `det(−iA)=−det Z/(4a²)` | `θ_ν(Z,W)=e(−aZ⁻¹[W])/(2a√(−det Z))Σ_µ e(νᵀµ/2a)θ_µ(−Z⁻¹,Z⁻¹W)` | inversion by the finite transform gives the stated identity with `1/(2a)`; principal root valid since `−iZ` has eigenvalues in the right half-plane | true as stated | none |
| 33 | 8.24 Checks | `Z=iI₂,a=1,W=0,ν=0`; `W=(1,0)` | `θ(2i)²` | `½θ(i/2)²=½·2θ(2i)²`; `Z⁻¹[W]=−i`, `e(−i)=e^{2π}` | agree | none |
| 34 | 8.25 composite | `N=8,m=16,a=2` | `(1/32)·2·(2a)²` | `1` | agree | none |
| 35 | 8.28a Checks | `(N,m)=(8,16),(8,24)`; `k=3` | `64∣64`; `96∤64`; `−I` acts by `(−1)³` | README | agree | none |
| 36 | 8.57 Checks | `pI₂`, `diag(p²,1)` | `gcd(p,p)µ(p)²=p`; `gcd(1,p²)µ(1)µ(p²)=0` | README | agree | none |
| 37 | 8.62 Gaussian | `A=−2mZ⁻¹`, `det(2imZ⁻¹)=−4m²/det Z`; `Z=iI₂,R=0` | `√(−det Z)/(2m)·e(Z[R]/4m)` | `½` (`m=1`), `¼` (`m=2`) | agree | none |
| 38 | 8.70 fourth Check | `p=3,m=16,N=8,r=1,n₁=0,a=b=2,d=1` (case Σ₂) | `λ₁∈{0,3,6}`, `λ₂(λ₂−1)≡0 (3)`: 6 | with modulus `p^{min(a,b)}=9`: only `λ₁=0`: 2 | agree | none |
| 39 | 8.73 second Check | `p=3,k=2,s=3,σ=3,σ′=1,χ=1` | `(8/9)(80/81)(26/27)/((2/3)(8/9))` | `1040/729` | agree | none |
| 40 | 8.76/8.86 normalized parameter | Siegel parabolic of `Sp₄`, `δ_P(m(Q))=|det Q|³` | `s−½−3/2` | `s−2`; Weyl `ν↦−ν` is `s↦4−s`, fixing `s=2` (8.78, 8.80) | agree | none |
| 41 | 8.84 scaling | `N=8,m=16` | `2mN³` | `16384` | agree | none |
| 42 | Suggested.lean padding probe | four sorried theorems | `first \| rfl \| simp \| infer_instance \| (intros; simp)` | all fail | not padding | none |
| 43 | Suggested.lean binders | `#check @` on 11 names | elaborated types | all standing instances present (see Lean form) | sound | none |

## Not verifiable

- GZ86 at the copy the README links (wstein.org): image-only scan, OCR not installed on this worker (cache header lines 3–4); the statements were verified on Zagier's MPIM text copy of the same paper instead (R03 asks to link it).
- BFH90 is an OCR extraction: the exponent of the `(y₁y₂)` prefactor in (3.1) (8.32, 8.68), the `λ/2`-type constants in DIT16 (5.16) and the constants of BFH (8.2)'s third polar term are not legible, so the README's claimed `2mN³` correction to (8.2) (8.84) and its `(y₁y₂)^{4−s}` reading of (3.1) were not checked against the print. The README's own derivation of `(y₁y₂)^{4−s}` (8.68, normalization paragraph) is internally consistent.
- The sign claim in 7.23 was checked by a direct parametrization of the unfolded cycle integral under DIT16's stated orientation; the consistency of DIT16's Lemma 5 and Lemma 7 with that sign was not rederived.
- Texts cited by locator only, not opened (paywalled or not in the sample): MVW87, Minguez08, Fay77, Kohnen85, KatokSarnak93, Maass71, LapidRallis05, Yamana14, Gan12, GG06, BaruchMao10, GS23b, LL21, LL22, LZ22, DL24, Z21, YZ18, YZZ11, AGHMP18, CT20, GI18, GS23a, GanTakeda16, GanIchino16, Laf18, Garrett20, CdS, Duke88 (the last two are in the cache but outside the sample).

## Source issues

- **Error** in BFH90 at Proposition 2.1, printed 551: the theta pairing of two congruent residue classes is displayed as `√det Y/(2N₀)`; for Lebesgue measure on `ℂ²/Λ_Z` it is `√det Y/(4N₀)` (direct Gaussian computation, confirmed at `ν=0`, `Z=iI₂`, `N₀=1`, value `¼`); affects a stated result.
- **Misprint** in DIT16 at (9.3), printed 980: with `C_Q` oriented from `z` to `γ_Q z` by (2.11) (clockwise for `a>0`, the paper's §2 and footnote 8 conventions), the unfolded cycle integral gives `Φ_m(t)=−it∫₀^π…`; the printed `+it` is the sign for DIT11's opposite orientation; affects a stated result (the sign in Lemma 6).
- **Misprint** in DIT16 at the Remarks after Theorem 4, printed 965: `⟨½θ,½θ⟩=6` holds for the measure normalized to mass one on `SL₂(ℤ)\H`; with the paper's `dµ=y⁻²dxdy` the value is `π/2` (`‖θ‖²=2π`, numerically `6.28317`); affects nothing.
- **Misprint** in GZ86 at Lemma (2.3), printed 274: the matrix is taken in `PSL₂(ℤ)`; the weight-one slash detects `−I`, so `SL₂(ℤ)` is meant; affects a stated result (a sign).
