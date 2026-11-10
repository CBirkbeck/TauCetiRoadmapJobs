# FIX-DESIGN-Varifolds~3: repair of the Varifolds design, round 3

One review: REV-DESIGN-Varifolds~2 (two findings, both P3). Both checked against the mathematics and
fixed. Files changed: `packages/Varifolds/design/README.md` and `packages/Varifolds/design/plan.json`.
`packages/Varifolds/sources.toml` is unchanged: no new source is cited.

## REV-DESIGN-Varifolds~2/F01 (P3) — applied

1.1 bullet, old: "for an injective linear map L : E → F … continuous on the set of such pairs". New:
L only injective on range P; these pairs are open; the image projection in G(F, k) is continuous,
equal to Q(Q*Q + 1 − P)⁻¹Q* with Q = L∘P. Added a 1.1 Check (L_s = diag(1, s)); 3.1 cites 1.1
(text, *Needs:*, plan prerequisite); plan API and test updated.

## REV-DESIGN-Varifolds~2/F02 (P3) — applied

6.4, old: "V = θ_0 [Σ], θ_0 ≥ 0; if V ≠ 0, Σ is closed…". New: "either V = 0, or Σ is closed in W,
Hᵏ(Σ ∩ K) < ∞ for every compact K (so [Σ] is defined), and V = θ_0[Σ] with θ_0 > 0". The route now
derives closedness and locally finite area from θ_0 > 0. The sin(1/t) graph is a new Check; plan
statement and test updated.

## Verification and same-pattern repairs

- **F01 is right.** For f(y) = (y_1, 0) and S = span(e_1), J_S f = 1, so the pair is in 3.1's set,
  while df = diag(1, 0) is not injective.
- **F01 pattern.** The only other place that moves planes by a linear map is 1.2's isometry bullet,
  where df_x is orthogonal. No change there.
- **F02 is right.** The graph of sin(1/t) over (0, 1) is connected and C² embedded, with length at
  least ∫_1^∞ |cos u| du = ∞ inside B̄_2(0). V = 0 is stationary with support in it, and [Σ] is
  undefined for this Σ.
