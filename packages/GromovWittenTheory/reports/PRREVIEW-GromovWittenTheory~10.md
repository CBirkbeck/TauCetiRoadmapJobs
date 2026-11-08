# Review of GromovWittenTheory (pull request #1998 at c41b144)

**Verdict:** needs changes

:robot: Independent AI review, full. Scope: `TauCetiRoadmap/GromovWittenTheory/` at `c41b1445d79ceca80e739d7483ab9313fc44a4ea`. Nothing outside the folder changed. The gate **fails** (`tex=34`, `target-ids=1`). The dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

The earlier reviews of this folder (r1–r9) read pull request #990, which is a different roadmap (Gromov–Witten theory of closed symplectic manifolds) under the same folder name. That clash is R02.

## R01 (P1) — The GW class with cotangent classes from `M̄_{g,n}` gives ancestors, not descendants

**Location:** `README.md:309–310`: “Prove that taking its degree after multiplying by monomials in cotangent classes recovers the descendant invariant.”

**Claim:** In `CH^*(Mbar g n)`, the cotangent classes are `ψ̄_i`. Their pullbacks `st^*ψ̄_i` differ from the stable-map classes `ψ_i` of line 291 by boundary corrections. So `deg(ψ̄^a · st_*(…))` is the ancestor invariant. The README's own conventions (lines 97–99) make the same distinction.

**Witness:** On `ℙ¹` with `β` = line, the string equation gives `⟨τ₁(pt)τ₀(pt)τ₀(1)⟩_{0,1} = ⟨pt,pt⟩_{0,1} = 1`. `M̄_{0,3}` is a point, so `ψ̄₁ = 0` and the GW-class route gives `0` (Kontsevich–Manin 1998, Theorem 1.2, p. 2).

**Repair:**
- Replace the sentence with: “With the monomial `∏ st^*ψ̄_i^(e_i)` it recovers the ancestor invariant; with the trivial monomial it recovers the primary invariant.”
- If descendants are wanted from GW classes, add the comparison `ψ_i = st^*ψ̄_i + [D_i]` as its own target, where `D_i` is the virtual boundary locus on which marking `i` lies on a component that `st` contracts (Kontsevich–Manin 1998, Theorem 1.2).
- Add the `ℙ¹` instance as a negative-control Check: descendant 1, ancestor 0.

## R02 (P2) — Pull request #990 owns the same roadmap name and folder

**Location:** `metadata.toml`, `README.md`, and `Suggested.lean:70` (`namespace TauCetiRoadmap.GromovWittenTheory`).

**Claim:** Pull request #990 adds a different roadmap under the same folder and namespace. Whichever pull request merges first, the second one overwrites it. The merge order's `GromovWittenTheory` (line 305) is #990's roadmap: it sits after its suppliers ImplicitAtlases (213), AnalyticStableMaps (214) and FukayaTheory (223). The description of #1998 does not mention #990.

**Witness:** The board's overlap index of open pull requests reports that #990 and #1998 conflict in all three files. #990's README at `0194363`, line 2: “Roadmap: Gromov–Witten theory of closed symplectic manifolds”.

**Repair:**
- Give this roadmap its own name, for example `AlgebraicGromovWittenTheory`: the folder, `metadata.toml`, and the `Suggested.lean` namespace.
- In Scope and ownership, add one sentence: the symplectic invariants and their quantum product are GromovWittenTheory's (cited by name), and neither roadmap plans the other's invariants.

## R03 (P2) — Layer 0 re-plans numerical Chow, and the claim that it avoids a Weil cohomology is false

**Location:**
- `README.md:17–20`: “this is finite-dimensional and its intersection pairing is perfect by definition … This choice avoids assuming an unbuilt Weil cohomology theory”.
- `README.md:167–174`, Layer 0 bullets 1–2.

**Claim:** MotivesAndAlgebraicCycles already owns these objects, and it is earlier in the merge order (line 89):
- §0.5 defines `NumTrivial` as the kernel of all complementary intersection pairings and proves adequacy and rational ⊆ numerical.
- §3.1 proves that `CH_num^j(X)_ℚ` is finite-dimensional “by its pairing quotient and a geometric Weil cohomology bound”.

