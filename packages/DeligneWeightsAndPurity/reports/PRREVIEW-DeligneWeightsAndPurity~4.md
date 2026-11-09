# Review of DeligneWeightsAndPurity (pull request #929 at e0046cb)

**Verdict:** needs changes

This is an incremental re-review of the 36 lines changed since 6045677. They generalise §9.7(iii) and `lefschetzPairings` so that orthogonality and graded symmetry need only a `λ`-self-adjoint form. They also add an orthogonality argument and a fifth Check, and reword the module docstring. The mathematics of the change is correct: both generalised clauses are proved in Lean below for an arbitrary self-adjoint form. One locator defect remains in the changed passages.

## R01 (P3) — §9.7(iii) and `lefschetzPairings` cite a passage that has no bilinear form

**Location.** `TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean:171–172`: “Lefschetz pairings `ψ_r(x, y) = B (lam ^ r x) y` (§9.7(iii); Deligne (1968), (1.5)–(1.6), p. 108)”. The rewritten (iii) at `README.md:3056` has the only locator `README.md:3062`, “(Sources: [Lef], Théorème (1.5) and (1.6), p. 108.)”. The rewritten paragraph on `lefschetzPairings` (`README.md:3069–3073`) is followed by `README.md:3074`, “(Source: [Lef], (1.5)–(1.6), p. 108.)”.

**Claim.** [Lef] p. 108 supports (iii): the orthogonality, the graded symmetry and the nondegeneracy of `ψ_r`.

**Witness.** Lef line 49–86 (p. 108) holds Théorème (1.5), the primitive part and (1.6): decomposition (i) only. No bilinear form occurs in §1 (lines 19–140). The nondegeneracy and parity of `Tr(η^i x y)` are WII line 3099–3102, proof of (4.1.5), p. 218.

**Repair.**
1. In the docstring at `Suggested.lean:171–172`, replace “Deligne (1968), (1.5)–(1.6), p. 108” with “nondegeneracy and parity as in Weil II, proof of Corollaire (4.1.5), p. 218; orthogonality and the primitive restriction are proved in §9.7 from (i)”.
2. Rewrite `README.md:3062` as “(Sources: [Lef], Théorème (1.5) and (1.6), p. 108, for (i)–(ii); [WII], §4, Corollaire (4.1.5), proof, p. 218, for the nondegeneracy and parity of `ψ_r` in (iii).)”. Restrict `README.md:3074` to `lefschetzDecomposition`, or give it the same two-part locator.
3. After the orthogonality paragraph (`README.md:3058`), add one sentence: “Nondegeneracy on `P^{n−r}` follows from nondegeneracy on `V^{n−r}`, the spanning in (i) and this orthogonality.”

Every clause of (iii) then has either a locator or an argument in the README.

**Tested on the instance.** For `B = Tr(x ∪ y)`, WII line 3099–3102 gives exactly the nondegeneracy of `ψ_r` on `H^{n−r}` and alternation for `n − r` odd. The orthogonality paragraph is proved in Lean (`orth`, table row 9.7(iii)a). The primitive clause works as follows. Take `x ∈ P^{n−r}` with `ψ_r(x, P^{n−r}) = 0`. Then `ψ_r(x, λ^k p_k) = 0` for `k ≥ 1` by orthogonality, so `ψ_r(x, V^{n−r}) = 0` by (i), and hence `x = 0`.

## Previous findings

- none: the previous report (at 6045677) raised no finding.

That report also recorded R01–R06 of the review before it as repaired. Those repairs still stand at this head; the main merge moved the pins, and they were re-resolved at the new ones:
- SchemeAndStackFoundations §5.11 is at `README.md:7273` on main (000abc1), with `weil_bound` at `Suggested.lean:2598`; §3.1 is at `README.md:4647`, with `genus_baseChange` at `Suggested.lean:1859`.
- `WeierstrassCurve.frobeniusTrace_sq_le_four_mul_card` and `WeierstrassCurve.hasse_bound` are at `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:44,57` at Tau Ceti `2fd255d`. The file has no `sorry`, and the proof still goes through the degree of `r π − s`.
- “AL.3.11 The weight-facing acceptance suite” is at `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:2074` at its open head.
- “StandardConjectures” and `[Sch]` have zero occurrences.

