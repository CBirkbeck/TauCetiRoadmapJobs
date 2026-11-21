# Review of EuclideanJordanAlgebras (pull request #2834 at ec51968)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons, neither in the README's mathematics: `Suggested.lean` leaves two definitions as `sorry` (the spectral trace and the square root), and the square root has lost its ring structure, so its specification is false as elaborated; and the Tau Ceti modules for the Peirce decomposition, the trace form and the compact Albert algebra, which the README says Tau Ceti already has, are absent from the pinned Tau Ceti. Every Check, worked example and stated identity I recomputed in the README is correct. There are six small corrections and two format notes, none blocking. The human reviewers are asked about the pin, the Faraut–Korányi text (not readable, so not compared) and the two formalizations named under Provenance.

## R01 (P1) — `sqrt` and `spectralTrace` are definitions whose body is `sorry`, and `sqrt` elaborates to a function on a bare type, which makes `sqrt_spec` false

Fifteen of the twenty-five theorems of `Suggested.lean` mention one of these two definitions (the three trace statements, `squares_selfDual`, `sqrt_spec` and every `seqProd` statement), so the acceptance test for Layers 2, 3 and 7 is stated about objects that do not exist. For `sqrt` it is worse than a missing body. A `def` keeps only the section variables its type mentions, and the type `J → J` mentions none: `#check @sqrt` gives `{J : Type u_1} → J → J` (line 256). So `sqrt` is one function per type, the same for every ring structure on it, while `sqrt_spec` (line 259) quantifies over all Euclidean Jordan structures on `J`. Take `J = ℝ` with its usual structure and with the product `x ∘ y = xy/2` (unit `2`, the usual addition and scalars); both are Euclidean Jordan algebras with cone of squares `[0, ∞)`. `sqrt_spec` forces `sqrt 1 = 1` in the first and `sqrt 1 = √2` in the second, since `√2 ∘ √2 = 1`. The statement is therefore refutable, not merely unproved. `spectralTrace` (line 89) keeps `[NonAssocCommRing J] [Module ℝ J]` and is consistent, but is still data given by `sorry`.

The smallest repair is to give both a real body with the binders in the signature. For the square root: `def sqrt [NonAssocCommRing J] (a : J) : J := if h : ∃ x ∈ squares J, x * x = a then h.choose else 0` (classically), with `sqrt_spec` unchanged. For the trace: a plain function `J → ℝ` that returns `∑ i, coeff i` for a chosen Jordan-frame decomposition of `x` and `0` when none exists, with `spectralTrace_frame` (independence of the frame) and linearity as theorems; or state `spectralTrace_frame` as the existence and uniqueness of a linear functional with that property and phrase `spectralTrace_assoc`, `spectralTrace_pos` and `squares_selfDual` for that functional.

## R02 (P2) — The Tau Ceti modules for the Peirce decomposition, the trace form, the linearized Jordan identity and the compact Albert algebra are not in the pinned Tau Ceti

The opening says "Tau Ceti already has the Peirce decomposition at one idempotent, the trace form `Tr L_(x∘y)` and the inner derivations of a Jordan algebra; this roadmap builds on them", and the supplier contracts list `TauCeti.Algebra.Jordan.Basic` (`TauCeti.Jordan.mul_mul_mul_sub_add_add_eq_zero`), `TauCeti.Algebra.Jordan.Peirce` (`peirceSpace`, `peirceOne`, `peirceHalf`, `peirceZero`, `peirceLinearEquiv`), `TauCeti.Algebra.Jordan.TraceForm` (`mulTrace`, `traceForm`, `traceForm_comm`, `traceForm_assoc`, `traceForm_derivation`) and `TauCeti.Algebra.AlbertAlgebra.Compact` (`TauCeti.CompactAlbertAlgebra`). At the Tau Ceti commit this repository pins (`2fd255d`, in `lake-manifest.json`), the directory `TauCeti/Algebra/Jordan/` contains only `Derivation.lean`, and `TauCeti/Algebra/AlbertAlgebra/` contains `Basic`, `Derivation/`, `Determinant`, `Jordan` and `OctonionDerivation`; none of the names above occurs anywhere in the pinned library. Only the inner derivations (`TauCeti.jordanInnerDerivation`, `TauCeti/Algebra/Jordan/Derivation.lean` line 103), the octonions and the Lie-subgroup declarations are there. So the *Needs:* lines of §1.1, §1.3, §2.1 and §2.2, and the Albert carrier of §6.6, point at declarations an implementer working at the pin cannot open, and I could not check that they say what the README assumes of them (for example that `peirceSpace` is the eigenspace of `L_c`, or which normalisation `traceForm` has).