Layer 0 restates both without a route. Finite dimensionality is exactly what turns “nondegenerate” into “perfect”.

**Witness:** On `ℚ^(ℕ)`, the standard pairing is nondegenerate but not perfect: the coordinate-sum functional is not representable. MotivesAndAlgebraicCycles §3.1 uses a Weil cohomology for finiteness.

**Repair:**
- Delete the construction of numerical equivalence and the finite-dimensionality target from Layer 0. Cite MotivesAndAlgebraicCycles §0.5 and §3.1 in the supplier contracts, and set `H_X := CH_num^*(X)_ℚ`.
- Keep the grading, the perfect pairing (a corollary of §3.1) and the insertion-descent lemma.
- Rewrite lines 17–20: finite dimensionality comes through a Weil cohomology (MotivesAndAlgebraicCycles §3.1); what this roadmap avoids is comparing quantum products with any Weil cohomology.

## R04 (P2) — Layers 0–1 re-plan numerical divisor classes and curve cones, and the finiteness route omits Kleiman's criterion

**Location:**
- `README.md:175–178`: “Define the numerical first Chern class …, the lattice of numerical divisor classes, the numerical class of an integral curve, and the effective monoid `NE(X)`”.
- `README.md:186–189`: “Prove positivity on nonzero effective classes and finiteness … through … the compact slice of the closed effective cone”.

**Claim:** AlgebraicModuliForArithmeticGeometryPartII (merge order 258) already owns these:
- §1.1: `Num(X/k)`.
- §1.2: `Num(X/k)` is free of finite rank.
- §1.4: `N₁`, `NE` and its closure.
- §1.7(iii), Kleiman's criterion: A is ample iff `A·z > 0` for every nonzero `z ∈ NE‾`.

Compactness of `{x ∈ NE‾ : A·x ≤ B}` needs positivity on the closure. Positivity on effective classes, which is all the README states, does not give it.

**Witness:** In `ℝ²` with lattice `ℤ²`, take the cone generated by `(1,m)` for `m ≥ 0`, and `A = (1,0)`. Then `A` is positive on every nonzero effective class, `A·(0,1) = 0` on the closure, and `A·β ≤ 1` holds for every `(1,m)`: infinitely many classes.

**Repair:**
- Cite AlgebraicModuliForArithmeticGeometryPartII §§1.1, 1.2 and 1.4 for the numerical groups and the cone.
- Define `N₁(X)_ℤ` and `NE(X)` as the integral image and the effective monoid inside its `N₁(X/k)`, saying in one clause how they differ from it.
- In the finiteness proof, replace “positivity on nonzero effective classes” with “positivity of `A` on `NE‾(X)∖{0}` (§1.7(iii))”.
- Add the `ℝ²` cone as a negative-control Check.

## R05 (P2) — Layer 1 re-plans Tau Ceti's Novikov series, which is at the pin

**Location:**
- `README.md:190–199`: “Define the completed monoid algebra … Construct addition, convolution multiplication, the valuation filtration, topology, and completeness.”
- `README.md:204`: the derivations `δ_D`.
- `README.md:143–144`: the suppliers do not provide “Novikov completions”.
- `Suggested.lean:11–12`: “Novikov … types do not exist at the repository pins”.

**Claim:** `Λ_X` (lines 193–194) is exactly Tau Ceti's `TauCeti.NovikovSeries ℚ NE(X) ω_A`. It has the carrier, ring structure, topology, completeness and the degree derivation.

**Witness:** In `TauCeti/RingTheory/NovikovSeries/` at `2fd255d`: `NovikovSeries` (Basic.lean:92), `instCommRing` (Multiplication.lean:435), `single_mul_single` (:181), `periodFiltration` (Topology.lean:93), `CompleteSpace` (:263), `degreeDerivation` (Derivation.lean:70).