## Verified sound

### Gate, dependency check, elaboration

- **Gate.** My rerun of the gate at e0046cb: `gate DeligneWeightsAndPurity: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run adds `build=0`.
- **Dependency check** (`--movable`): `depcheck: 236 roadmaps, 2273 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` edge and no supplier citation.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD` outside `TauCetiRoadmap/DeligneWeightsAndPurity/` is empty. The long list in the change summary comes from the merge of main. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`; `metadata.toml` is unchanged since 6045677.
- **Elaboration.** The main merge moved the pins to Mathlib `1b1ccf4` and Tau Ceti `2fd255d` (from `6b7abb3`/`a91d3aa`). At the new pins, `lake env lean TauCetiRoadmap/DeligneWeightsAndPurity/Suggested.lean` gives zero errors and five `sorry` warnings (lines 82, 96, 111, 154, 178).
- **Elaborated types.** `#check @name` for all ten declarations in one scratch file gives the types of the worker's `signatures.md`. `lefschetzPairings` keeps `[FiniteDimensional K V]`. The type puts `B.Nondegenerate` and the grading condition as premises of the nondegeneracy conjunct only, as in the README. `primitivePiece` correctly drops `[FiniteDimensional K V]`: it is an intersection with a kernel.
- **Probes.** I ran one-tactic probes on a scratch copy of the changed statement. `simp` leaves the nondegeneracy, orthogonality and symmetry goals open, and `aesop` fails after exhaustive search. It is not padding.
- **Headline theorems.** The list is unchanged: the abelian point-count bound, zeta rationality, degree-factor extraction and the graded Lefschetz decomposition and pairings are stated. The module docstring still names each cohomological headline as not statable, with the missing carrier. The changed docstring sentence (“primitive decomposition and Lefschetz pairings”) is wording only.

### Lean proofs of the generalised clauses (scratch file, at the pins)

These are machine checks of the new paragraph at `README.md:3058` and of conjuncts 2–3 of `lefschetzPairings`. Each statement is copied verbatim from `Suggested.lean`, with `primitivePiece` given the same body.
- `adj_pow`: `B ((λ^m) x) y = B x ((λ^m) y)`, by induction from `hadj`.
- `orth`: the orthogonality conjunct, for every `λ`-self-adjoint `B`. It uses no nondegeneracy, no grading condition on `B`, and no direct-sum, support or hard-Lefschetz hypothesis. The `k < l` case kills `λ^{l+r+k} p` through `ker λ^{r+2k+1}`; the `l < k` case moves the power across and kills `λ^{l+r+k} q`.
- `symm'`: the graded-symmetry conjunct, in two rewrites (`hsym`, then `adj_pow`).
- A negative-control `example` for the new Check: on `V = ℚ` with `λ = 0` and `B = 0`, `ψ₀`, restricted to `⊤`, is not nondegenerate.

All four elaborate without error. The only errors in the file are the intended `simp`/`aesop` probe failures.

### Adversarial computations

Rows for the changed statements and for the sampled Layer 9 targets are new. Every other row is carried forward unchanged:
- the rows of the previous report for 1.6, 1.8 and 8.13 (cases a–d and its API laws);
- the rows of `PRREVIEW-DeligneWeightsAndPurity~2` for sections 0.1–0.19, 1.1–1.5, 1.7, 1.9–1.10, 2.1–2.11, 3.1–3.11, 4.1–4.4, 5.1–5.19, 6.1–6.5, 7.1–7.15, 8.1–8.12, 8.14–8.24, 9.1–9.6, 9.9, 9.11–9.12 and 10.1–10.6, and for the four Lean headlines `abelianPointCountBound`, `finiteFieldZetaRationality`, `degreeFactorExtraction` and `lefschetzDecomposition`.

