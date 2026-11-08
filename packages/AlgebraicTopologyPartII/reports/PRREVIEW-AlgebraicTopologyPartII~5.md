# Review of AlgebraicTopologyPartII (pull request #1694 at ca3704e)

**Verdict:** needs changes

The gate passes, `Suggested.lean` elaborates with `sorry` as the only warning, and the dependency check reports no problem. One P2 blocks: a headline that the module docstring calls not statable is statable at the pins. Four P3 findings follow.

**Previous review (at 8f6c413), finding by finding:**

- **R01 (P3), gap `configuration-cover-comparison` differs from the plan: not repaired.** README line 130 still reads "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4." No repair report marks it not actionable. It is R02 below.
- **R02 (P3), stale "Section 12.3": repaired.** Line 405 now reads "Section 12.1 identifies the supplied tangent class with the real self-intersection γ". A scan of every internal "§k.n" and "Section k.n" reference finds no id without a heading (62 headings).
- **R03 (P3), gap paragraph runs on: repaired.** Line 153 is blank, so the gap sentence of line 152 ends its paragraph and "The coordinatewise plane/interior-disc identification …" (line 154) is ordinary contract prose.

The head also re-adds §§16.1a–16.1e and eleven declarations for them. StratifiedSpacesAndTameTopology, the roadmap the previous head cited for this material, is on this brief's list of roadmaps never to cite as suppliers. So the material moves down into this roadmap; this is recorded under Verified sound. The findings below concern how it was added.

## R01 (P2) — Equivariant Ehresmann (§16.1) is statable at the pins but absent; the docstring's reason is false

**Location.** `TauCetiRoadmap/AlgebraicTopologyPartII/Suggested.lean` lines 36–37: "Equivariant Ehresmann lacks the suppliers' regular-level smooth-fibre carrier and its smooth local trivialization data". The theorem is README §16.1, line 1523.

**Claim.** No pinned carrier exists for the smooth fibre of a submersion or for a smooth local trivialization, so §16.1 cannot be stated.

**Witness.** Tau Ceti has `TauCeti.regularFiberChartedSpace` (`TauCeti/Geometry/Manifold/RegularValue/ManifoldLevel.lean:198`), with `isManifold_regularFiber` (line 215). Together with `Bundle.Trivialization` and `ContMDiffOn`, the statement below elaborates, with `sorry` as the only warning.

**Repair.** Add `public import TauCeti.Geometry.Manifold.RegularValue.ManifoldLevel` and state §16.1 in the Layer 16 section, for example:

```lean
theorem equivariantEhresmannTransport {m n : ℕ}
    {M : Type*} [TopologicalSpace M] [ChartedSpace (EuclideanSpace ℝ (Fin n)) M]
    [IsManifold (𝓡 n) ∞ M] [T2Space M] [SecondCountableTopology M]
    {B : Type*} [TopologicalSpace B] [ChartedSpace (EuclideanSpace ℝ (Fin m)) B]
    [IsManifold (𝓡 m) ∞ B] [T2Space B] [SecondCountableTopology B]
    {f : M → B} (hf : ContMDiff (𝓡 n) (𝓡 m) ∞ f)
    (hreg : ∀ c, TauCeti.IsRegularValue (𝓡 n) (𝓡 m) f c) (hp : IsProperMap f)
    {σM : M → M} {σB : B → B} (hσM : ContMDiff (𝓡 n) (𝓡 n) ∞ σM)
    (hσB : ContMDiff (𝓡 m) (𝓡 m) ∞ σB) (hσM2 : ∀ x, σM (σM x) = x)
    (hσB2 : ∀ c, σB (σB c) = c) (hfσ : ∀ x, f (σM x) = σB (f x)) (b : B) (hb : σB b = b) :
    letI := TauCeti.regularFiberChartedSpace (m := ∞) (by simp) hf
      BoundarylessManifold.isInteriorPoint (hreg b)
    ∃ e : Bundle.Trivialization {x : M // f x = b} f, b ∈ e.baseSet ∧
      σB ⁻¹' e.baseSet = e.baseSet ∧
      ContMDiffOn (𝓡 n) ((𝓡 m).prod 𝓘(ℝ, Fin (Module.finrank ℝ (EuclideanSpace ℝ (Fin n)) -
          Module.finrank ℝ (EuclideanSpace ℝ (Fin m))) → ℝ)) ∞ e e.source ∧
      ContMDiffOn ((𝓡 m).prod 𝓘(ℝ, Fin (Module.finrank ℝ (EuclideanSpace ℝ (Fin n)) -
          Module.finrank ℝ (EuclideanSpace ℝ (Fin m))) → ℝ)) (𝓡 n) ∞
        e.toOpenPartialHomeomorph.symm e.target ∧
      ∀ x ∈ e.source, ((e (σM x)).2 : M) = σM (e x).2 := by
  sorry
```