**Repair:**
- Set `Λ_X := TauCeti.NovikovSeries ℚ NE(X) ω_A` and `δ_D := NovikovSeries.degreeDerivation (D·−)`.
- Delete the targets that rebuild addition, convolution, filtration, topology, completeness and `δ_D`.
- Keep the `A`-independence and `R_X`.
- Add a `From Tau Ceti` contract naming these declarations, together with `IsTopologicalRing` (TopologicalRing.lean:157) and `continuous_degreeDerivation` (Derivation.lean:135).
- Correct README:143–144 and Suggested.lean:11–12.

## R06 (P2) — Layer 2 re-plans `M̄_{g,n}`, clutching and cotangent lines, which already have owners

**Location:** `README.md:215–228`: “construct the open substack `Mbar g n` … proper smooth Deligne–Mumford … forgetting … external clutching, and self-clutching … Prove the pullback formula for cotangent-line classes”.

**Claim:** The objects already have owners:
- SchemeAndStackFoundations §4.15 (on main): `StableCurves.Mbar g n`, `Mbar.algebraicFiniteTypeDM`, `Mbar.dvrLifting`, `Mbar.forget`, and smoothness of relative dimension `3g−3+n`.
- StableReductionPartII Layer 3: §3.1 and §3.2 (separating and nonseparating clutching), §3.3 (`Lᵢ = sᵢ^*ω`), and §3.11 (`π^*Lᵢ = Lᵢ ⊗ O(−D_{i,n+1})`).

**Witness:** StableReductionPartII §3.11 gives, on `M̄_{0,4} → M̄_{0,3}`, `ψ₁ = π^*ψ₁ + D₁₄`, so `∫ψ₁ = 0 + 1 = 1`. This is exactly line 226's target, already stated there.

**Repair:**
- Cite these sections and delete the duplicated bullets.
- Keep `Mpre g n`: no owner was found for the Artin stack of prestable curves.
- Keep the stabilization `Mpre → Mbar` (Behrend 1997, Proposition 3, p. 4, which proves flatness).
- Citing StableReductionPartII places this roadmap after merge-order line 314.

## R07 (P2) — Layer 9 names no ring for the fundamental solution, and `M_X` cannot contain it

**Location:** `README.md:410` (“Let `M_X = H_X ⊗ R_X((z))`”) and `README.md:428–431` (“prove existence and uniqueness of a formal fundamental solution”).

**Claim:** A fundamental solution has unboundedly many negative powers of `z`. It is not in `End(H_X) ⊗ R_X((z))`, the only ring the layer defines.

**Witness:** For the point (line 464, `∂_t + z⁻¹`), the solution is `L = exp(−t/z) = Σ_m (−t)^m z^(−m)/m!`, which is not in `ℚ⟦t⟧((z))`. Iritani 2008, §2.3, p. 8, places `L` in `End(H) ⊗ K{{ℏ⁻¹}}⟦Q,t⟧`.

**Repair:**
- State the target as follows. There is a unique `L` with:
  - `L ∈ End(H_X) ⊗̂ R_X[z⁻¹]`, the `(Q,t)`-adic completion, in which each coefficient of `Q^β t^m` is a polynomial in `z⁻¹`;
  - `L ≡ id` modulo `(Q, t)`;
  - `z∂_a L + C_a ∘ L = 0`.
- Add the point case `L = exp(−t/z)` as a Check.

## R08 (P2) — The “converse local calculation” is false as worded

**Location:** `README.md:422–423`: “vanishing of the `z⁻²` coefficient on the unit recovers associativity.”

**Claim:** Evaluated at the unit, `[C_a,C_b](1) = T_a⋆T_b − T_b⋆T_a`. This vanishes for every potential, because third derivatives are symmetric, so it cannot detect associativity.

**Witness:** Basis `1, T₁, T₂`, `g₀₂ = g₁₁ = 1`, `F = ½(t⁰)²t² + ½t⁰(t¹)² + (t²)⁴/24`: `T₁⋆T₁ = T₂`, `T₁⋆T₂ = 0`, `T₂⋆T₂ = t²`. So `[C_a,C_b](1) = 0`, yet `(T₁⋆T₁)⋆T₂ = t² ≠ 0 = T₁⋆(T₁⋆T₂)`.