Those passages and statements did not change.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| 9.7(iii)a orthogonality (changed: no nondegeneracy) | Lean `orth`; `n=2`, `V^0=Ke₀`, `V^2=⟨e₂,e₂′⟩`, `V^4=Ke₄`, `λ:e₀↦e₂↦e₄`, `λe₂′=0`; `B(e₀,e₄)=B(e₄,e₀)=B(e₂,e₂)=1`, `B(e₀,e₀)=5`, other values `0` | self-adjoint: `B(λe₀,e₂)=1=B(e₀,λe₂)`, `B(λe₂,e₀)=1=B(e₂,λe₀)`; `B` degenerate (`e₂′` in its radical) and not grading-compatible (`0+0≠4`); `P²=Ke₂′`, `λP⁰=Ke₂`; `B(e₂,e₂′)=B(e₀,λe₂′)=0`, `B(e₂′,e₂)=B(λe₂′,e₀)=0` | pass |
| 9.7(iii)b graded symmetry (changed: no nondegeneracy) | Lean `symm'`; `n=1`, `V^1=⟨e₁,f₁⟩`, `B(e₁,f₁)=1=−B(f₁,e₁)`, `B(e₀,e₂)=B(e₂,e₀)=1`, `λe₀=e₂` | `ψ₀(f₁,e₁)=−1=(−1)^1·ψ₀(e₁,f₁)`; `ψ₁(e₀,e₀)=B(e₂,e₀)=1=(−1)^0·1`; char 2: `−1=1`, only symmetry claimed, no alternation | pass |
| 9.7(iii)c nondegeneracy (hypotheses now premises of this clause only) | `n=0`, `V=K`, `B=xy`; the degenerate `B` of row a; `ℙ¹×ℙ¹` model `H²=⟨a,b⟩`, `η=a+b`, `Tr(ab)=1` | `ψ₀=xy` nondegenerate on `V^0=P^0=K`; row a: `ψ₀|P²=B(e₂′,e₂′)=0`, degenerate exactly because `B` is; `P²=K(a−b)`, `ψ₀(a−b,a−b)=Tr(−2ab)=−2≠0`, `ψ₂` on `H⁰`: `Tr(η²)=2≠0` | pass |
| New Check (`V=K`, `λ=0`, `n=0`, `B=0`) | Lean negative control | `B(λx,y)=0=B(x,λy)`; `B(y,x)=(−1)^0B(x,y)=0`; grading condition vacuous; `P⁰=K∩ker λ=K`; `ψ₀=0` on `K≠0`, degenerate; orthogonality and symmetry `0=0` | pass |
| `lefschetzPairings` (Lean, changed) | elaborated type against README (iii) | conjunct 1: `B.Nondegenerate → grading → ψ_r` nondegenerate on `𝒱(n−r)` and on `primitivePiece … r`; conjuncts 2–3 under `hadj` alone; `[FiniteDimensional K V]` in scope; `(−1:K)^a` is `zpow` on `ℤ`; `r ≤ n` keeps `𝒱(n−r)` in range, and `primitivePiece` at `r+2k>n` is `⊥` by `hout` | pass |
| 9.8 (sampled; consumes 9.7(iii)) | `ℙ¹×ℙ¹`, `η=a+b`; `ℙ²`; curve of genus `g`, degree `e` | `dim P²=1=b₂−b₀=2−1`; `ψ₀(a−b,η·1)=Tr(a²−b²)=0` (orthogonal); `ℙ²`: `P²=0=b₂−b₀`; curve: `ψ₀` alternating on `H¹` of dimension `2g`, `ψ₁=e` on `H⁰`; trace pairing is self-adjoint since `η` is even, graded-symmetric since `(−1)^{a(2n−a)}=(−1)^a`, grading-compatible | pass |
| 9.2 (sampled) | swap on `K²`, char 0, dot product; `u=[[1,1],[0,1]]` with `det`; swap over `𝔽₂` | `V^π=K(1,1)`, `Φ((1,1),(1,1))=2≠0`; `det` is `u`-invariant and nondegenerate, `V^π=Ke₁`, `det(e₁,e₁)=0` (not completely reducible); `𝔽₂`: `Φ=2=0`, Maschke fails | pass |
| 9.10 (sampled) | `X` a point, `K=ℚ̄_ℓ[0]` | `dim Supp ℋ⁰K=0≤n` and `DK[−2n]=ℚ̄_ℓ[−2n]`, `0≤n−2n` force `n=0`; `η⁰=id` is an isomorphism; with `n=1` the dual condition fails and `η:H⁰=ℚ̄_ℓ→H²=0` is not an isomorphism | pass |

### Seeded source sample