- **F02 pattern ([·] applied outside 2.3's domain).** 9.4 wrote R_#[C_{p,q}], but the cone is not a
  submanifold at 0. It now reads R_# v(C_{p,q}, 1), with a clause that this equals [C_{p,q} ∖ {0}]
  (a smooth hypersurface of locally finite area, and {0} is Hⁿ-null). The 9.4 Check and the plan's
  "cone itself" test now say v(C_{p,q}, 1).
- **Checked, no change needed:**
  - 9.1's bullet already has θ_0 > 0, and x ∈ spt‖V‖ forces the second case;
  - 7.3's route has a tangent cone C ≠ 0, so again the second case;
  - [S^k], [C], [W], [half-line], [curve] and the Σ of 5.1 and 9.4 all have locally finite area.

## Checks run

**Dependency gate** (after the edits):

    candidate: Varifolds is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
    depcheck: 234 roadmaps, 2109 edges, 0 problem(s)

No UPWARD or CYCLE line. The previous review's run placed the candidate after GlaubermanZStar;
this run places it after QuasiregularMaps. No supplier was added or removed in this round, so the
README did not cause the difference.

**Citations.** `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name
that is missing everywhere. No new backticked name and no new cross-roadmap citation were added.

**Other checks.**
- `plan.json` parses and still has 34 targets.
- The README still has 34 `**Checks.**` blocks.
- No LaTeX delimiters, machine paths or process words were added.

**Suggested.lean.** Not applicable: this is the design stage, so there is no Lean file and nothing
was elaborated.

**Gate failures.** None were listed for this round.

**Ownership.** No new object was introduced. The image-plane continuity is a lemma on 1.1's own
carrier, and 6.4 is unchanged in ownership. The ownership check against open pull requests from the
previous rounds still holds; overlaps.md reports no conflicting or dropped ids.

## Adversarial pass (changed and added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 image-plane bullet, the review's case | L = diag(1,0), P = P_{ℓ_0} | Q = diag(1,0), Q*Q = diag(1,0), 1 − P = diag(0,1), A = 1, QA⁻¹Q* = diag(1,0) = P_{ℓ_0} | in the open set, correct value | new bullet |
| 1.1 bullet, k = 0 | P = 0 | Q = 0, A = 1, projection 0 = P_{{0}}; every L allowed | ok | — |
| 1.1 bullet, k = dim E | P = 1, L = 2·id on ℝ | A = L*L = 4, L A⁻¹ L* = 2·¼·2 = 1 | ok | — |
| 1.1 bullet, L into a bigger space | L(t) = (t, t), E = ℝ, F = ℝ² | Q*Q = 2, projection ½[[1,1],[1,1]], its square ¼[[2,2],[2,2]] = itself, range is the diagonal | ok | — |
| 1.1 bullet, A invertible ⟺ L injective on range P | v = a + b, a ∈ range P, b ∈ ker P | Av = Q*Qa + b, Q*Qa ∈ range P, ⟨Q*Qa, a⟩ = \|La\|² | open set = {A invertible} | — |
| 1.1 bullet, QA⁻¹Q* is the projection onto range Q | general | self-adjoint; Q*Q A⁻¹ Q* = Q* gives idempotent; ΠQ = Q gives range ⊇ range Q | ok | — |
| 1.1 bullet, wrong model "QQ*" | L = 2·id, k = dim E | QQ* = 4 ≠ projection | ruled out by the formula | — |
| 1.1 new Check, edge of the set | L_s = diag(1,s), ℓ_θ | image span(cos θ, s sin θ): s = 0, θ → π/2 gives ℓ_0; θ = π/2, s → 0 gives ℓ_{π/2} | no continuous extension | new Check |
| 3.1 projection-form continuity | f = (y_1,0); S = span e_1, then e_2 | J = 1 (inside the set, image ℓ_0); J = 0 (outside) | matches 1.1 | pointer + *Needs:* |
| 6.4 new statement, V = 0 | sin(1/t) graph Σ | length ≥ ∫_1^∞\|cos u\|du = ∞, Σ ⊆ (0,1)×[−1,1] ⊆ B̄_2, closure ⊇ {0}×[−1,1] | first case; [Σ] not used | new statement, new Check |
| 6.4, second case | v(L,3) | L closed, H¹(L ∩ B̄_r) = 2r < ∞, θ_0 = 3 > 0 | ok | — |
| 6.4, k = N | Σ = W connected | V = 0 or θ_0·Vol_g, θ_0 > 0, Vol_g is Radon | ok | — |
| 6.4, open disc | k = N = 2, Σ = open unit disc | θ_0 > 0 would need spt = closed disc ⊄ Σ, so V = 0; agrees with 6.5 for K = ∅ | consistent | — |
| 6.4, closed implies locally finite area | Σ closed in W, compact K | Σ ∩ K compact in Σ, finitely many slice patches of finite area | second clause true (also redundant) | — |
| 6.4 route, last step | θ_0 > 0 | Hᵏ⌞Σ = θ_0⁻¹‖V‖ is Radon; spt‖V‖ = closure of Σ in W (2.3) ⊆ Σ | Σ closed | route sentence |
| 6.4, disconnected | v(L_1,1) + v(L_2,2) | stationary, multiplicities 1 ≠ 2 | hypothesis needed | — |
| 9.1 bullet, uses 6.4 | x ∈ reg² V | V⌞U ≠ 0, spt ∩ U closed in U: second case, θ_0 > 0 | consistent | — |
| 7.3 route, uses 6.4 | tangent cone C, Θ(x) > 0 | C ≠ 0: second case, C = Θ(x)v(T,1) | consistent | — |
| 9.4, v(C_{p,q},1) | p + q = n − 1 | ∇(q\|x\|² − p\|y\|²) = (2qx, −2py) ≠ 0 off 0; dimension (p+1)+(q+1)−1 = n; Hⁿ(C ∩ B_r) = rⁿHⁿ(C ∩ B_1) < ∞; {0} Hⁿ-null | v(C,1) = [C∖{0}] | notation |
| 9.4 Check, V = v(C_{p,q},1), V_i = V | n ≥ 8 | sing^∞ V ∩ B_{1/2} = {0}, V ∈ VarTan(V,0), R' = id | y_i = 0 | wording |

## For the maintainer

- No name that other roadmaps cite was changed. No section was renumbered: 1.1, 3.1, 6.4 and 9.4 keep
  their numbers and headings.
- No source was fetched or added, and `needs-references.toml` was not created.
- The new statements were checked against Simon1983 line 7664–7732 (41.1, and 41.2(1): M is closed in
  U when V ≠ 0) and EdelenSpolaor2023 line 104–112 (Definition 1.1.1, "C_{p,q} with multiplicity one").
- No untrusted text asked for anything outside the job.