The pull request's description says these were merged into Tau Ceti; a later Tau Ceti commit does have `TauCeti/Algebra/AlbertAlgebra/Compact.lean` with a structure `CompactAlbertAlgebra`. If so, the repair is not in the mathematics: bring the branch onto a main whose pin contains the four modules and the citations can then be checked as they stand. Until the pin has them, the text is true only if the one-idempotent Peirce decomposition, the trace form with its symmetry and associativity, and the linearized identity are stated as targets of §1.1, §1.3 and §2.1, or the sentence in the opening and the contract entries say from which Tau Ceti commit the modules exist. The compact Albert algebra itself is owned regardless: LieHighestWeight Layer 8 on main plans it ("The formally real Albert supplier"), so §6.6 can cite that section without the Lean name.

## C01 — Hurwitz's theorem in §6.5 needs the algebra to be nonzero

As written (line 506), "a finite-dimensional real algebra `D` with unit … carrying a positive definite quadratic form `N` with `N(ab) = N(a) N(b)`" admits the zero algebra (`1 = 0`, `N = 0` is positive definite on the zero space), which is none of `ℝ`, `ℂ`, `ℍ`, `𝕆`. The Conventions treat the zero ring as a Euclidean Jordan algebra, so the case is live in this text. Insert "nonzero". The use in §6.4 is unaffected, since `D = J_12 ≠ 0` there by §6.2.

## C02 — Faraut–Korányi is cited by chapter only

Nineteen of the twenty-nine source citations in the layers are of the form "Faraut–Korányi, Chapter III", and the References say "cited by chapter". A chapter of that book is some twenty to thirty pages and several of these lines cover five or more results (for instance §3.3, §5.2, §6.1), so neither an implementer nor a referee can find the statement and its hypotheses without reading the chapter. Give the proposition or theorem number at each claim, as the README already does for Lourenço, Westerbaan–Westerbaan–van de Wetering and van de Wetering.

## C03 — The scope paragraph on the quantum-foundations roadmap understates what the two share, and does not name it

The first bullet of "Scope and ownership" says "The two meet in two facts" (line 648). QuantumFoundations §1.6 (an open pull request, earlier in the merge order) also states, for the unital JB-algebra of a distributive Segal system, the fundamental formula `U_(U_a b) = U_a U_b U_a`, the Jordan inverse defined by `a∘b = 1`, `a²∘b = a` with its uniqueness and `U_(a⁻¹) = U_a⁻¹`, `U_a(A₊) ⊆ A₊`, closedness and convexity of the square cone, the Peirce decomposition at one idempotent, and `p ≤ e ⇔ p∘e = p`; these are §3.1, §2.5, §3.4, §3.3, §2.1 and §3.5 here. The two are not one object: the carriers differ (a normed Segal system there; a finite-dimensional formally real ring with no norm here), and importing them would be circular, since the norm laws of §4.1 are proved from §3.3. A reader should be told that: name the roadmap (QuantumFoundations §1.6) and add one clause saying that these statements are kept here on the norm-free carrier and proved without the JB norm, by the routes of §3.1 and §3.4.

## C04 — Baez sketches the proof of Hurwitz's theorem and refers elsewhere for it

§6.5 cites "Baez, Theorem 1 and §§2.2–2.3" and the References say "the proof of Theorem 1 in §2.3". Theorem 1 is stated in §1.1 (Baez2002 line 217), and the text says it only sketches proofs in §2.3 and points to Schafer's book and to Springer–Veldkamp for them (Baez2002 lines 221–223 and 557); the Cayley–Dickson step that §6.5 uses is introduced there with "with further calculation one can show" (line 566). Baez's hypothesis is also a norm, not a quadratic form, and the statement that the isomorphism carries `N` and the conjugation to the standard ones is not in Theorem 1. Keep Baez for the outline and add a primary source with a theorem number for the statement as §6.5 makes it.

## C05 — The Lean continuity statement is weaker than the README's

§7.3 asks that "`(a, b) ↦ a & b` is continuous" on effects; `continuousOn_seqProd` (line 310) fixes `b` and states continuity in `a` alone, on the cone of squares. That is what van de Wetering's Proposition 4.3 states (vdW2020 line 590), and joint continuity follows from it by linearity in `b` in finite dimension, but the two texts should say the same thing: state the joint continuity in Lean, or say in §7.3 that the content is continuity in the first argument.

