# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at ba18301)

**Verdict:** needs changes

This is an incremental re-review: it covers the 136 lines that changed since 7fede29.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is the previous review's R01, carried forward. No repair report marks it as not actionable.

**Location:**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 … and owns none of these statements".
- `README.md:1636`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim:** §§5.7, 6.11, 6.12, 7.1 and 7.3 have a single owner, this roadmap.

**Witness:** #1840 at 96339c0e:
- `README.md:205–206` and `:3131–3132` name this roadmap as the importer of §§1.4–1.5.
- §1.4 (`:1057`) states principal-punctured-open affine Lefschetz and local duality, and §1.5 (`:1110`) states local Lefschetz.
- `:1151` (§1.6 *Needs*) cites §1.5.

**Repair** (on the PurityForFlatCohomology side; this folder needs no change):
- Delete §§1.4–1.5 and the importer bullets at `:205–206` and `:3131–3132`.
- Cite this roadmap's §§5.7, 6.11, 6.12 and 7.3 instead.
- In `:1151`, replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

This is the right direction for two reasons. #1840 calls Gabber's theorems "the substance of this target" (`:1083`), and its §1.4 *Needs* lists none of the Layers 0–6 those theorems rest on here.

**Test at 96339c0e:** I edited only `:1151` in a scratch copy of #1840's README.
- With `--movable`, the dependency check prints `moved: PurityForFlatCohomology moved in the merge order from #218 to #386, right after its last supplier EtaleDualityAndPerverseSheavesPartII`, then `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`. A `moved:` line is not a defect.
- Without `--movable`, it prints `UPWARD: PurityForFlatCohomology (#218) -> EtaleDualityAndPerverseSheavesPartII (#386) at README lines [1151]`.

## R02 (P2) — §5.9 claims Serre's open-subgroup theorem, which NoncommutativeAndEquivariantIwasawa §0.11 already owns

**Location:**
- `README.md:23`: "Section 5.9 owns … Serre's theorem on open subgroups of profinite groups without ℓ-torsion".
- `:1058`: "This includes the two classical inputs of its proof: Serre's theorem that an open subgroup … has the same ℓ-cohomological dimension (Ser65 …)".
- `:1064`: "for infinite cd_ℓ(κ) it is Serre's theorem".

**Claim:** §5.9 is the owner of Serre's theorem.

