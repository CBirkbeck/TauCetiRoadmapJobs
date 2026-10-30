# Review of GromovWittenTheory (pull request #990 at 89ee2f6)

**Verdict:** needs changes

No P1 or P2 finding: every formula I could compute (virtual dimension, degree shift, the three-point unit exception, divisor, constant-map Euler class, quantum-product degree and left-dual reconstruction, string/dilaton, genus-zero ψ-class and transfer-degree rules) checks out, and every cross-roadmap citation resolves. The gate fails on three style rules (LaTeX delimiters, TeX syntax, the import header), so the folder cannot be accepted until they are repaired; the remaining findings are form and policy.

## R01 (P3) — README is written in LaTeX, not Unicode (gate: latex 573, tex 276)

Location: `TauCetiRoadmap/GromovWittenTheory/README.md` lines 5–10, 20–23, 51–57, 103–130, 162–164, 196–227 and throughout (quoting line 7–9: a `\[ … \]` display with `\mathbb Q`, `\longrightarrow`, `\overline{\mathcal M}`).
Claim: the gate's `latex` and `tex` rules forbid `$…$`, `\[…\]`, `\mathbb`, `^{`, `_{` outside code spans.
Witness: the worker's gate output lists 573 `latex` and 276 `tex` hits; the first is line 5.
Repair: rewrite every formula in Unicode with ASCII inside backtick code spans, e.g. `I_(g,n,A) : H^*(X;ℚ)^(⊗n) → H^*(M̄_(g,n);ℚ)`, `d_(g,n,A) = 2((1−g)(m−3) + c₁(A) + n)`, and put each display in an indented code block. Re-run the gate until both counts are 0.

## R02 (P3) — Suggested.lean imports submodules instead of `import Mathlib` (gate: imports, mathlib-subimports, no-import-mathlib)

Location: `TauCetiRoadmap/GromovWittenTheory/Suggested.lean` lines 1–2: `import Mathlib.Algebra.MonoidAlgebra.Basic`, `import Mathlib.Basic.Real.Basic`.
Claim: the header must be the single line `import Mathlib` followed only by `TauCeti.*` modules actually used.
Witness: gate rules `imports`, `mathlib-subimports` (2), `no-import-mathlib` (1); both modules exist at the Mathlib pin 6b7abb3c, so the build passes, but the rule is on the header.
Repair: replace lines 1–2 by `import Mathlib`.

## R03 (P3) — Suggested.lean states no headline theorem; all six declarations are padding

Location: `Suggested.lean` lines 15–48: `structure CurveClassWeights`, `quantumDegreeHom`, `quantumDegree`, `quantumDegree_add`, `finiteSupportDegrees`, `mem_finiteSupportDegrees`.
Claim: the file is the acceptance test: it states the roadmap's headline theorems with `sorry`, or says in its docstring why none is statable. It contains no `sorry`, no theorem of the roadmap, and a small API of a two-homomorphism structure that no headline uses.
Witness: `lake env lean` on the file finishes in 1.2 s with no output (no `sorry` anywhere). `quantumDegree_add` is closed by the file's own one-term proof `exact map_add w.quantumDegreeHom A B` (line 37) and `mem_finiteSupportDegrees` by `simp [finiteSupportDegrees, quantumDegree]` (line 48): both are one-tactic consequences of the library, i.e. padding by the review's definition. The `area` field is used by nothing.
Repair: delete all six declarations from `Suggested.lean` (the README keeps `deg q^A = 2c₁(A)` and the finite-support grading as G0 targets). The headline theorems (the stable-map operations `I_(g,n,A)` with Kontsevich–Manin 2.2.0–2.2.7, `I_(1,1,0)(1) = χ(X)·1`, associativity of `⋆`, the string, dilaton, divisor and genus-zero topological recursion relations) are not statable at the pins: the pinned Mathlib and Tau Ceti have no stable-map moduli space or virtual functional (AnalyticStableMaps Layers 1–9, ImplicitAtlases Layer 4), no coarse `M̄_(g,n)` with its weighted pairing (ComplexCurveModuli D5–D8), no `Nov(ℚ,H₂(X;ℤ),ω)` (MorseNovikov N1) and no rational Chern classes of complex bundles (CharacteristicClasses C3). Say exactly that in the module docstring and state nothing in their place.