## C06 — The description does not name LieGroups Layer 2 among the suppliers

The description's paragraph "Why Tau Ceti" names CompactQuantumMetricSpaces Layer 0 and LieHighestWeight Layer 8; the README has a third supplier, LieGroups Layer 2 (the closed-subgroup theorem, §5.2). Add it. The sentence "Merged: … (Peirce decomposition), … (trace form)" is about Tau Ceti's main branch; at the commit this repository pins those modules are absent (R02), which the description should say or the branch should resolve.

## N01 — Imports

`Suggested.lean` imports seven `Mathlib.<submodule>` modules (lines 6–12) and has no line `import Mathlib`. The form is the single line `import Mathlib` followed by `import TauCeti.Algebra.CayleyDickson.Quaternion`.

## N02 — Docstrings, section comments and names

Eleven declarations have no docstring (`IsMinimalNonzeroIdeal`, `spectralTrace_frame`, `sqrt_spec` and eight of the `seqProd` laws); the section comments are not of the form `## Layer k: <title>`; and none of the Lean names (`IsJordanFrame`, `rank`, `quadratic`, `squares`, `seqProd`, …) appears in the README, so a prose statement cannot be matched to its formal one.

## Questions for the author

- §1.3 cites Faraut–Korányi, Chapter III, for the equivalence of formal reality with the existence of a positive definite associative form. My recollection is that the book states this equivalence in Chapter VIII, not III. I could not read the book to check. Which proposition is meant?
- §3.1 cites McCrimmon, Part II, 5.2.3 for the fundamental formula. McCrimmon derives it from Macdonald's principle, which the scope section says is not used here. Is the citation meant only for the statement? (The text is behind a paywall; not opened.)

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §1.3 trace form positive; three equivalent conditions | `ℝⁿ`; `ℂ` over `ℝ`; zero algebra; `Herm₂(ℂ)` | `τ(x,y)=Σx_iy_i`; `1²+i²=0`; `τ(e,e)=dim`; `Tr L_c = 1+½·2 = 2` | holds; 3⇒1 by `b(e,x²)=b(x,x)` | none |
| `formallyReal_iff_exists_associativeForm` | zero ring; `ℝ×ℝ` with form `−uv` | zero ring: both sides true; indefinite spin: `(0,1)²+(1,0)²=0`, no definite associative form | agrees with §1.3 | none |
| §2.2 Peirce decomposition of a system | `Herm₂(ℂ)`, `x=diag(2,−3)`; one-member system | `P(x)` on `J_11,J_12,J_22`: `4,−6,9`; `L_x`: `2,−½,−3`; `n=1`: `J=J_11` | holds | none |
| §2.3 rank; `card_frame`, `spectralFrame` | zero algebra; `ℝ³`; `Spin_n` | rank `0` (empty frame, `sSup ∅ = 0`); `3`; `2` with idempotents `½(1,±u/‖u‖)` squaring to themselves | holds; Lean rank equals README rank | none |
| §2.4 `χ`, `tr`, `det` | `ℝ³` `(2,2,−1)`; `Spin_1≅ℝ²`; `Spin_0` | `χ=(T−2)²(T+1)`, `tr 3`, `det −4`; `tr=2t`, `det=t²−u²`; `Spin_0`: `tr=t`, so `n≥1` needed | holds | none |
| §2.5 inverse, square root | `(3,(0,2))` in `Spin_2`; `(4,0)` in `ℝ²`; zero algebra | eigenvalues `5,1`, inverse `(3,(0,−2))/5`; `√=(2,0)`, `(−2,0)` excluded; `det=1`, `0⁻¹=0` | holds | none |
| `sqrt`, `sqrt_spec` | `ℝ` with products `xy` and `xy/2` | `sqrt 1 = 1` and `sqrt 1 = √2` for the same function `sqrt : ℝ → ℝ` | contradictory | R01 |
| §3.1 `P` and `fundamentalFormula` | `x=e`; idempotent `c`; `Herm_n`: `P(x)y=xyx` | `P(e)=2−1=1`; `P(c)`: `1,0,0` on `J_1,J_½,J_0`; `(xyx)z(xyx)=x(y(xzx)y)x` | holds | none |
| §3.2 trace inner product; `spectralTrace_assoc/pos` | derivation `[L_x,L_z]`; frame | `tr(x∘(z∘y))=tr(z∘(x∘y))`; `B(c_i,c_j)=δ_ij`; `B(x,x)=Σλ_i²` | holds | R01 (carrier) |
| §3.3–3.4 `squares_selfDual`, `squareCone` | `Herm₂(ℝ)`; spin; zero algebra; `ℝ²` | cone `a,d≥0, ad≥b²`; `t≥‖u‖`; `C=Ω={0}∋e`; `P(√y)P(√x)⁻¹x=y` | holds | R01 (trace carrier) |
| §4.1 order-unit norm | `e/2` in `Herm₂(ℂ)`; `Spin_2` `(3,(0,2))` | `‖·‖_e=½`, `‖·‖_B=1/√2`; `5` and `√26`; `½ ≤ 1/√2 ≤ √2·½` | holds; supplier names found on main | none |
| §4.2 states and densities | `Spin_2`, `c=½(1,(1,0))`; `ℝ⊕Herm₂(ℂ)` | `B(c,x)=2·3/2=3`, between `1` and `5`; `τ=B` and `2B` on the summands | holds | none |
| §4.3 `koecher` | `x↦(2x_1,x_2)` on `ℝ²`; `diag(1,½)`; transpose | not unital, not Jordan; `diag(0,½)` below it and its complement; transpose unital order automorphism | holds; source read | none |
| §5.1 characteristic function | orthant; dimension `0`; `g=t·1` | `φ=1/∏x_i`, minimiser of `−Σlog x_i+Σx_i²/2` is `(1,…,1)`; `φ=1`; `t^(−n)` | holds | none |
| §5.2 Lie algebra of `G` | orthant: `𝔤` diagonal | `𝔨=0`, `𝔭` diagonal, `X↦Xe₀` bijective; `id∈𝔭` gives `L_(e₀)=1` | holds; LieGroups names at pin | none |
| §5.3 `koecherVinberg` | `V=0`; half-line; orthant at `e`; PSD at `e=diag(2,1)` | `m=0`; `xy/e`; `x_iy_i/e_i`; `diag(1,0)²=diag(½,0)`, unit check `(ee⁻¹y+ye⁻¹e)/2=y` | holds, unique by Koecher | none |
| §6.1 `simpleDecomposition` | zero algebra; `ℝ⊕Herm₂(ℂ)`; simple `J` | no minimal ideal, empty sum; two ideals, rank `3`; `τ(e,e)/B(e,e)=dim/rank` | holds | none |
| §6.2 Peirce constants | `Herm₂(ℝ)`, `Herm₃(ℝ)` | `u²=e`, `½B(u,u)=1`; `B(u∘v,u∘v)=½=⅛·2·2`; `w²=e` | holds | none |
| §6.4 coordinates | `Herm₃(K)`, `u_12=E_12+E_21`, `u_13=E_13+E_31` | `u_23=E_23+E_32`; `b′=b[23]`; `a·b=(ab)[12]`; `ā=2Re(a)−a`; `N=|a|²` | holds | none |
| §6.5 Hurwitz | zero algebra; `ℝ` | zero algebra satisfies the hypotheses, is not on the list; `N(1)=1` otherwise | holds for nonzero `D` | C01, C04 |
| §6.6 `classifySimple` | `ℝ`; `Herm₂(ℂ)`; `ℝ⊕ℝ`; table rows | first disjunct; `≅Spin_3`, squares `(t²+s²+|z|², 2ts, 2tz)` both sides; `J_12=0`; `d=(27−3)/3=8` | holds | R02 (Albert name) |
| §7.2 operator commutation | Pauli `σ_x,σ_z`; `a,b∈C` | `L_(σx)L_(σz)σ_z=σ_x`, `L_(σz)L_(σx)σ_z=0`, `P` commute; `TT*=T*T` from the formula | holds; matches source | none |
| §7.3 `seqProd_*` | `ℝ`; `p=diag(1,0)`, `q=½[[1,1],[1,1]]`; `a=diag(1,¼)` | `3/8`; `p&q=p/2`, `q&p=q/2`; `a&q=[[½,¼],[¼,⅛]]`, `a∘q` off-diagonal `5/16` | holds | R01 (`sqrt`), C05 |