**Witness:** NoncommutativeAndEquivariantIwasawa (#1307; merge order #29, before #386) §0.11, `README.md:493`: target cd_p_eq_of_isOpen_of_noPTorsion, "for a profinite group G with no element of order p and an open subgroup U, cd_p G = cd_p U".

That section also gives Serre's tensor-induction proof, and its API bullet is at `:505`. The pin has only the finite case: `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` (`OpenSubgroup.lean:111`) assumes cd_p G ≠ ⊤.

**Repair:**
- At `:23`, replace "its invariance under finite extensions, Serre's theorem on open subgroups of profinite groups without ℓ-torsion and the Artin–Schreier theorem on torsion in absolute Galois groups." by "its invariance under finite extensions and the Artin–Schreier theorem on torsion in absolute Galois groups; Serre's theorem on open subgroups of profinite groups without ℓ-torsion is NoncommutativeAndEquivariantIwasawa §0.11."
- At `:1058`, replace "This includes the two classical inputs of its proof: Serre's theorem … (Ser65, recalled at SGA4 line 1233), and the Artin–Schreier theorem" by "Its proof uses Serre's theorem … (NoncommutativeAndEquivariantIwasawa §0.11; Ser65, recalled at SGA4 line 1233), and includes the Artin–Schreier theorem".
- At `:1064`, replace "it is Serre's theorem" by "it is Serre's theorem (NoncommutativeAndEquivariantIwasawa §0.11)".
- Add "NoncommutativeAndEquivariantIwasawa §0.11 (Serre's theorem)" to the *Needs* at `:1066` and to the Layer 5 Dependencies at `:1090`.
- Add a supplier contract `### From TauCetiRoadmap.NoncommutativeAndEquivariantIwasawa`: "Section 0.11 supplies Serre's theorem: for a profinite group without elements of order ℓ and an open subgroup, the two ℓ-cohomological dimensions agree in ℕ ∪ {∞}. Section 5.9 uses it for finite extensions of residue fields."

**Test:** with all five edits on a scratch copy, the movable dependency check prints `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.

## R03 (P2) — §5.9 states the Artin–Schreier theorem without separability, and in characteristic p it is false

**Location:** `README.md:1058`: "the Artin–Schreier theorem that a proper subfield of finite index in a separably closed field is real closed of index 2 (recalled at SGA4 line 1235)".

**Claim:** this is a theorem §5.9 owns (Scope, `:23`), used at `:1058` and `:1064`.

**Witness:** C = separable closure of 𝔽_p(t), K = C^p. Then t ∉ K (t^{1/p} is inseparable over 𝔽_p(t)), [C : K] = p, and K ≅ C is separably closed of characteristic p, not real closed. SGA4 line 1234 says algebraically closed.

**Repair:** at `:1058`, replace the clause by "the Artin–Schreier theorem that a field whose separable closure is a proper finite extension of it is real closed, the extension having degree 2 (stated for algebraic closures at SGA4 line 1235)".

**Test:**
- C^p ⊂ C is now excluded: C^p is separably closed, so it is its own separable closure.
- ℂ/ℝ satisfies the corrected statement: degree 2, and ℝ is real closed.
- The use at `:1058` still follows. An element of order ℓ in the absolute Galois group of κ fixes a field κ̃ with κ^sep/κ̃ Galois of degree ℓ. Hence ℓ = 2 and κ̃ is real closed, so κ ⊂ κ̃ is formally real.

## R04 (P3) — The infinite case of field input (i) rests on a proof citation, and its pinned input is not named

**Location:** `README.md:1064`: "If cd_ℓ(κ) is infinite, pass to an ℓ-Sylow subgroup (…) and compare F with F(π^(1/ℓ)) for a uniformizer π through Kummer theory (SchemeAndStackFoundations §2.11), as in the proof of SGA 4 X 2.2(i)". The *Needs* at `:1066` does not name the step that concludes the argument.

**Claim:** every input of the route is a target, a supplier section or a named pinned declaration.

**Witness:** SGA4 line 1284 closes the cited proof with the pro-ℓ criterion (CG I Prop. 20): finite cd_ℓ once H^N(G, ℤ/ℓ) = 0 for large N. It is pinned as `TauCeti.IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp` (`ProP/CohomologicalDimension.lean:133`), unnamed in route and *Needs*.

The full path of that file is `TauCeti/Topology/Algebra/Group/Profinite/ProP/CohomologicalDimension.lean`, and the lemma is stated for compact pro-p groups.

**Repair:**
- At `:1064`, after "(SGA4 lines 1277–1322)", add: "; if cd_ℓ(F) were finite, the comparison gives H^N(G_κ, ℤ/ℓ) = 0 for large N, and for the pro-ℓ group G_κ this bounds cd_ℓ(κ) (`TauCeti.IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp`)".
- Add the name to `:1066`.
- Add it to the Tau Ceti contract at `:70`, as: "module `TauCeti.Topology.Algebra.Group.Profinite.ProP.CohomologicalDimension`: for a compact pro-ℓ group, cd_ℓ ≤ n exactly when Hⁿ⁺¹(G, 𝔽_ℓ) = 0".

**Test:** after the Sylow reduction G_κ is pro-ℓ. The lemma with n = N − 1 gives cd_ℓ(κ) ≤ N − 1, which contradicts cd_ℓ(κ) = ∞, as the route requires.

## Previous findings

- R01 — not repaired: `README.md:23` and `:1636` are unchanged; #1840 at 96339c0e still states §1.4 (`:1057`) and §1.5 (`:1110`) and names this roadmap their importer (`:205`, `:3131`). Raised again as R01.
- R02 — repaired: new §5.9 (`:1044–1082`) proves the lower bound by codimension-one induction (SGA 4 X 2.4) with owned field inputs; SGA4 is referenced (`:1650`) and certified in the manifest; headline `cohomologicalDimension_fractionRing_eq` added. The repair introduced R02, R03 and R04.
- R03 — repaired: `:596` cites §PA.4.1 (log regularity) and §PA.4.3 (desingularization); `:612` cites §PA.4.4, LefschetzPencilsAndVanishingCycles §0.10 (very tame quotients) and §PA.4.3; `:614` and `:658` list §0.10; contracts `:100` and `:128` updated.
- R04 — repaired: `:35` now reads "the dimension of the closure in X_(x̄) of the image of ȳ, the closed point of X_(ȳ), as in §5.1"; the new §5.1 Check (`:894`) computes 1 against 2.
- R05 — repaired: `:1390` "n ≥ 2 an integer invertible in R, Λ = ℤ/n … μ_n^(⊗d)[2d]"; `:1392` cites ILO14 line 12199; new Check at `:1406` covers n = ℓ and n = 6.

## Verified sound

**Gate, dependency check and elaboration, run on this head:**
- The gate prints `set_option=0 blob=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, and the worker's `gate.md` shows `build=0`.
- The required dependency check prints, in full: `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder lists no paths.
- `lake env lean` on `Suggested.lean` exits 0 in 17.8 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 331.
- Imports are `Mathlib`, `TauCeti.RingTheory.RegularLocalRing.GRing` and `TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.Basic`, as `README.md:72` says. There is no `lemma`, no `set_option` and no sorry'd data.

**Signatures:**
- The 10 unchanged declarations in `scratch/signatures.md` are as the previous report recorded.
- I ran `#check` with `pp.universes` on `cohomologicalDimension_fractionRing_eq`. It elaborates to `cohomologicalDimensionAt.{0, u_1} ℓ (Field.absoluteGaloisGroup.{u_1} (FractionRing A))`, so the coefficients lie in `Type u_1`, the universe of A, as `README.md:70` states.
- Its binders are exactly those of `README.md:1052`: `IsDomain`, `HenselianLocalRing`, `IsGRing`, `ringKrullDim A = ↑d`, `Fact ℓ.Prime`, `IsUnit ↑ℓ` and `ℓ ≠ 2 ∨ ¬IsFormallyReal (ResidueField A)`. I changed nothing.

**Padding probe:** on a scratch copy, each of the 8 theorems is tried with `first | rfl | simp | infer_instance | trivial | aesop | exact le_rfl`. All 8 fail, with errors at probe lines 92, 118, 198, 244, 283, 303, 320 and 338.

**Headlines:**
- The new §5.9 formula is in the Summary (`:3`) and is stated in `Suggested.lean`, as the module docstring says.
- `README.md:152` says "eight headline signatures", which matches the file.
- The equality carries the whole content of §5.9: in the excluded case cd₂(k) = ∞ (SGA4 line 1224), so the upper bound is empty.

**Declarations opened at the pins:**
- Tau Ceti, `CohomologicalDimension/` directory:
  - `Basic.lean:131` (`CohomologicalDimensionLE`: modules `Type (max u v)`, discrete, ℓ-primary) and `:146` (`cohomologicalDimensionAt`).
  - `ClosedSubgroup.lean:80` (closed subgroup; compact and totally disconnected).
  - `OpenSubgroup.lean:111` (open subgroup, cd ≠ ⊤).
  - `IndexNotDvd.lean:158` (indices prime to ℓ, in `ℕ∞`).
- Tau Ceti, elsewhere:
  - `ProP/CohomologicalDimension.lean:133` (R04).
  - `Free/Pointed/Serre.lean` is the projective-implies-free theorem, not Serre's open-subgroup theorem.
  - `FieldTheory/RealClosure/QuadraticExtension.lean:107,135` characterise real closed fields by quadratic extensions but do not prove Artin–Schreier.
- Mathlib:
  - `Algebra/Ring/IsFormallyReal.lean:105` (`¬IsSumNonzeroSq 0`, as `README.md:62` paraphrases).
  - `FieldTheory/AbsoluteGaloisGroup.lean:42` (automorphisms of `AlgebraicClosure`, Krull topology).
  - `FieldTheory/IsRealClosed/Basic.lean:52`, where the Artin–Schreier characterisation is a TODO.

**Cross-roadmap citations of the changed passages, resolved:**
- SchemeAndStackFoundations on main (d72684a):
  - §0.9 `spreading_out_models` (`:865`, generic point to a dense open via the D(f)).
  - §2.11 Kummer (`:3656`).
  - §2.15 `etale_galois_comparison` (`:3872`), `etale_cohomology_limits` (`:3877`) and `hochschildSerre_galois_covering` with its profinite version (`:3880`).
  - §0.21 (`:1394–1461`) still has no henselization statement, so gap:henselian-quasi-excellent-catenary stays minimal. It is declared in `design/plan.json` and at `README.md:80`; §§5.7 and 5.9 now consume it.
- ClassicalAdicEtaleCohomology §5.3 (#875, `README.md:3054`): tame inertia ∏_(ℓ≠p) ℤ_ℓ(1) for value group ℤ, and at `:3080` the invariance of cd_ℓ under the quotient by any closed normal pro-p subgroup.
- AdicCoefficientsAndComparisonsPartII (#1796 at d6d93fd5): §PA.4.1 log regular pairs (`:981`), §PA.4.3 monoidal desingularization (`:1044`), §PA.4.4 Gabber modification extending the separated one (`:1073`).
- LefschetzPencilsAndVanishingCycles §0.10 (#873, `README.md:720`, `:753`): very tame Kummer étale quotient (ILO VI 3.2) and the separated equivariant log resolution. §2.3 works on a complete local scheme, which is separated, so §0.10's separated theorem already applies there; the route names both.

**Ownership by object, searched with `roadmaps grep` over main and the open heads:**
- Searched: Serre's theorem; elements of order ℓ; Artin–Schreier and real-closed index 2; cd of henselian discretely valued fields; finite-extension invariance; pro-p quotients.
- The only second owner is NoncommutativeAndEquivariantIwasawa §0.11 (R02).
- ClassicalAdicEtaleCohomology §11.2 owns only cd_ℓ(L) ≤ cd_ℓ(K) + trdeg. §5.9 (ii) takes its inequality from the pinned closed-subgroup lemma and claims only the equality.
- DiamondEtaleCohomology C8.32 (cd_ℓ G ≤ cd_ℓ N + cd_ℓ Q) is a route step in (i) and is not claimed here.

**Sources, at the locators the changed passages cite:**
- SGA4 (retyped edition; published page numbers in the margin at lines 1214, 1237, 1257, 1285, 1307, 1335, 1356, 1376):
  - X 2.1, lines 1219–1236, p. 45: inequality; strict only when ℓ = 2 and k is orderable; Serre at 1233; Artin–Schreier at 1234–1235.
  - X 2.2(i) and 2.2.1, lines 1241–1322, pp. 46–49.
  - X 2.3, line 1323, p. 49: equality if ℓ ≠ 2 or k is not orderable.
  - X 2.3 Exemple, line 1336, p. 50.
  - X 2.4, line 1338, p. 50: hypothesis on all residue fields, which `:1062`'s Hensel argument derives from k for henselian A.
  - X 2.5, lines 1361–1363, p. 51.
  - X 3.1, line 1371, p. 51.
- ILO14:
  - Exposé 0 Cor. 8, lines 396–401, printed p. 5 (page header at line 369).
  - XV 1.2.2 and 1.2.4, lines 10350 and 10362, pp. 219–220.
  - XVIII-A 1.2, lines 16203–16207.
  - XVII standing n ≥ 2, line 12199.
  - XVII 2.4.4.1, line 12835, p. 267.
  - XIV 2.1.1–2.1.2, lines 9869–9877.
- All support the statements as written, except the two passages raised in R03 and under Source issues.

**Seeded sample:** the sample targets that the change touches are §2.2 (route citations, R03), §5.1 (new Check), §6.3 (through §6.11's route) and §7.1 (whose input, the first assertion of §5.7, is unchanged); all were checked above. The other sampled targets are untouched and were verified in the previous report. The README flags no locator as unverified.

**Adversarial table.** Rows marked "prev." are carried from the previous report; the statements they test are untouched.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `cohomologicalDimension_fractionRing_eq` / §5.9 | ℤ_p, ℓ ≠ p; ℤ₃, ℓ = 2; d = 0 | cd_ℓ(ℚ_p) = 2 = 1 + 1; cd₂(ℚ₃) = 2 = 1 + 1 (−1 = 1² + 1² in 𝔽₃); field: c = 0 + c | holds |
| same, negative controls | (ℝ[x,y]/(x²+y²))^h at ℓ = 2 and ℓ = 3; ℝ⟦t⟧, ℓ = 2 | ℓ = 2: 1 vs ⊤, excluded by `hreal`; ℓ = 3: 1 = 1 + 0; ℝ⟦t⟧: ∞ = 1 + ∞, excluded though true | hypothesis needed, not necessary |
| same, hypotheses used | ℤ_(p), ℓ = 2, p odd; 𝔽_p⟦t⟧, ℓ = p | non-henselian: cd₂(ℚ) = ∞ ≠ 1 + 1; ℓ = p: ≤ 1 vs 1 + 1 = 2 | `HenselianLocalRing` and `IsUnit ℓ` needed |
| §5.9 lower-bound induction | 𝔽_q⟦x,y⟧, ℓ ∤ q, 𝔮 = (x) | A/𝔮 = 𝔽_q⟦y⟧, cd 2 ≥ 1 + 1; V with residue field 𝔽_q((y)), cd 3 = 2 + 1 | holds |
| §5.9 Hensel step | ℤ₃, ℓ = 2 | −1 ≡ 1 + 1, −2 ≡ 1 mod 3, −2 = u², −1 = (1/u)² + (1/u)² | holds |
| §5.9 (i) | ℂ((t)); 𝔽_q((t)); ℝ((t)), ℓ = 2; 𝔽_p((t)), ℓ = p | 1 = 0 + 1; 2 = 1 + 1; ∞ = ∞ + 1; ≤ 1 vs 2 | holds; ℓ invertible needed |
| §5.9 (ii) | 𝔽_{q²}/𝔽_q; ℂ/ℝ at ℓ = 3 and ℓ = 2 | 1 = 1; 0 = 0; 0 < ∞, the excluded case | holds |
| §5.9 Artin–Schreier clause (R03) | 𝔽_p(t)^sep ⊃ its p-th powers; ℂ ⊃ ℝ | index p, subfield separably closed in characteristic p, not real closed; index 2, real closed | false as worded |
| §5.7 henselian bound (changed) | Spec ℤ_p with U = Spec ℚ_p and U = X; ℝ⟦t⟧, ℓ = 2 | 2 ≤ 1 + 1; 1 ≤ 2; ∞ ≤ 1 + ∞ | holds |
| §6.11 with ℤ/n (R05) | n = 6, d = 1; n = 4, d = 1; d = 0 | μ₆[2] = μ₂[2] ⊕ μ₃[2], H²_x(μ₆) = ℤ/2 × ℤ/3; H²_x(μ₄) = K*/K*⁴ = ℤ/4; K = Λ | holds |
| Conventions codimension and §5.1 Check (R04) | 𝔸²_k, generic point of V(y) ⇝ origin; identity of X_(ȳ) | closure of the image of the point: 1; of X_(x̄): 2; identity: point-image 0, whole-image 2 | wording now correct |
| §§2.2–2.3 routes (R03) | #1796 §§PA.4.1/4.3/4.4; sign action on 𝔸²_k with axes boundary | log regular / desingularization / modification; quotient k[u,v,w]/(uw − v²), Kummer étale of group ℤ/2 | correct sections |
| §0.1 alt/S (prev.) | Spec k; 𝔸¹_k | κ(η)/k finite ⇒ dim 0; [k(t):k] = ∞ ⇒ not in alt/S | holds |
| §0.2 alt_ℓ′ (prev.) | ℤ[i]/ℤ at ℓ = 3 and ℓ = 2 | degree 2 ∈ 3′; [ℚ(i):ℚ] = 2 ∉ 2′ | holds |
| §0.4 (prev.) | 𝔽_p(t), ℓ = p | k^sep lacks t^{1/p} ⇒ not covering | holds |
| §0.5 (prev.) | k⟦t⟧ vs k, a = 1 | gr¹ degree-one pieces k and 0 | not 1-isomorphic |
| §0.7 (prev.) | T complete; T henselian | III 6.2 through excellent T_(t) | holds |
| §0.8 (prev.) | Spec ∏ 𝔽₂; Bl₀ 𝔸²_ℂ | no finite surjective subfamily; diagonal misses (e, e′) | holds |
| §1.2 / `cohenGabber_equivariant` (prev.) | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; x ↦ x/(1+x) in char 2 | degree 2; degree 6; \|G\| = 2 = 0, excluded | holds |
| §2.1 (prev.) | ℙ¹_L over K, [L:K] = 2 | L ⊂ L(t) algebraic over K | geometric irreducibility needed |
| §2.3 Check (prev.) | 𝔽₃[t]_(t), x³ + x² + 2x + t, ℓ = 2 | 𝔽₃ × 𝔽₉; generic degree 3 | not alt_2′ |
| §2.4 (prev.) | Spec k, Z = ∅; Bl₀ 𝔸²_ℂ | image is the whole point; Rj_*Λ = 0 on E × E | holds |
| §3.4 (prev.) | π = id; torsion F | equivalence; D⁺(T, ℤ/n) | holds |
| §4.1 (prev.) | ILO XIX 2.2 | stalk dimensions 2 and 1 | QE needed |
| §5.4 (prev.) | 𝔸¹_k → Spec k | rule (1): 1, 0; rule (2): 0, −1 | holds |
| §6.6 (prev.) | trait, n = 5 | Aut = (ℤ/5)ˣ, 4 elements; pinned: 1 | holds |
| §6.10 (prev.) | ℤ/6, 𝔽₂ ⊕ 𝔽₃[1] | n₂ = −2, 0; n₃ = −3, −1 | holds |
| §7.1 (prev.) | d = 1; f = 0 | H^i(η) = 0 for i > 1; empty open | holds |
| §7.3 (prev.) | k⟦x,y⟧, f = x, i = 0, 1, 2 | 0 → 0; 0 → 0; 0 → ℤ/ℓ(−1) | range sharp |
| `cohenGabber_equalCharacteristic` (prev.) | d = 0; cusp at p = 2, 3 | κ⟦⟧ = κ; degrees 3 and 2 | holds |
| `cohenGabber_mixedCharacteristic` (prev.) | W[π]/(π^ℓ − p)⟦x⟧, μ_ℓ | degree ℓ, invariant degree 1 | holds |
| `partialAlgebraization_equalCharacteristic` (prev.) | k⟦x,y⟧/(xy) | B = k, dim 0 = 1 − 1 | holds |
| `partialAlgebraization_mixedCharacteristic` (prev.) | p = 3, ℓ = 2 | A′ = W⟦x⟧, dim 2 | holds |
| `affineLefschetz_strictlyLocal` (prev.) | n = 0, 1; punctured k⟦x,y⟧; non-noetherian V | IsUnit 0 false; H³ = ℤ/ℓ(−2); H² = ∧²(ℤ/ℓ)² | each hypothesis used |
| `cohomologicalDimension_le_of_strictlyLocal` (prev.) | k⟦t⟧, d = 1; d = 0 | H¹(η) ≠ 0 at q = 1; d = 0 excluded | sharp |

## Not verifiable

- **Ser65** is settled as uncertified and I did not read it. I checked its statement through SGA4 line 1233 and NoncommutativeAndEquivariantIwasawa §0.11 (`:493`).
- **Ill03** and **Epp73** are settled as uncertified and are not involved in the change.
- **No local checkout** of LefschetzPencilsAndVanishingCycles (#873), ClassicalAdicEtaleCohomology (#875), NoncommutativeAndEquivariantIwasawa (#1307) or DiamondEtaleCohomology. I read them with `roadmaps show`; their README line numbers are the `roadmaps show` line minus its one-line header.

## Source issues

- **Error** in ILO14 at Exposé 0, Corollaire 8, p. 5: the source says an integral X has cd_ℓ(K) = d + cd_ℓ(k) with no further condition; it should require ℓ ≠ 2 or k not orderable, since SGA 4 X 2.3's henselized ℝ[x, y]/(x² + y²) gives 1 ≠ ∞ at ℓ = 2; affects a stated result.
- **Misprint** in SGA4 at Exposé X, proof of Corollaire 2.4, p. 50: the source says that for any x in the maximal ideal of the integral A, dim A/(x) = dim A − 1; it should take x nonzero, since x = 0 gives dim A; affects nothing.
- **Misprint** in SGA4 at Exposé X, proof of Théorème 2.2(i), p. 49 (retyped edition, line 1321): the source says H¹(H, μ_ℓ) is ℤ/r; it should be ℤ/ℓ, as computed in (2.2.2); affects nothing.