## R04 (P3) — Suggested.lean form: namespace, docstring, README agreement

Location: `Suggested.lean` line 10 `namespace TauCeti.GromovWitten`; lines 4–8 docstring ("This file suggests forms for the Gromov–Witten development; the README is definitive and this file is not exhaustive").
Claim: the namespace must be `TauCetiRoadmap.GromovWittenTheory` (the file currently puts roadmap declarations inside the library's `TauCeti` namespace); the docstring must be "Gromov–Witten theory: target signatures", say the roadmap is README.md and this file is not the roadmap, and name each headline theorem that is not statable and the carrier it lacks; every Lean name must appear in the README.
Witness: `grep -c CurveClassWeights README.md` is 0; none of `quantumDegree`, `finiteSupportDegrees` occurs in the README. Sibling files of the same author use the required form (`rev/987 AnalyticStableMaps/Suggested.lean` lines 1–8, `namespace TauCetiRoadmap.AnalyticStableMaps`).
Repair: rename the namespace, rewrite the docstring as in R03, and after R03 the README/Lean name agreement is vacuous.

## R05 (P3) — README shape: no layers, no Checks, no API bullets, no `*Needs:*` lines, no supplier-contract section before the build

Location: `README.md` line 1 (`# Gromov–Witten theory for closed symplectic manifolds`), lines 16, 32, 42, 49, 74, 87, 94, 125, 155, 168 (section headings `## Conventions and target`, `## G0.` … `## G8.`), lines 229–247 (`## Ownership and dependencies` table, after the build), line 253.
Claim: the required shape is `# Roadmap: <lower-case title>`, `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (per supplier, by declaration or section), `## How to read the build`, `## Layer k` with `### k.n` prose subsections each ending in `### Examples` and `### Dependencies`, `## Downstream consumers`, `## References`; every definition carries an API list and at least three discriminating `**Checks.**`; every target a locator and a `*Needs:*` line.
Witness: `grep -c '^\*\*Checks' README.md` = 0; `grep -c 'Needs:' README.md` = 0; `grep -c '^### ' README.md` = 0. The definitions without a single Check include the realized effective set and `V ⊗̂_ℚ Λ_ω` (G0), `I_(g,n,A)` and the weighted adjoint `π_(n*)` (G2), the Hodge bundle `𝔼_g` (G3), `τ_D` and the transfer degrees (G6), `⋆` and the left dual (G7), `L_i`, `ψ_i`, `D_i` (G8). The targets of G0 (comass bound, finiteness of classes below an energy), G3 (nodal Hodge identification, `I_(1,1,0)(1) = χ(X)`), G6 (transfer degrees 2 and 1), G8 (string, dilaton, divisor, `ψ₁ = Σ D_I`, `L_i^((n+1)) ≅ π^*L_i^((n)) ⊗ 𝒪(D_(i,n+1))`, the ancestor recursion) carry no locator at all. There is no `## Downstream consumers`, although HamiltonianFloerOperations on main (`README.md` lines 3, 17, 36, 93) consumes G0/G5–G7 and SymplecticFieldTheory (open head, `README.md` line 81) lists this roadmap.
Repair: recast G0–G8 as Layers 0–8 with numbered prose subsections, move the ownership table into `## Exact supplier contracts` (one subsection per supplier naming sections/declarations), add `*Needs:*` to each target, add three Checks per definition (the computed values in the adversarial table below are candidates: `d_(0,3,0) = 2`, `⟨pt,pt,1⟩_(0,3,ℓ) = 0` on `ℂP²`, `I_(1,1,0)(1) = 2` on `ℂP¹`, the left dual `e^α = −β` on `T²`, `∫_(M̄_(0,4)) ψ₁ = 1`, the irrational torus for non-discrete area), add `### Examples`/`### Dependencies` per layer, and a `## Downstream consumers` naming HamiltonianFloerOperations H1/H7.

## R06 (P3) — Process narrative and undefined code names for suppliers

Location: `README.md` line 259 ("The primary formal source, as represented by the captured text extraction, is Kontsevich–Manin §2.2"); line 227 ("These are definite G8 goals, not an optional tail"); lines 44–46, 51, 61–66, 97, 134–153, 204 (bare "M11", "M12", "M13.3", "D7.1", "D7.3", "D8", "V1", "V5.2", "V5.6", "V7", "O", "TS", "AT 6.1", "CC", "HF F1", "K5b", "N1").
Claim: a roadmap is timeless (no reference to text extractions or to what is or is not "optional"), and a cross-roadmap citation names the roadmap and its section. The letters D, V, O, TS, CC are never expanded anywhere in the file; a reader must infer D = ComplexCurveModuli, V = ImplicitAtlases, O = Orbifolds, TS = TopologicalSheafCohomology, CC = CharacteristicClasses from the table on line 229 ff.
Witness: `grep -n 'ImplicitAtlases' README.md` finds only the table row (line 238); "V5.2" occurs on lines 61, 97, 100 with no expansion. Each code does resolve (see Verified sound), so this is form, not drift.
Repair: write "AnalyticStableMaps §12.2", "ComplexCurveModuli D7 item 1", "ImplicitAtlases §5.2", "Orbifolds O5", "TopologicalSheafCohomology Layer 1", "AlgebraicTopology Stage 6 item 1", "CharacteristicClasses C3", "HeegaardFloer Lane F1 item 3", "ComplexKahlerGeometry K5b" at first use in each section; delete the clause "as represented by the captured text extraction" and the sentence on line 227's "not an optional tail".

## R07 (P3) — Supplier drift: SymplecticGeometry does not supply closed symplectic targets or tame structures

Location: `README.md` line 233: "| SymplecticGeometry | Closed symplectic targets, tame structures, parameter paths |".
Claim: the cited supplier owns none of these objects.
Witness: SymplecticGeometry on main (`README.md` lines 8–23, 44–84) is cotangent/Hamiltonian/toric/integrable/contact geometry and itself defers the symplectic/almost-complex base to HeegaardFloer Lane F2.1 (line 56). The pinned Tau Ceti already has `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.Tames` (`TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean` line 114) and `SmoothAlmostComplexStructure` (`AlmostComplex.lean` line 67); compact tame parameter families are AnalyticStableMaps §2.1 and §10.1.
Repair: replace the row by a `From Tau Ceti` entry naming those three declarations and a `From TauCetiRoadmap.AnalyticStableMaps` entry for §2.1/§10.1 parameter families; drop SymplecticGeometry.

## R08 (P3) — HeegaardFloer Lane F1 is cited for operators it states only on discs and strips

Location: `README.md` line 236 ("HeegaardFloer F1 + PDE Lane A | Written scalar/bundle ∂̄, Fredholm/trace …") and line 61 (G3: "HeegaardFloer F1's scalar/bundle ∂̄, Fredholm and trace inputs" on normalized compact components with Hardy boundary traces).
Claim: Lane F1 item 3 (HeegaardFloer `README.md` lines 171–184) states linear Cauchy–Riemann operators as Fredholm operators on the disc and strip with totally real boundary conditions; G3 needs the scalar operator on a compact normalized component with circle boundaries and Hardy traces.
Witness: HeegaardFloer `README.md` line 184: "Linear Cauchy–Riemann operators on the disk/strip as Fredholm operators"; nothing in Lane F1 concerns a compact Riemann surface with boundary.
Repair: state in G3 that the compact-component operator with Hardy boundary traces is a G3 target built from F1 item 3 (local elliptic estimates) and ComplexKahlerGeometry K5b (closed components), or cite AnalyticStableMaps §4.1 if its nodal linearization is the intended input; amend the table row accordingly.

## R09 (P3) — Source locators lack theorem and page numbers

Location: `README.md` lines 250–253 (Kontsevich–Manin "Sections 2.2 and 6.1 … §4.5"; Pardon "Section 9"; McDuff–Salamon "is contextual").
Claim: every cited claim carries an exact locator (theorem or equation number and printed page); a reference used for nothing is dropped.
Witness: KM1994 (arXiv hep-th/9402147v2): Definition 2.2 and axioms 2.2.0–2.2.8 are pp. 4–6 (lines 128–251); the obstruction bundle `E_(g,n) ⊠ T_V` of rank `g·dim V` is 2.4.5, p. 10 (lines 408–421); Theorem-Definition 4.5 is p. 19 (lines 816–819); Definition 6.1 with axioms 6.1.1–6.1.3 is p. 31 (lines 1455–1473). Pardon2016 (arXiv 1309.2370v6): Definition 9.3.1 and Lemma 9.3.2 (J-independence) are p. 100 (lines 4355–4366); the fibre-product desideratum is the §5 introduction, p. 40 (lines 1698–1702). McDuff–Salamon has no locator and is used for nothing.
Repair: add these locators at the claims (G4 items 1–3, G5 bullets, G6 formulas, G3 obstruction bundle, G7 CohFT and `⋆`), and either cite McDuff–Salamon by lemma and page where G0 uses the energy/area comparison (Lemma 2.2.1 and §4.1 in the second edition, by locator only) or delete the line.

## Verified sound

**Gate.** Rerun of the dependency check: `depcheck: 208 roadmaps, 1452 edges, 0 problem(s)`; no UPWARD or CYCLE line. The worker's gate at 89ee2f6: build passes, set_option 0, sorry-data 0, prnum 0, stray-files 0, outside-folder 0; failures only `latex`, `tex`, `imports`/`mathlib-subimports`/`no-import-mathlib` (R01, R02). `git diff --stat origin/main...HEAD` touches only `README.md`, `Suggested.lean`, `metadata.toml` of this folder; `metadata.toml` is `topic = "math.SG"`.

**Elaboration.** `lake env lean TauCetiRoadmap/GromovWittenTheory/Suggested.lean`: exit 0, no output, 1.2 s. The elaborated types of all 6 declarations (scratch `signatures.md`) were compared with the README: `quantumDegree A = 2·firstChern A` matches `deg q^A = 2c₁(A)` (README line 38); the Lean is stated for an arbitrary `AddCommGroup H` with `area : H →+ ℝ`, `firstChern : H →+ ℤ`, wider than the README's `H₂(X;ℤ)`, harmless, and `area` is unused. No section binder is lost. One-tactic probe: both theorems are closed by their own one-tactic proofs (R03).

**Sources (seeded sample of 15, read at the locators in the cached texts).** KM1994 = arXiv hep-th/9402147v2, Pardon2016 = arXiv 1309.2370v6.

| # | Target in README | Source locator | Result |
|---|---|---|---|
| 1 | Effectivity (G4 item 1) | KM1994 line 133, 2.2.0, p. 4 | matches: `I = 0` off the effective set |
| 2 | `S_n` covariance with Koszul signs (G4 item 2) | KM1994 lines 134–136, 2.2.1 | matches (super grading) |
| 3 | degree shift `2(K·A) + (2g−2)m` (Conventions) | KM1994 lines 137–142, 2.2.2, eq. (2.2) | identical |
| 4 | basic classes list (G5) | KM1994 lines 144–146, eq. (2.3) | identical: `(0,3)`, `(1,1)`, `(g,0)` for `g ≥ 2` |
| 5 | codimension zero = degree equals `2(3g−3+n)` (G5) | KM1994 lines 149–151 | identical |
| 6 | fundamental class and three-point exception (G5) | KM1994 lines 176–185, 2.2.3, (2.6)–(2.7) | identical, including `A = 0 ↦ ∫γ₁γ₂` |
| 7 | divisor, class-valued (G5) | KM1994 lines 186–196, 2.2.4 | identical general form `π_(n*) I = (∫_A δ) I` |
| 8 | mapping to a point, `g = 0` (G5) | KM1994 lines 199–204, (2.8) | identical |
| 9 | `I_(1,1,0)(1) = χ_top(X)·1` (G3) | KM1994 line 210, (2.9) | README is right; the source's coefficient is wrong (see Source issues) |
| 10 | splitting with `n_i + 2g_i − 2 ≥ 0`, `ε(S)`, Casimir order (G6) | KM1994 lines 220–241, 2.2.6, (2.11) | identical, finiteness via effectivity as in README |
| 11 | genus reduction (G6) | KM1994 lines 242–246, 2.2.7, (2.12) | identical |
| 12 | 2.2.8 is a separate Chow condition (G4) | KM1994 lines 247–251 | matches |
| 13 | obstruction bundle `𝔼_g^∨ ⊠ TX`, rank `gm` (G3) | KM1994 lines 408–421, 2.4.5, p. 10 | matches (KM's `E = R¹π_*𝒪` is the Hodge dual) |
| 14 | CohFT 6.1 has covariance, splitting, genus reduction, no unit (G7); quantum ring conditional on axioms (G7) | KM1994 lines 1455–1473, p. 31; lines 816–819, p. 19 | both match |
| 15 | Pardon §9 gives the virtual class, J-independence, and names fibre products as further work (References) | Pardon2016 lines 4355–4366 (Def. 9.3.1, Lemma 9.3.2, p. 100); lines 1698–1702 (p. 40); lines 4087–4090 (KM axioms left open) | matches |

**Cross-roadmap citations resolved (now, on main or at the open head).** MorseNovikov N1 (main, `README.md` lines 75–138: `Nov(R,H,N)` with the `N(h) < C` finite-support condition, `AddMonoidAlgebra` embedding, no completed-tensor identification claimed, as the README assumes). ComplexCurveModuli D7 items 1–4 and D8 (main, lines 192–221: one-mark contraction with `xv = t₁t₂`, `forgetAuxiliarySet` order coherence, clutching with smoothing line `T_* ⊗ T_**`, the weighted Orbifolds adapter with generic order-2 isotropy on `M̄_(1,1)` and `M̄_(2,0)`). AnalyticStableMaps at rev/987: M4 (lines 656–707), M6 (763–810), M7 (814–856), M10 (933–963), M11 (967–997), M12 (1001–1031), §13.3 and §13.4 (1060–1086); §13.4 and `## Downstream consumers` (1090–1094) assign to GromovWittenTheory exactly the operations, axioms, descendants and the curve-class/Chern/area specialization this README owns. ImplicitAtlases at rev/974: V1 (282–366), §5.2 cobordism law (598–611), §5.6 Euler comparison (656–671), V7 §7.3–7.4 (804–849; §7.4 states that GW splitting/divisor/unit need application diagrams and orbifold weights, as this README does). TopologicalSheafCohomology at rev/973 Layers 0–1. Orbifolds O5 (main, 672–740: `|G|⁻¹∫_U` with ineffective kernel). ComplexKahlerGeometry K5b (main, line 1168). HeegaardFloer Lane F1 (main, 171–184; see R08). PDE Lane A (main, 223–263). DifferentialGeometry Layer 8 (main, 816–861). CharacteristicClasses C3 Chern classes (main, lines 188–191, 720 ff.). AlgebraicTopology Stage 6 item 1 (main, lines 1011–1055: cochains and universal coefficients over a PID). GeometricTopology smoothing-and-triangulation item 1 (main, 937–943). HamiltonianFloerOperations (main) consumes this roadmap's G0/G5–G7 and G7's class group with energy and Chern maps: consistent with G0/G7 as written.

**Ownership.** No roadmap on main, in the board's packages index, or among the open heads named in the brief constructs cohomology-valued Gromov–Witten operations, the quantum product or descendants: FukayaTheory (rev/1045 line 7) and SymplecticFieldTheory (rev/1054 lines 378–388) exclude closed GW classes; TaubesGromov (main line 29) is the SW point invariant; HamiltonianFloerOperations consumes G7. `roadmaps grep` for Gromov–Witten, quantum cohomology/product and descendant over 440 open pull requests found no second owner. Mathlib and Tau Ceti at the pins have no Novikov ring, stable map or Gromov–Witten declaration (`grep -ril` over both packages). Pull requests whose files the brief does not give were not checked beyond `roadmaps grep`.

**Adversarial pass.**

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `d_(g,n,A) = 2((1−g)(m−3) + c₁(A) + n)` | `(0,3,0)` on `ℂP¹`; `(1,1,0)` any `m`; lines in `ℂP²` `(0,0,ℓ)` | `2(−2+0+3) = 2 = dim ℂP¹`; `2(0+0+1) = 2 = (2+2m) − 2m`; `2(−1+3+0) = 4` | sound | none |
| degree `r = Σdeg γ_i + 2(g−1)m − 2c₁(A)` equals `t − d + s` | symbolic; `(0,3,0)`, `Σ = 2m`; `(1,1,0)`, `γ = 1` | `t − d = 2gm − 2m − 2c₁(A)`; `r = 0`; `r = 0` | agrees with KM (2.2) | none |
| three-point unit exception | `A = 0`; `ℂP²`, `A = ℓ`, `γ = pt, pt` | `∫γ₁γ₂`; `π_*1 = 0` so `0` (wrong model `π_*1 = 1` gives `1`) | sound | none |
| divisor axiom | `ℂP²`, `⟨pt,pt,H⟩_(0,3,ℓ)` | `(ℓ·H)·⟨pt,pt⟩_(0,2,ℓ) = 1·1 = 1`; degrees `4+4+2 = 10 = d` | sound | none |
| `I_(1,1,0)(1) = χ_top(X)·1` | `X = ℂP¹`, pt, `T²` | `p_*(c₁(T) − λ) = 2 + 0`; `1`; `0`; KM's `Σ(−1)^i h^(i,0)` gives `1` on `ℂP¹` | README right, source wrong | none (source issue) |
| `c_m(L ⊗ V) = Σ_k c₁(L)^k c_(m−k)(V)` | `m = 1, 2` by splitting principle | `c₁(L)+c₁(V)`; `c₂(V) + c₁(L)c₁(V) + c₁(L)²` | sound | none |
| `λ₁^k = 0` on `M̄_(1,1)` for `k ≥ 2` | real dimension 2 | degree `2k ≥ 4 > 2` | sound | none |
| splitting condition `n_i + 2g_i − 2 ≥ 0` | `(g_i,n_i) = (0,2), (0,1), (1,0)` | `0` ok (factor `(0,3)`); `−1` excluded (factor `(0,2)`); `0` ok (`(1,1)`) | sound | none |
| non-basic ⇒ forgetful target stable | `(0,4), (1,2), (2,1), (1,1)` | `(0,3), (1,1), (2,0)` stable; `(1,0)` excluded as basic | sound | none |
| `⋆` has degree 0 and `A = 0` term is cup | `deg q^A e^j = 2c₁(A) + 2m − deg e_j`; nonzero `⟨a,b,e_j⟩_A` needs `deg a + deg b + deg e_j = 2m + 2c₁(A)` | `deg(a ⋆ b) = deg a + deg b`; `Σ_j (∫ a b e_j) e^j = a ∪ b` | sound | none |
| left dual and reconstruction `v = Σ_j (∫ v ∪ e_j) e^j` | `T²`, basis `1, α, β, pt`, `∫αβ = 1` | `e^α = −β` (left), right dual would be `β`; `Σ_j(∫α e_j)e^j = (∫αβ)e^β = α` | sound; the odd-class warning is substantive | none |
| string equation | `⟨τ₀(1)τ₁(γ₁)τ₀(γ₂)τ₀(γ₃)⟩_(0,0)`; `⟨τ₀(1)τ₀(γ₁)τ₀(γ₂)⟩_(0,0)` | `∫_(M̄_(0,4))ψ₁ · ∫γ₁γ₂γ₃ = ∫γ₁γ₂γ₃` both sides; second case: target `M̄_(0,2)(X,0)` undefined, so excluded (value `∫γ₁γ₂ ≠ 0` would refute an unguarded form) | sound as stated | none |
| dilaton `2g − 2 + n` | `⟨τ₁(1)τ₀(γ₁)τ₀(γ₂)τ₀(γ₃)⟩_(0,0)`; `⟨τ₁(1)⟩_(1,0)` | `1·∫γ₁γ₂γ₃ = (0−2+3)·∫γ₁γ₂γ₃`; second: `χ(X)/24 ≠ 0·(undefined)`, excluded by "target defined" | sound | none |
| `ψ₁ = Σ_(1∈I, 2,3∉I, |I|≥2) D_I` | `M̄_(0,4)`, `M̄_(0,3)` | only `I = {1,4}`: `∫ψ₁ = 1`; no `I`: `ψ₁ = 0` | sound | none |
| `c₁(T_* ⊗ T_**) = −ψ_* − ψ_**` | boundary divisor of `M̄_(0,5)` | `deg N_D = −1 = D²` | sound | none |
| ancestor TRR, `n = 3` and the `S ≠ ∅` condition | `ℂP¹`, `A = [ℂP¹]`: `⟨τ₁(pt)τ₀(pt)τ₀(1)⟩_(0,A)` | descendant value `1` (string) while the ancestor side is `0`; contracted-tail term `Σ_(a,b)⟨pt,Δ_a⟩_A g^(ab) ∫Δ_b pt = 0 + 1 = 1` | the `D_i` correction is exactly `1`; sound | none |
| transfer degrees | `M̄_(0,4) → M̄_(1,2)`; `M̄_(1,1)² → M̄_(2,0)`; `M̄_(0,3)×M̄_(1,2) → M̄_(1,3)` | `2`; `2`; `1` | sound | none |
| weighted class `1/k` of coarse | `M̄_(1,1)`, `k = 2` | `∫^wt ψ = 1/24`, coarse `1/12` | sound | none |
| finiteness of represented classes below energy `C` | `T⁴` with irrational `ω`-periods (dense area image) | `|∫_A η_i| ≤ comass(η_i)·c·ω(A) ≤ c'C` bounds each of 6 coordinates: finitely many classes though `ω(H₂)` is dense | sound; "do not assume discreteness" is necessary | none |
| torsion classes | `A ≠ 0` torsion | `ω(A) = 0` ⇒ constant ⇒ `A = 0`: `I_(g,n,A) = 0` | sound | none |
| `V ⊗ Λ → V ⊗̂ Λ` iso for finite-dimensional `V` | `V = ℚ²`; `V = ℚ^(ℕ)` | `= Λ²`; `Σ_n q^(A_n) e_n` with `ω(A_n) → ∞` is finite-below but not in `V ⊗ Λ` | hypothesis necessary and sufficient | none |
| Lean `quantumDegree_add`, `mem_finiteSupportDegrees` | `f = 0`; `f = q^A + q^B` with `c₁(A) = c₁(B)` | `∅`; one element | true, trivial | delete (R03) |

## Not verifiable

- McDuff–Salamon, *J-holomorphic Curves and Symplectic Topology*, 2nd ed.: paywalled, and cited without a locator (R09); no claim of the README depends on a specific statement of it.
- HeegaardFloer Lane F1 is a lane description without numbered theorem statements; its scope (disc/strip) was read from the text (R08).

## Source issues

- **Error** in KM1994 at 2.2.5, equation (2.9), printed page 6 (arXiv v2): the source gives the genus-one degree-zero coefficient as the alternating sum of the Hodge numbers `h^(i,0)(V)`; it should be the topological Euler characteristic `∫_V c_(dim V)(T_V)`, as the source's own obstruction-bundle formula in 2.4.5 (p. 10) yields (`2` on `ℂP¹`, not `1`); affects a stated result.
- **Misprint** in KM1994 at 2.4.5, printed page 10: the obstruction sheaf is said to live on the moduli space of class `β` with `g = 0` indices; it should be the degree-zero space `M̄_(g,n)(V,0) = M̄_(g,n) × V` just displayed; affects nothing.