- Source locators checked against the text: 6 (Baez Theorem 1 and §§2.2–2.3; Lourenço Proposition 31; Westerbaan–Westerbaan–van de Wetering Proposition 36; van de Wetering Proposition 3.9, Theorem 4.2, Proposition 4.3).
- Library declarations opened at the pin: 9 found (`IsFormallyReal`, `Mathlib/Algebra/Ring/IsFormallyReal.lean` 105; `IsCommJordan`, `Mathlib/Algebra/Jordan/Basic.lean` 90; its `SymAlg` instance, `Mathlib/Algebra/Symmetrized.lean` 284; `ProperCone.innerDual`, `Mathlib/Analysis/Convex/Cone/InnerDual.lean` 55; `TauCeti.jordanInnerDerivation`; `TauCeti.DivisionOctonionReal`; `TauCeti.CayleyDickson` with its `Star`; `isEmbeddedLieSubgroup_of_isClosed`; `lieSubalgebraOfSubgroup`), 12 named and absent (R02).
- Cross-roadmap citations resolved on main: 7 (CompactQuantumMetricSpaces §0.1–0.3 with `IsOrderUnitNorm`, `stateSpace`; LieHighestWeight Layer 8; LieGroups Layer 2; VonNeumannAlgebras §12.J; CStarAlgebras C2.4), all found; the relative links resolve.
- Dependency check: `depcheck: 182 roadmaps, 2071 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (27, two of them on definitions). `#check @name` compared for all 43 declarations: the theorems keep all their binders; `sqrt` keeps none (R01); the predicates keep what their bodies use.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on a copy: closes none of the 25 theorems; no padding found.
- Automatic checks: the two real failures of substance are R01; the import failures are N01. No change outside the roadmap folder.
- Duplication: no other roadmap, on main or open, states Koecher–Vinberg, the classification, Hurwitz's theorem for composition algebras, effect algebras or the sequential product; the pinned libraries have none of them.