**Repair:**
- Restate: given commutativity and the unit, `⋆_t` is associative iff `[C_a,C_b] = 0` as an operator, that is, on every `T_c`.
- Add this potential as a negative-control Check: `[C₁,C₂](T₁) = −t²·1`.

## R09 (P2) — The “Products” comparison is promised without the Künneth hypothesis that numerical Chow lacks

**Location:** `README.md:474–476`: “Compare the stable-map virtual product formula and the completed tensor product of quantum rings when curve classes and Novikov coefficients are matched.”

**Claim:** `QH(X×Y) ≅ QH(X) ⊗̂ QH(Y)` needs `N^*(X)⊗N^*(Y) ≅ N^*(X×Y)`. Lines 86–88 of the README say numerical Chow does not have this in general. Without it, curve classes cannot be matched.

**Witness:** Let `E` be an elliptic curve without CM. Then `ρ(E×E) = 3` (AlgebraicModuliForArithmeticGeometryPartII §1.2 Check), so `dim N^*(E×E)_ℚ = 5`, while `dim N^*(E)^⊗2 = 4`. Also `rank N₁(E×E) = 3`, while `rank N₁(E)⊕N₁(E) = 2`.

**Repair:**
- Make this a named Layer 8 target. Hypothesis: the exterior product `N^*(X)_ℚ⊗N^*(Y)_ℚ → N^*(X×Y)_ℚ` is bijective, which forces `NE(X×Y) = NE(X)×NE(Y)` and `Λ_{X×Y} ≅ Λ_X⊗̂Λ_Y`. Conclusion: the small quantum rings are isomorphic.
- Add Checks: `ℙ¹×ℙ¹` gives `Λ[H₁,H₂]/(H₁²−Q₁, H₂²−Q₂)`; `E×E` is the negative control.

## R10 (P3) — The gate fails `tex` on 34 hits inside list-item code blocks

**Location:** `README.md` lines 193, 297–298, 321–322, 331–333, 352, 363–364 and 394–395. All are inside the fences that are indented two spaces in list items (lines 192–195, 296–299, 320–323, 330–334, 351–353, 362–365, 393–398).

**Claim:** The scanner does not read indented fences as code blocks, so `_{…}` and `^{…}` count as TeX. The 34 hits are exactly these.