Then:
- Drop the Ehresmann clause from the docstring bullet.
- Name the theorem in README §16.1.

If §16.1 is not meant as a headline, the docstring clause must still go, because its claim is false at the pin.

**Test.** The statement above, in a scratch file importing `Mathlib` and that module, elaborates under `lake env lean` with only `declaration uses 'sorry'`. Instances: an empty fibre (b outside the closed image f(M)) gives empty `e.source`. With σB=id on the base set, the last clause makes each fibre map commute with σM.

## R02 (P3) — Gap `configuration-cover-comparison` still differs from the plan (previous R01, not repaired)

**Location.** `README.md` line 130: "Expose §§3.5–3.7 on the ordered-root S_m torsor … compatible in one comparison diagram with InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–IG.0.T4."

**Claim.** This sentence is the declared gap contract.

**Witness.** In `packages/AlgebraicTopologyPartII/design/plan.json` the slug has section "3.5–3.8 and 6.5", and its `needs` begins "Expose §§3.5–3.8 and §6.5 …" and ends "… compatible in one comparison diagram." The other 13 gap sentences equal the plan's.

**Repair.**
1. Replace the sentence after "(gap:configuration-cover-comparison): " with the plan's `needs` verbatim.
2. Keep the IG.0.T2–T4 compatibility as ordinary prose in a separate paragraph; line 128 already says it.

Both sections exist at the supplier's head: §3.8 at line 3627, §6.5 at line 6935.

**Test.** The README-versus-plan comparison then reports 14 of 14 equal.

## R03 (P3) — `IsSmoothStratification` lost its manifold binder and accepts non-manifold strata

**Location.** `Suggested.lean` lines 252–257. The docstring reads "each stratum is the image of a topological embedding `incl i` of a nonempty manifold `S i` modelled on `EuclideanSpace ℝ (Fin (d i))`". The declaration is `structure IsSmoothStratification (incl : ∀ i, S i → X) : Prop`. README line 1538 says the same.

**Claim.** The predicate describes strata that are manifolds of dimension d_i.

**Witness.** The elaborated type is `{X} → [TopologicalSpace X] → {ι} → {S} → [∀ i, TopologicalSpace (S i)] → (∀ i, S i → X) → Prop`, with no `d` and no `ChartedSpace`. A scratch file proves `IsSmoothStratification (X := ℚ) (fun _ : Unit => id)`, although ℚ is not a manifold.

**Repair.**
1. Write the binders in the structure header: `structure IsSmoothStratification (d : ι → ℕ) [∀ i, ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)] (incl : ∀ i, S i → X) : Prop where`.
2. Change the seven uses to `IsSmoothStratification d incl`.

No theorem becomes false today, because every consumer carries the charted-space instance from the section. The predicate itself does not match its name, its docstring or the README.

**Test.** On a scratch copy with this change the file elaborates and `#check @IsSmoothStratification` shows `(d : ι → ℕ) → [∀ i, ChartedSpace …] →`. The ℚ instance then fails with "failed to synthesize ChartedSpace (EuclideanSpace ℝ (Fin 0)) ℚ".