Overlap check: read QuantumFoundations, ExceptionalThetaCorrespondencesForG2, LieHighestWeight; QuantumFoundations §1.6 states the fundamental formula, Jordan inverse and positivity of `U_a` on the JB carrier of a Segal system, this roadmap on the finite-dimensional norm-free carrier (two carriers, each its own owner; C03); the octonions and the compact Albert algebra are owned by LieHighestWeight Layer 8 and consumed here; nothing shared with ExceptionalThetaCorrespondencesForG2.

Source independence: 7 passages compared with 4 sources, none shared; largest share Faraut–Korányi, 19 of 29 locators; contents not compared with Faraut–Korányi, whose text and table of contents could not be read.

Research link: Finite-dimensional case of the JB-algebra theory; the sequential-product layer states van de Wetering (2020), Proposition 3.9 and Theorem 4.2; Koecher's theorem as in Westerbaan–Westerbaan–van de Wetering (2019); faces of symmetric cones as used by Lourenço (2021). Rests on the README's references and the four texts read.

## Not verifiable

- Faraut–Korányi, *Analysis on Symmetric Cones* (all chapter citations, including the sampled §1.3, §2.2, §2.4, §2.5, §3.1, §3.2, §5.1–5.3, §6.1, §6.6): no legal copy found (publisher page refused).
- Jordan–von Neumann–Wigner 1934 (§6.4): the landing host is in no licence class; not read.
- McCrimmon (§3.1, §6.4), Foulis–Bennett (§7.1), Gudder–Greechie (§7.1): paywalled; cited by locator only.
- The Tau Ceti declarations of R02: absent at the pin, so their statements were not compared with what the README assumes.
- §4.1 and §4.2 rest on CompactQuantumMetricSpaces §0.1–0.3 only; the section names and the two declarations were found, the mathematics recomputed, no external source is cited for them.

## Source issues

- none

## For the human reviewers

- **Pin.** The README cites four Tau Ceti modules (`Algebra/Jordan/Basic`, `Peirce`, `TraceForm`, `AlbertAlgebra/Compact`) absent at the pinned commit `2fd255d`; the description says they are merged upstream. Whether to advance the pin before this merges is yours.
- **Not tested.** Faraut–Korányi carries 19 of 29 locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it. The layers put cones (its Chapter I) fifth.
- **Licence.** `README.md` "Provenance" names two formalizations to "reuse where their licences and authors allow": `euclidean-jordan` (the pull request's author) and `jordanalgebra` (Ammar Husain). Their licences were not read; `Suggested.lean` was not compared with either.
- **Ownership.** QuantumFoundations §1.6 (open) and this roadmap both state the fundamental formula and Jordan inverses, on different carriers (C03). Whether one should cite the other once both are on main is a design decision.