**Witness:** Gate rerun at this head: `tex=34 … FAIL`, for example line 193: “Λ_X = { Σ_{β∈NE(X)} a_β Q^β |”. A count of `_{` and `^{` inside the indented fences gives 34.

**Repair:**
- In these blocks, write parenthesised indices instead: `Σ_(β∈NE(X))`, `τ_(a₁)`, `⟨…⟩_(g,β)`, `ψ_i^(a_i)`, `F_(abe) g^(ef)`.
- Rerun the gate.

## R11 (P3) — The README is not in TauCetiRoadmap form (gate `target-ids`)

**Location:**
- The whole README.
- Gate: “line 165: layered README states no targets”.
- Lines 139, 483, 493–494, 497–500: “Inventory: what remains to build”, “Ordering and work packages”, “may be registered as complete”, “Implementation issues should claim a precise layer”.

**Claim:**
- Missing headings: `**Summary.**`, `## Scope and ownership`, `## Conventions`, `## How to read the build`, `## Downstream consumers`.
- No `### k.n` targets.
- Zero `**Checks.**` lists and zero `*Needs:*` lines.
- No per-layer `### Examples` or `### Dependencies`.
- The cited lines are process narrative.

**Witness:** In README.md, `grep -c '\*\*Checks'` gives `0` and `grep -c '\*Needs:\*'` gives `0`. The gate rerun reports `target-ids=1`.

**Repair:**
- Restructure on the shape of roadmaps on main:
  - Move “Boundary of this roadmap” and the deferrals of R03–R06 into Scope and ownership.
  - Make each layer bullet a `### k.n` with its hypotheses, a locator and a `*Needs:*` line.
- Give each definition (`H_X`, `Λ_X`, `R_X`, `MbarMap`, `ψ_i`, the correlator, `F₀`, `⋆small`, `⋆_t`, `∇`, the `D`-modules) at least three Checks. The values in the table below are ready to use: `⟨pt,pt⟩_(0,1)^(ℙ¹) = 1`, `N₂ = 1` and `N₃ = 12` for `ℙ²`, and `⟨τ₁⟩_(1,0) = 1/24` for the point.
- Delete the process sentences.

## R12 (P3) — No target has a locator, including all 15 sampled targets

**Location:** The whole README. It contains no theorem, section or page reference, and the References (lines 520–548) give papers only.

**Claim:** Every target needs a locator. None of the sampled bullets has one: lines 224, 232, 235, 240, 303, 311, 317, 328, 343, 386, 389, 410, 465, 471 and 474.

**Witness:** `grep -n -E 'Theorem|Proposition|Lemma|§|p\. [0-9]' README.md` returns nothing.

**Repair:** Add locators. These were checked in this review:
- Behrend 1997:
  - Introduction, p. 2, and Proposition 2, p. 3: `𝔐_{g,n}` is smooth of dimension `3g−3+n`.
  - Proposition 3, p. 4: stabilization is flat.
  - p. 5: relative rank `χ(f^*T_V)`.
  - Proposition 5, p. 6: global resolutions.
- Behrend–Manin, Theorem 3.14, p. 25 (proof in Corollary 4.8): `MbarMap` is proper DM.
- Kontsevich–Manin 1998, Corollary 1.3, p. 3: genus-zero topological recursion.
- Fulton–Pandharipande:
  - (48)–(49) and Theorem 4, p. 37: product from third derivatives and associativity, there for homogeneous `X`.
  - §10, p. 48: `QH_s(ℙ^r) = ℤ[T,q]/(T^(r+1)−q)`.
- Iritani 2008:
  - Definition 2.2, p. 7: connection sign and quantum `D`-module.
  - Proposition 2.3, p. 8: fundamental solution, unitarity and the divisor equation.

## R13 (P3) — The supplier contracts name no sections or declarations, misplace the valuative interface, and omit Tau Ceti

**Location:** `README.md:112–137` and `README.md:240–243`.

**Claim:**
1. VirtualFundamentalClass, SchemeAndStackFoundations, AlgebraicVectorBundles, DerivedModuleAlgebra and EnhancedDerivedSheaves are cited without sections. VirtualFundamentalClass, for example, has Layers 2, 6, 7, 8 and 9, which are the parts consumed.
2. The valuative interface is in StableReduction Layer 9, not Layers 10–11, and it is for pointed curves. StableReduction's “Boundary: moduli spaces and properness” leaves extending a generic stable map to the next roadmap.
3. There is no `From Tau Ceti` section.
4. “Mathlib supplies … connections” is false for the Mathlib pin.

**Witness:** At the pins:
- Tau Ceti has `PrestableMap` (Curves/StableMaps/Basic.lean:73), `ev` (:88), `degree` (Curves/StableMaps/Degree.lean:95), `Chow.ChowGroup` (Chow/Basic.lean:295) and `LineBundleClass.IsAmple` (LineBundle/Ample.lean:71).
- Mathlib has only `CovariantDerivative` on manifolds.

**Repair:**
- Cite each supplier by section.
- State the existence and uniqueness of stable-map limits after finite DVR extension as a Layer 3 target (Behrend–Manin, Theorem 3.14 and Corollary 4.8). It consumes StableReduction Layer 9 and Layer 11's stabilization.
- Add the Tau Ceti declarations above.
- Name the Mathlib declarations actually used, such as `Derivation` and `MvPowerSeries`.

## R14 (P3) — The Suggested.lean docstring is a catalogue of pseudo-signatures with a false claim

**Location:**
- `Suggested.lean:15–62`: a fenced block of commented `def` and `theorem` lines on invented carriers (`SmoothProjectiveVariety`, `EffectiveNumericalCurveClass`, `BigQuantumBase`, `QuantumReesDifferentialOperators`).
- Lines 7–9: “suggest Lean forms for a few public milestones”.
- Line 72: “No compiled targets yet”.

**Claim:** The docstring should list each headline theorem and the carrier it lacks. Instead it gives a catalogue of names, misstates the file's role, says Novikov types are missing (R05), and has a process comment.

**Witness:**
- At the pin, `TauCeti.NovikovSeries` exists, and `Chow.ChowGroup` exists for schemes.
- Mathlib's `AlgebraicGeometry` has no algebraic stacks, so the six end goals are indeed not statable.

**Repair:** Rewrite the module docstring as “Algebraic Gromov–Witten theory and quantum cohomology: target signatures”. It should say:
- README.md is the roadmap, and this file states the headline theorems that are statable at the pins.
- For each of the six end goals, the missing carrier: algebraic stacks and the stable-map stack; Chow groups of DM stacks and virtual classes; the numerical Chow ring; hence the GW invariants, products and connections.

Then delete lines 15–62 and line 72.

## Previous findings

The previous review (r9) read pull request #990 at `0194363`, which is another roadmap in this folder. Its findings concern text that does not exist at this head:
- **r9 R01** (manifest pins Tau Ceti `a91d3aa`): does not arise here. `lake-manifest.json` pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, and the toolchain is `v4.36.0-rc2`. The passage it quoted (“### From Tau Ceti (commit 2fd255d)”) is not in this README.
- **r9 R02**: already repaired in #990. Its passages (`NovikovModule.gradeBy`, §0.2) are not in this README.
- r9's remark about the folder conflict with #1998 is now R02.

## Verified sound

**Gate, build and order.**
- Gate rerun at `c41b144`: every field 0 except `tex=34` and `target-ids=1` (R10, R11).
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds only README.md, Suggested.lean and metadata.toml.
- Dependency check with `--movable`: `depcheck: 238 roadmaps, 2344 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- `lake env lean` on Suggested.lean exits 0 with no output (21 s).
- Suggested.lean declares nothing, so neither the `#check` comparison nor the one-tactic padding probe has a subject. It has no sorry'd data and no `set_option`.
- No headline is statable at the pins, which confirms that stating nothing is correct (R14 concerns only the docstring).

**Library declarations opened at the pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`): 19.**
- NovikovSeries: Basic.lean:92 (`[AddZeroClass H]`); Multiplication.lean:181 and :435 (CommRing when `[AddCommMonoid H]`); Topology.lean:93, :176, :263; TopologicalRing.lean:157, :245; Derivation.lean:70, :135; Equiv.lean:55, :139, :192.
- Curves/StableMaps/Basic.lean:73, :88; Degree.lean:95; Chow/Basic.lean:295; LineBundle/Ample.lean:71; IntersectionNumber/Basic.lean:111.
- Mathlib: no algebraic stacks in `AlgebraicGeometry`, and no module connection.

**Cross-roadmap citations resolved, in 7 roadmaps:**
- StableReduction Layers 9–11 (main, lines 699–843 and 927–942).
- SchemeAndStackFoundations §4.15 (main, line 5725).
- VirtualFundamentalClass at #1996 head `8a54d41`: Layers 0–9. It does not cite this roadmap, so there is no cycle.
- MotivesAndAlgebraicCycles §0.5 and §3.1 (#1313).
- AlgebraicModuliForArithmeticGeometryPartII §§1.1, 1.2, 1.4, 1.7 (#1754).
- StableReductionPartII §§3.1–3.3 and 3.11 (#1841).
- GromovWittenTheory at #990 (scope).

**Ownership searches** (`roadmaps grep`):
- “WDVV”, “Dubrovin” and “Frobenius manifold” occur only here.
- “quantum cohomology” elsewhere means the symplectic product (#990) and DGFloer.
- No owner of the Artin stack of prestable curves was found.
- AnalyticStableMaps (#987) is analytic, a different carrier.
- No id this README cites is dropped by an open pull request.

**Adversarial table.** The table covers the 15 sampled bullets (S), the six end goals (H) and the finding targets. Coefficients are ℚ.

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| H1 vdim `(1−g)(d−3)+n+c₁·β` (49, 275) | point, `g=1,n=1`; `ℙ¹`, `g=0,n=0,β=1`; `ℙ²`, line, `n=0` | `1 = dim M̄_{1,1}`; `0 =` dim of {identity}; `2 =` dim of the lines in `ℙ²` | sound |
| H1 rank `d(1−g)+c₁·β` (257) | `ℙ¹`, `g=0`, `β=1` | `1+2 = 3 = h⁰(T_ℙ¹)`, `h¹=0`; Behrend p. 5: `χ(f^*T_V)` | sound |
| GW-class codimension `c+d(g−1)−c₁β` (309) | `ℙ¹`, `g=0,n=3,β=1`, insertions pt, pt, 1 | `2−1−2 = −1`: class of dimension 1 on a point, so 0 | sound |
| GW class with ψ̄ gives descendants (310) | `ℙ¹`, `⟨τ₁(pt)τ₀(pt)τ₀(1)⟩_{0,1}` | descendant `1` (string; KM98 (4a): `1·1+0`) / ancestor `0` | R01 |
| S5 insertions factor through `≡_num` (303) | `E`, `γ=[p]−[q]`; `⟨γ,1,1⟩_{0,0}`; `⟨γ⟩_{1,[E]}` | `deg γ = 0`; vdim 1, `ev_*vir ∈ ℚ[E]`, `deg(γ·[E]) = 0` | sound |
| S6 degree zero (311) | `⟨a,b,c⟩_{0,0}`, `⟨a,b,c,d⟩_{0,0}` | `∫abc` / 0, since the fibre `M̄_{0,4}` has dimension 1 | sound |
| S7 string (321–322) | `ℙ¹`, `⟨1,τ₁(pt),pt⟩_{0,1}`; `(0,3,0)` | `⟨pt,pt⟩_{0,1} = 1` both sides; `∫ab` vs RHS 0, stated separately | sound |
| S8 divisor (331–333) | `ℙ¹`, `⟨H,pt,pt⟩_{0,1}`; `β=0, n=2` | `(H·β)·1 = 1` both sides; `∫Dab` vs 0, covered by lines 92–96 | sound |
| H2 dilaton (327) | point `⟨τ₁τ₀³⟩_{0,0}`; `ℙ¹` `⟨τ₁(1)pt pt⟩_{0,1}`; `⟨τ₁⟩_{1,0}` | `∫_{M̄_{0,4}}ψ₁ = 1 = (−2+3)·1`; `0 = 0·1` (KM98 (4a): both terms 0); `1/24`, an exception | sound |
| S9 genus-0 TRR (343) | `ℙ¹`, `⟨τ₁(pt) pt 1⟩_{0,1}` | KM98 (4a): `β₁=1`: `⟨pt,pt⟩·⟨1,pt,1⟩_{0,0} = 1`; `β₁=0`: `0`; total 1 = string value | sound |
| S1 ψ pullback (226) | `M̄_{0,4} → M̄_{0,3}` | `ψ₁ = 0 + D₁₄`, `∫ψ₁ = 1` | sound; R06 (owned) |
| H3 WDVV (363–364) | `ℙ²`, Kontsevich recursion | `N₂ = 2−1 = 1`; `N₃ = 0 + (20−8) = 12` | sound |
| S10 small associativity (386) | `ℙ²`: `H⋆H=H²`, `H⋆H²=Q`, `H²⋆H²=QH` | `(H⋆H)⋆H² = QH` / `H⋆(H⋆H²) = QH` | sound |
| H4 unit and `Q=0` (385, 387) | `1⋆b`, `β≠0` | `ev₃*π^*(…) = 0` since `π_*π^* = 0` (fibre dimension 1); `Q⁰` term `a·b` | sound |
| S11 big product (394–397) | marking count | `∂_a∂_b∂_c F₀ = Σ Q^β/n! ⟨T_a,T_b,T_c,t^n⟩` / `(T_a⋆T_b,T_c)` with `n+3` markings; FP (48)–(49) | sound |
| H5 point (461–464) | `X = Spec k` | `F₀ = (t⁰)³/6`, `1⋆1 = 1`, `∇ = ∂_t + z⁻¹` | sound |
| S12 / H6 curvature (416–421) | general; Leibniz | `z⁻¹(∂_aC_b−∂_bC_a) + z⁻²[C_a,C_b]`; `∂_aC_b = F_{abce}g^{ef}`, symmetric | sound |
| Fundamental solution (428–431) | point | `exp(−t/z)` has `z^(−m)` for all `m` / not in `ℚ⟦t⟧((z))` | R07 |
| Converse (422–423) | `F = ½t₀²t₂ + ½t₀t₁² + t₂⁴/24` | `[C_a,C_b](1) = 0` / `(T₁⋆T₁)⋆T₂ = t₂ ≠ 0` | R08 |
| Pairing `S` (425–426) | general | extra terms `z⁻¹[(s₁,C_a s₂) − (C_a s₁,s₂)] = 0` by Frobenius; Iritani Prop. 2.3(iii) | sound |
| Small connection flatness (449–451) | `δ_Dδ_E`, `z⁻¹` term | `(D·β)(E·β)Q^β`, symmetric; `(D·β)⟨E,b,c⟩_β = ⟨D,E,b,c⟩_β`, symmetric | sound |
| S13 class zero (465) | `MbarMap_{0,3}(X,0) = X` | `⟨a,b,c⟩_{0,0} = deg(abc)` | sound |
| S14 `ℙ^r` (471–472) | 3-point line invariants | vdim `(r−3)+3+(r+1) = 2r+1`; `⟨H^a,H^b,H^c⟩_{0,1} = 1` iff `a+b+c = 2r+1`; `deg Q = 2(r+1) = deg H^{r+1}`; FP §10 p. 48 | sound |
| S15 products (474–476) | `E×E`, `E` without CM | `dim N^*` 5 / 4; `rank N₁` 3 / 2 | R09 |
| Λ_X (193–194) | `ω_A ≥ 0`, `{ω_A < C}` finite | every coefficient function qualifies, equal to `NovikovSeries ℚ NE(X) ω_A` | sound; R05 |
| Finiteness of `{A·β ≤ B}` (186–189) | cone `(1,m)`, `A = (1,0)` | positive on effective / zero on the closure: infinite slice | R04 |
| Perfect pairing (17–18, 173–174) | `ℚ^(ℕ)` | nondegenerate / not perfect | R03 |
| S2–S4 stack, boundedness, properness (232–243) | `ℙ¹` degree; `L = ω(Σx)⊗f^*M^{⊗3}` | locally constant `deg f^*O(1)`; ample on fibres (Behrend Prop. 5, p. 6); proper DM (BM Thm 3.14) | sound; R13 (locator) |

## Not verifiable

- Fulton, *Intersection Theory* (README:547) is a book that is not openly available. It was not read, and nothing here depends on it.
- Dubrovin, hep-th/9407018, was not fetched. Flatness was computed directly (table).
- Kontsevich–Manin 1994 and Behrend–Fantechi were fetched but not needed beyond the cited locators. The sample's statements were checked in Behrend 1997, Behrend–Manin, Fulton–Pandharipande, Kontsevich–Manin 1998 and Iritani.
- No manifest was edited. The texts were fetched into the sources cache through a working copy of the manifest.

## Source issues

- **Misprint** in Kontsevich–Manin 1998 (arXiv alg-geom/9708024v1) at §1.1, p. 2: the stable range is written with `2g − 2 − n > 0`; it should be `2g − 2 + n > 0`, as in Theorem 1.2 on the same page; affects nothing.