## R04 (P3) — Five §16.1a–16.1b API lemmas in `Suggested.lean` are not headline theorems

**Location.** `Suggested.lean`:
- lines 269 and 276, `IsSmoothStratification.isStrictOrder_stratumLT` and `IsSmoothStratification.isOpen_biUnion_range`;
- line 336, `ControlData.exists_isNormalized`;
- lines 458 and 465, `IsWhitneyStratification.isSmoothStratification` and `IsWhitneyStratification.dim_lt_dim`.

**Claim.** These are headline theorems of the roadmap.

**Witness.** Each is a §16.1a–16.1b API fact (README lines 1538–1546, 1555, 1570, 1581) with a few-line point-set proof; `isSmoothStratification` mostly reassembles fields of `IsWhitneyStratification`. Layer 16's headlines are Mather 7.1, 9.1, 10.1, 10.2, 11.1 and §16.2.

**Repair.**
1. Delete the five theorems from `Suggested.lean`.
2. In README §§16.1a–16.1b keep their statements as prose targets, removing the backticks from these five names.
3. Keep `IsSmoothStratification` and `ControlData.IsNormalized`, which headline statements use.

**Test.**
- The one-tactic probe confirms none of them is trivial: all 18 theorems fail `rfl`, `simp`, `infer_instance`, `trivial`, `intro; simp`, `exact ⟨⟩` and `constructor <;> simp`.
- After the deletion, `readme-ids-missing` in the gate stays 0 and the file states 13 theorems (14 with R01's addition).

## R05 (P3) — The properness clause of normalisation is attributed to Mather (A10)–(A11), which state only two conditions

**Location.** `README.md` line 1570: "They are normalised if three conditions hold (MATHER §8, conditions (A10)–(A11), PDF p.25)." Also the `ControlData.IsNormalized` docstring (`Suggested.lean` lines 323–325) and `ControlData.exists_isNormalized` (line 333, "MATHER §8, PDF p.25").

**Claim.** Mather p.25 is the source for all three conditions, including that each tube is proper over its stratum below a radius ε.

**Witness.** MATHER lines 672–677 (PDF p.25) state only (A10), tubes meet only strata above, and (A11), incomparable tubes are disjoint. Properness appears only for admissible manifold tubes (line 511, PDF p.20) and inside Corollary 10.4's proof (line 931).

**Repair.**
1. Cite (A10)–(A11), PDF p.25, for the first two conditions only.
2. State that the properness clause and its arrangement by shrinking are this roadmap's target. The proof sketch at line 1581 already does this; MATHER line 511 can be cited as the manifold model.
3. Make the same change in the two Lean docstrings.

**Test.** MATHER lines 672–677 then support every condition attributed to them.

## Verified sound

**Gate and build**
- **Gate at ca3704e:** `gate AlgebraicTopologyPartII: … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Every counter is 0, and the worker's `gate.md` records `build=0`.
- **Outside the folder:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopologyPartII'` is empty.
- **Dependency check:** `depcheck: 243 roadmaps, 2456 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on a scratch copy gives 18 warnings `declaration uses 'sorry'` (lines 69, 108, 165, 174, 189, 215, 231, 269, 276, 336, 364, 393, 408, 458, 465, 477, 494, 510) and no errors. The only building done was `lake build TauCeti.Geometry.Manifold.RegularValue.ManifoldLevel`, an allowed module build for the R01 probe; the worktree stays clean.
- **`#check @name` on all 42 declarations,** compared with the README:
  - Of the 8 "looks dropped" leads in `signatures.md`, 7 are false. `ControlData`, `IsCompatible`, `IsInvariant`, `IsNormalized`, `IsControlledSubmersion`, `WhitneyB` and `IsWhitneyStratification` all show `[∀ i, TopologicalSpace (S i)]` and `[∀ i, ChartedSpace (EuclideanSpace ℝ (Fin (d i))) (S i)]` in their elaborated types.
  - The eighth, `IsSmoothStratification`, is R03.
  - Every theorem carries `[IsManifold …]` and the T2, locally compact and second-countable hypotheses its README statement names.
  - The five leads in `citations.md` (nine names) are this roadmap's own declarations and are all declared. Every Lean name occurs backticked in the README.
- **Form:**
  - The imports are `Mathlib` and three existing `TauCeti.*` modules.
  - There is no `set_option` and no `lemma`, and every declaration has a docstring.
  - Definitions have real bodies, with no sorry'd data.

**Ownership.** Grepping all 476 open pull requests and main for "first isotopy lemma", "control data", "Thom–Mather", "Whitney stratif" and "condition (b)" finds the objects of §§16.1a–16.1e owned only here and in StratifiedSpacesAndTameTopology (#1519, §§1.3, 5.1–5.5). That roadmap is on the brief's never-cite list and is not in `ORDER.txt`; this roadmap is (line 228). So the notion moves down: this roadmap is the owner, and StratifiedSpacesAndTameTopology must cite it, which is outside this review. The README cites none of the never-cite roadmaps (0 occurrences each). `roadmaps grep --lean-only AlgebraicTopologyPartII` finds the namespace only in this pull request's `Suggested.lean`.

**Headline theorems**
- **Stated:**
  - `configurationTraceFormula` (§2.3);
  - `stableConfigurationDiagonal` (§3.5);
  - `tameFibreBouquet` (§4.2);
  - `rationalBouquetRanks` (§4.5; §4.4 is its N=1 case);
  - `doubleLoopBetti` (§5.1);
  - `phamStrongRetraction` (§5.3);
  - `fermatDoubleLoopSimplyConnected` (§5.4);
  - `exists_controlData_isCompatible` (Mather 7.1);
  - `ControlData.exists_isControlledVectorField_lift` (9.1);
  - `ControlData.exists_flow` (10.1);
  - `ControlData.exists_trivialization` (10.2–10.3);
  - `firstIsotopyLemma` (11.1);
  - `equivariantStratifiedTransport` (§16.2).
- **Named as not statable,** each checked at the pins:
  - §2.1, which needs ℓ-adic étale cohomology;
  - the compact-support forms (no compactly supported cohomology);
  - §§4.3, 4.6 and 5.2 (no Whitehead-product, free graded-commutative or topological-join carrier; "join" in Mathlib is only the lattice join);
  - §§9.x–15.x and 16.3–16.4, which need the semialgebraic equivariant site, a Borel construction or equivariant sheaf cokernels, none of which grep finds.
- **The exception** is §16.1, which is R01.

**Adversarial table** (both sides computed)

| Statement | Instances | Values computed (left / right) | Result |
|---|---|---|---|
| `configurationTraceFormula` (§2.3) | q=2,m=2: χ=sgn; χ≡1; m=0 | sgn: x(x+1)→+1, x²+x+1→−1, sum 0 / 4·⟨sgn,H⁰⟩−2·⟨sgn,H¹⟩=0−0 (swap trivial on H¹(ℂ×ℂ*)); χ≡1: 2 / 4−2=2; m=0: χ(∅) / χ(∅)·1 | holds |
| §3.3 weighted product | q=2: c=1; c=−1 | c=1: degree counts 1,2,2 / (1−2U²)(1−2U)⁻¹=1+2U+2U²; c=−1: −2, then +1−1=0 / 1−2U | holds |
| `eulerExponent` (§3.2) | n even, N=2; n odd, N=2 | numerators −2,−2,−6 give −2,−1,−2; 2,−6,6 give 2,−3,2 / BS (7.2) at line 2218 the same | holds |
| `stableConfigurationDiagonal` | (s,N,j,d)=(0,2,2,2); (0,1,1,0) | m=2: ½(4·1+2·(−1)·1)=1 / [t²](1+t)²(1+t³)=1; second: `hd` fails (1≤0), truncated sum 0 against [t](1+t)=1 | holds; `hd` needed |
| §4.3 Hilton | N=2, n=3 | L₁,L₂,L₃=2,1,2; π₃=π₃(S²)²⊕π₃(S³): rank 3 / `rationalBouquetRanks` k=1: (−1)¹·(−3)=3 | holds |
| §4.4 | S², S³ | ranks 1,1 at π₂,π₃; S³: π₃ only / SERRE Prop. 3 (odd n finite above n), Cor. 2 (π_{2m−1}=ℤ⊕finite) | holds |
| `tameFibreBouquet` | x³−3x+y² at a=0, ±2; n=0 | J=ℂ[x]/(x²−1), μ=2: 2 circles; μ^{±2}=1: 1 circle; n=0: empty fibre / one S⁰ (two points) | holds; n≥1 needed |
| `rationalBouquetRanks` | s=0, N=2, k=0,1,2 | (−1)^k e: 2,3,2 / Hilton: 2; 2+L₂=3; L₃=2 | holds |
| `doubleLoopBetti` | S⁴ (s=1,N=1); j=0 | (1+t⁵)/(1−t²): 1,0,1,0,1,1,1 / ℚ[y₂]⊗Λ(z₅); j=0: empty product 1 / rank H⁰=1 | holds |
| `phamStrongRetraction` | k=(2,3); n=0 | K₂,₃: 6−5+1=2 / (2−1)(3−1)=2; n=0: X=S=∅ | holds |
| `fermatDoubleLoopSimplyConnected` | n=5, k≡2; n=4 | S⁴: π₂=π₃=0; S³: π₁Ω²=π₃=ℤ≠0 | n≥5 needed, stated |
| §6.1 (BW 372–384) | X=A¹ | support sequence H^q_{G,ℝ}(ℂ)=0,0,𝔽₂,0,𝔽₂ / purity H^{q−1}(G,ℤ(1))=0,0,𝔽₂,0,𝔽₂ | holds |
| §7.4 (B19 (2.8)) | Y=pt, a=ω^k | b₀=β(a₋₁)+(k−0)a₀=k / β(ω^k)=kω^{k+1}; k=1: ω²=Sq¹ω | holds |
| §8.1 (BW (1.17)–(1.18)) | 0∈A¹; RPˢ, s odd | H²,H³_{G,0}: 0,𝔽₂ via circle with two fixed points (H¹_G=0, H²_G=𝔽₂², diagonal) / H⁰,H¹(G,ℤ(1))=0,𝔽₂; H^s(RPˢ)=ℤ / H^s(G,ℤ)=0 | holds; i<s sharp |
| §9.5 (BW Prop. 1.8) | d=2,i=4,j=1; i≤d | window {p<2, p odd}={1} / BW (1.41) same; i≤d: empty | holds |
| §10.1 (BW Prop. 1.10) | real-empty conic, M=𝔽₂ | H^i(RP²,𝔽₂)=1,1,1 / H^{2−i}(RP²,𝔽₂)=1,1,1, cup pairing perfect | holds |
| §14.1–14.2 (B19 (2.2)–(2.5)) | split cover; connected cover of S¹ | L constant, e=0, β_L(1)=0 / monodromy −1, e≠0, β_L(1)=e | holds |
| §15.3 (B19 Lemma 7.2) | n=2: fixed sheets; swapped sheets | H²(G,ℤ(1)²)=0, β(a)=(1,1)≠0 → no lift / Q(1)=ℤ, H²=𝔽₂, −φζ=a, H³ upstairs 0 → lift | holds |
| §16.1 averaged chart | φ=t+t², σ=−t; ℝ×S¹, z↦z̄ | ψ=t, ψ(−t)=−ψ(t) / φ(−t)=−t+t²≠−φ(t); averaged projection has kernel ∂_x | holds |
| `StratumLT`, `IsSmoothStratification` | ∂D,D° in the closed disc; disc and radius-3 circle as one stratum; ℚ | ∂D<D° true, D°<∂D false; frontier fails (outer circle ⊄ cl D); ℚ: predicate proved | R03 |
| `isStrictOrder_stratumLT`, `isOpen_biUnion_range` | closed disc | U={D°} upward closed: D° open / U={∂D} not upward closed: ∂D not open | true; R04 |
| `WhitneyB` | cusp y²=x³; (t, t·sin(1/t)) | slopes t, 3t/2: distance ≤|t|/2→0 / at t=1/(2πk) secant horizontal, tangent (1,−2πk): distance→1 | definition separates |
| `IsWhitneyStratification.dim_lt_dim` | spiral onto S¹ | frontier holds, (b) fails / dims 1=1 | (b) needed |
| `ControlData`, `IsCompatible` | 3 strata of ℝ²; x-axis with f=x | det 2xy/√(x²+2y²)≠0; orthogonal π₁ gives ρ₀π₁=x²<ρ₀; f∘π: x / x+y² | definitions separate |
| `IsNormalized`, `exists_isNormalized` | a={0}, b={5}; T=(−1,1)∪(1,2) | T_a∋5: not normalised; deleting (4,6) normalises; {ρ≤ε}⊇(1,1+ε] not compact | holds; source of clause 3 is R05 |
| `exists_controlData_isCompatible` (§16.1c) | unit circle; y-axis with f=x | (θ,(r−1)²): derivative 2(r−1)≠0 off the circle / f∘incl constant on the y-axis, so `hsub` is false | holds |
| `IsControlledVectorField`, `exists_flow` | rotation; inward radial field | dρ₀=−2xy+2xy=0 / dρ₀=−2|v|≠0, and D is not open at (t,0) | control needed |
| `exists_isControlledVectorField_lift` | ℝ×F→ℝ; strata {0}, ℝ∖{0} | ∂_x lifts ∂_t / a 0-dim stratum admits no submersion to ℝ^m, m≥1 | holds |
| `exists_trivialization`, `firstIsotopyLemma` | ℝ²∖{x≥0,y=0}; x²+y²; xy=t | fibres a line / two half-lines; point / circle; node only over 0 | each hypothesis needed |
| `equivariantStratifiedTransport` | ℝ×S¹, σ=conj; (b,z)↦(−b,τz) | unaveraged h(π/2,1)=(π/2,−i) / (σ_B×σ_M)h=(π/2,i); averaged ∂_x: h=id; ε=−1: ½(∂_b+∂_b)=∂_b | holds |
| §16.4 (B19 (4.3)–(4.5)) | split unramified cover | g=0, ζ=0: 0 / g(0)=0; degrees 3+1 / 2+1+1 | holds |
| §16.1 statability (R01) | pinned carriers | the probe elaborates / only `sorry` warns | statable |

**Sources: seeded sample, each read at its locator.** For each, the theorem number, page and hypotheses match, and the source supports the statement as written.
- **2.3:** CEF line 964 (Theorem 3.7, p.21, for n≥1; m=0 holds trivially). The compact form is BS lines 2262–2273 (p.942).
- **3.3:** BS lines 2289–2319 (Lemma 7.4 proof, p.943). See Source issues.
- **4.3:** HILTON is uncertified. Its use was checked through BS lines 2369–2373, which cite Hilton Cor. 4.10 with the same summands and Witt counts.
- **4.4:** SERRE line 2700 (Proposition 3, printed p.494) and line 2852 (Corollary 2, p.498).
- **6.1:** BW lines 372–386 ((1.8)–(1.9), p.10).
- **7.4:** B19 lines 436–440 ((2.8), p.74); BW lines 581–600 ((1.33), p.16).
- **8.1:** BW lines 456–478 ((1.17) for i<n and (1.18), pp.12–13); BW line 496 for or=ℤ(−k).
- **9.5:** BW line 749 (Proposition 1.8, p.19) and line 798 (Remark 1.9, p.20). BW assumes X irreducible; the README's pure-dimensional form is the componentwise sum.
- **10.1:** BW line 809 (Proposition 1.10, p.21).
- **14.1, 14.2:** B19 lines 362–395 ((2.2)–(2.5), pp.72–73).
- **15.3:** B19 lines 1422–1440 (Lemma 7.2 and its proof, p.98). The obstruction is the Bockstein of p*a through the displayed map of sequences.
- **16.1:** B19 lines 1257–1261 (Proposition 6.6 proof, p.94), with a trivial base involution; DIMCA is uncertified.
- **16.1c:** MATHER lines 480–488 (control data, compatibility, Proposition 7.1, PDF p.19) and line 512 (Lemma 7.3, PDF p.20). §8 is at lines 622–687 (PDF pp.23–25).
  - The OCR of line 488 reads "f: M → P is a submersion".
  - Proposition 11.1's proof (line 972) applies it to a map that is a submersion only on strata.
  - The README's form follows by shrinking M to the open set where df is onto, which contains A.
- **16.4:** B19 lines 773–816 ((4.3)–(4.5), pp.82–83).

**Also checked**
- MATHER line 206 (§5, PDF p.10), line 715 (controlled submersion), line 727 (Proposition 9.1, PDF p.26), line 825 (Proposition 10.1, PDF p.29), lines 887–916 (Corollaries 10.2–10.3, PDF pp.31–32) and line 969 (Proposition 11.1, PDF p.34).
- BS lines 2211–2252 (Definition 7.3, (7.2), Lemma 7.4) and line 2322 (Corollary 7.5). BS assumes d(n−3)>j; the README's d(n−3)≥j is justified by its own truncation argument.

**Library declarations opened at the pins**
- Mathlib:
  - `Manifold.IsSmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding.lean:70`, immersion plus `IsEmbedding`);
  - `Manifold.IsSubmersionAt` (`Geometry/Manifold/Submersion.lean:172`);
  - `IsMIntegralCurveOn` (`Geometry/Manifold/IntegralCurve/Basic.lean:65`);
  - `tangentConeAt` (`Analysis/Calculus/TangentCone/Defs.lean:66`);
  - `extChartAt` (`Geometry/Manifold/IsManifold/ExtChartAt.lean:437`);
  - `intrinsicInterior` (`Analysis/Convex/Intrinsic.lean:61`);
  - `Geometry.SimplicialComplex` (`Analysis/Convex/SimplicialComplex/Basic.lean:59`);
  - `SmoothPartitionOfUnity` (`Geometry/Manifold/PartitionOfUnity.lean:123`);
  - `PartitionOfUnity` (`Topology/PartitionOfUnity.lean:100`);
  - `IsProperMap` (`Topology/Maps/Proper/Basic.lean:77`);
  - `Bundle.Trivialization` (`Topology/FiberBundle/Trivialization.lean:376`, extending `OpenPartialHomeomorph`);
  - `BoundarylessManifold.isInteriorPoint` (`Geometry/Manifold/IsManifold/InteriorBoundary.lean:188`);
  - `ArithmeticFunction.sum_eq_iff_sum_smul_moebius_eq` (`NumberTheory/ArithmeticFunction/Moebius.lean:227`);
  - `PowerSeries.binomialSeries` (`RingTheory/PowerSeries/Binomial.lean:47`).
- Tau Ceti:
  - `TauCeti.SmoothEmbedding` (`Geometry/Manifold/SmoothEmbedding/Basic.lean:75`);
  - `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`Geometry/Manifold/TubularNeighborhood/Existence.lean:53`, boundaryless models, target T2 and second countable);
  - `AbstractSimplicialComplex.Realization` (`AlgebraicTopology/SimplicialComplex/Realization/Basic.lean:71`);
  - `TauCeti.IsRegularValue` (`Geometry/Manifold/RegularValue.lean:92`);
  - `TauCeti.regularFiberChartedSpace` (`Geometry/Manifold/RegularValue/ManifoldLevel.lean:198`).

**Cross-roadmap citations resolved**
- **On main:**
  - SmoothBundlesConnections B1.5 (line 498, cited as "§B1 item 5");
  - DifferentialGeometry Layers 2, 3 and 10 (lines 341, 371, 877; Sard at 10.2, line 884);
  - GeometricTopology Layer 1 (line 177);
  - SchemeAndStackFoundations §§0.1, 0.2, 0.7, `cohomology_filtered_colimits` (line 3402), and `coind_injective` and `forget_injective` (line 4570);
  - AffineMorseLefschetz A2, A3, A4.0, A4.1 (lines 416, 534, 616, 946);
  - CharacteristicClasses C2 item 3 (line 835) and C3 item 2 (line 1106: w₁ orientation class, w_n=e mod 2);
  - MorseNovikov §6.4 (line 1131, the Lefschetz formula including nonorientable fibres);
  - DGFloer Layer 1 item 2 (lines 531, 554);
  - GeneralizedCohomology G2.10;
  - RealAnalyticGeometry R2.1;
  - RealAlgebraicGeometry (`Completed/`) Layers 3 and 6.
- **At open heads:**
  - MotivesAndAlgebraicCycles §§7.6a–7.6b (lines 1402, 1413);
  - EtaleDualityAndPerverseSheaves §§3.5–3.8, 4.7, 6.5;
  - InverseGaloisAndArithmeticFundamentalGroups §§IG.0.T2–T4, IG.5.1;
  - StableHomotopyKTheory §§3.36, 3.37, 4.6;
  - TangentialBordism B4.3 ("4.3 Thom and Wu classes");
  - ComplexComparisonPartII C−1.1.
- Every supplier is on main or earlier than this roadmap in `ORDER.txt`.

**Overlap.** `overlaps.md` lists no pull request that changes this roadmap and no dropped or revision-only id. I checked that against its closest roadmaps, which include the two AlgebraicTopology revisions (#1652, #1663).

**Gaps.** All 14 are declared with a named supplier and the same slug in `plan.json` and the README. 13 sentences equal the plan's; R02 is the 14th.

## Not verifiable

- These are settled and cited by locator only, so their texts were not read:
  - uncertified: HILTON (Theorem A, Cor. 4.10), DIMCA (Lemma 4), BRUMFIEL (pp.163–169), SCHEIDERER (Cor. 18.11) and BCR (Thm 9.3.2);
  - waived: KRASNOV (Theorem 2.1).

  Hilton was checked through BS lines 2369–2373.
- MATHER and SERRE are OCR scans. Their theorem numbers and pages are legible; statement wording was read through the OCR noise.
- Ownership against #1519 was checked with the `roadmaps grep` and `overlaps` tools at the heads of 2026-11-08. The brief gives no checkout of it.

## Source issues

- **Misprint** in BS at Lemma 7.4 proof, printed page 943: the source says the character sum is a coefficient of the product of (1−qU^k) with no exponent; it should carry exponent −e_k(N), as in the lemma's statement; affects nothing.
- **Misprint** in MATHER at Corollary 10.2 proof, PDF page 31: the scan attributes the controlled lifts of the coordinate fields to Proposition 10.1; it should be Proposition 9.1, the lifting result, with 10.1 giving the flows; affects nothing.
- **Error** in BS at Lemma 7.6, printed page 944: the source assumes n>2 for the double-loop Betti product; it should be n≥4, since at n=3 Ω²X has π₀=ℤ^N and the first factor has base zero; affects a stated result.
- **Error** in B19 at Lemma 7.3, printed page 98: the source says p*α̃ reduces from p*η+ψ(ζ); it should be p*η−ψ(ζ), because α̃ is the image under (1,−φ) and ψ≡diag∘φ mod n; affects a stated result.