Texts were fetched from Numdam (open repository), and the line numbers are from the sources cache. I re-opened the targets that fall in the changed passages or in their Layer 9 neighbours.

| Target | Locator opened | Supports the statement as written |
| --- | --- | --- |
| 9.7(i)–(ii) | Lef line 58–71, Théorème (1.5) and (1.6), p. 108 | yes: primitive part `ker u^{i+1}`, the two decompositions with exponents `k` and `i+k`. (iii) is not supported there: R01 |
| 9.8 | Lef line 64–71, p. 108; WII line 3097–3102, Corollaire (4.1.5) and proof, p. 218 | yes: the decomposition from (1.6); `Tr(η^i x y)` on `H^{n−i}` nondegenerate by (4.1.1) and Poincaré duality, alternating for `n−i` odd; orthogonality and primitive nondegeneracy come through §9.7 |
| 9.2 | WII line 3091–3096, Lemme (4.1.4), p. 218 | yes: completely reducible representation, invariant nondegenerate form, `V = V^π ⊕ W` with `W` orthogonal to `V^π`; no symmetry assumed, as the README notes |
| 9.10 | WII line 4247–4254, Théorème (6.2.13), p. 250; line 4255–4272, proof, pp. 250–251 | yes: projective `X ⊂ P`, potentially pure `K`, both support conditions with `dim ∅ = −∞`; induction through a general hyperplane section with `n` replaced by `n−1`, `D(K|Y) = (DK)|Y(−1)[−2]`, and (4.1.4) on the semisimple monodromy |

The other sampled targets lie outside the changed passages and were not re-opened in this incremental review:
- 1.1 and 3.8 were verified at their locators in the previous report's sample (AV pp. 75–76; WI Proposition (6.6), p. 296), and 1.8 in its adversarial rows.
- 0.4, 1.10, 2.10, 5.8, 7.10, 8.5, 8.9, 8.17 and 8.23 are unchanged since the second report, whose rows are carried above.

The README flags no locator as unverified.

### Library declarations opened at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`)

- Mathlib: `Mathlib/LinearAlgebra/BilinearForm/Properties.lean:291` (`LinearMap.BilinForm.Nondegenerate` is an abbreviation of `LinearMap.Nondegenerate`); `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:525,543,547`. There, `SeparatingLeft`, `SeparatingRight` and `Nondegenerate` are their conjunction, so the restricted-form conclusions demand both separations, which finite dimensionality makes equivalent.
- Tau Ceti: `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean:44,57` and `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95,97` (`AbelianVariety`, `toOver`, used by `abelianPointCountBound`).

### Cross-roadmap citations and ownership

- **Citations.** The diff adds no cross-roadmap citation. The worker's citation check and `roadmaps overlaps` list nothing missing, nothing dropped and no other pull request changing this roadmap.
- **Consumers of §9.7.** EtaleDualityAndPerverseSheaves, at its open head (`README.md:5831`), cites only §9.7 (i)–(ii), which is unaffected. LefschetzStructures (open, another author; `README.md:283–286`) consumes `lefschetzPairings` and asks to “prove that the orthogonality uses only compatibility”. §9.7(iii) now states exactly that, so the clause there becomes a citation of §9.7. That is a matter for that roadmap's review; this roadmap remains the earlier owner.
- **Duplication.** No object is added. Mathlib at the pin has no primitive decomposition or Lefschetz pairing (the previous reports' search), and the generalisation duplicates nothing.
- **Ownership against open pull requests.** It was checked only through the sibling heads the brief provides and the `roadmaps grep` index, not otherwise.

### Shape

The changed passages are prose with hypotheses in the sentence and no LaTeX. They contain no process words, no pull-request numbers and no local paths. The new Check is a prose bullet naming no Lean counterpart, which brings §9.7 to five Checks. The README paragraph and the Lean docstring agree with the Lean signature clause by clause.

### Remarks on untouched text (no change requested)

- `README.md:201` links `hasse_bound` at Tau Ceti `a91d3aa`; the pin is now `2fd255d`, where the declaration is at `HasseBound.lean:57` with the same statement.

## Not verifiable

- Nothing this round needed an unreadable text. [Int] (SGA 7 II XXI §5, §§7.9–7.10) is still cited by locator only, as in the previous reports; those passages are unchanged.

## Source issues

- none
