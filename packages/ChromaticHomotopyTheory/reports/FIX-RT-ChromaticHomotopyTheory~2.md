# ChromaticHomotopyTheory repair report

The first two finding sections answer RT-ChromaticHomotopyTheory_r2a.md (pass a). The last two answer RT-ChromaticHomotopyTheory_r2b.md (pass b). The two passes reuse the identifiers F01 and F02 for different findings. None of the four findings overlap. Pass b F01 re-raises the round-one F03, which the previous repair marked not actionable. Under the brief, that decision now belongs to a human. Pass b F02 is settled here on its merits, with §8.3 kept as it stands.

## F01 (P3) — applied

In §4.1 the third Check repeated the first two: "L₀^fS=Hℚ … L_n^(p,f)(S/q)=S/q". It is replaced by a test at n=1: L₁^fK(1)≃L₁^(p,f)K(1)≃K(1)≠0. Both Hℚ⊗K(1) and S[1/p]⊗K(1) vanish, so the constant-bottom towers Hℚ⊗X and S[1/p]⊗X fail it.

I searched for the same pattern: a definition block left with fewer than three distinct Checks. I counted the distinct tests in all thirteen API blocks:

| Block | Distinct tests |
| --- | --- |
| §3.1 | 5 |
| §5.1 | 4 |
| §5.2 | 3 |
| §6.1 | 3 |
| §6.3 | 3 |
| §7.1 | 4 |
| §7.2 | 4 |
| §10.1 | ≥3 |
| §10.3 | 4 |
| §12.3 | ≥3 |
| §13.1 | 3 |
| §13.3 | 4 |

Every block other than §4.1 already had at least three, so nothing else changed.

## F02 (P3) — applied

**What changed.** "AlgebraicTopology Stage 8 (fiber exact sequence)" became "StableHomotopyKTheory §§2.4–2.7 (homotopy-fiber exact sequence, connecting maps and basepoint transport)". This covers the Scope bullet, both contracts, the §3.1 Needs and the Layer 3 Dependencies; Stage 8 now covers relative pairs, Hurewicz, Whitehead and Eilenberg–Mac Lane maps. Repairing the pattern added §2.5 to §6.4, §13.2 and §13.3, which compute homotopy of fibers, and to the Layer 6 and 13 Dependencies.

Evidence for the repair:
- AlgebraicTopology Stage 8 item 1 (main) states relative groups and the exact sequence of a based pair only for NDR pairs or cofibrations.
- StableHomotopyKTheory §2.5 (head #1227, merge position 4) proves exactness for every based continuous map. §2.4 gives the connecting map, §2.6 the π₁-action and §2.7 transport.
- Witness: for BS₃×K(C_q,2)→BS₃ the fiber has π₂=C_q and π₁=0, and no NDR condition is needed.

## F01 (P1) — not actionable in this package: re-raised after the previous round marked it not actionable; moving higher-height separation to a ChromaticHomotopyTheory Part II, or moving GeneralAlgebraicKTheoryPartII's purity and BP inputs here, is a scope and ownership decision for a human

No edit was made.

**The cycle is real.** I verified the witness on the board.
- `packages/GeneralAlgebraicKTheoryPartII/design/README.md` line 52 imports "ChromaticHomotopyTheory CH.0–CH.13".
- Its line 1005 lists the KII.5 stage inputs CH.4, CH.6, CH.9 and CH.10.
- Its line 1155 lists the KII.6 stage inputs, which include CH.8.
- Its line 1250 makes `KII.6/optimality` take `ChromaticHomotopyTheory:CH.8/telescope-separation`, which is §8.3 itself, as a direct input.
- This package's §8.3 declares gaps on KII.5 and KII.6.
- `ORDER.txt` places GeneralAlgebraicKTheoryPartII at 220 and this roadmap at 222.

The dependency gate reports no problem because the design cites in its own `Name:CH.n` form.

**Why no edit is made here.** Settling it means either:
- removing a planned theorem and pointing to a Part II roadmap that does not exist yet (a scope change), or
- editing GeneralAlgebraicKTheoryPartII.

The brief reserves re-raised findings for a human.

**Information for that decision.**
- KII.6/optimality only needs a connective spectrum that is T(n−1)-acyclic but T(n)-nonzero. A finite type-n complex supplies one, so the Part II cut would not leave it without an input.
- After the cut, the intake must reorder the two roadmaps so that this one comes first.

## F02 (P2) — applied differently

**What changed.** gap:bhls-purity-comparison went from the whole connective-plus-fixed-point diagram to only the L_T(h+1)-equivalence of the trace K(A^(hℤ))→TC(A^(hℤ)) via Levy's theorem, without T(h+1)-acyclicity. The connective rows now come from KII.5's purity theorem and high-height trace; §8.3 proves L_(T(h)∨T(h+1))A=L_T(h)A as a Check. gap:bhls-bp-redshift gains fp-type h. The route, Needs, Checks, Dependencies, docstring, plan gaps and locator were updated to match.

**Why "applied differently".** The suggested wording, "the … diagram … consists of L_T(h+1)-equivalences", would also make the coassembly maps equivalences. bhls line 3200 says they are not isomorphisms.

**Evidence.**
- The connective half is bhls Theorem 6.1 (line 2876). It is KII.5/purity, stated for every E₁ ring, together with KII.5/high-trace, stated for every E₁ ring and n≥2 (design lines 1108 and 1028).
- The fixed-point half is bhls Theorem 6.2 and Corollary 6.3 (lines 2886 and 2906–2913). The design has no node for it.
- fp-type is bhls Definition 4.1 (line 1596) and is used at line 3218. A roadmaps grep finds no owner on main or at any open head.
- The non-vanishing clause of gap:bhls-bp-redshift stays. No KII.6 node states it for the associative model: KII.6/redshift needs an E∞ ring, and KII.6/yuan-lower is about Lubin–Tate theories.

## Required checks

| Check | Exact outcome |
| --- | --- |
| `lake env lean` on `packages/ChromaticHomotopyTheory/Suggested.lean`, run from the content checkout | Exit 0 with no diagnostics. No TauCeti import, so no module build was needed. |
| Signature inventory | 0 declarations, 0 `variable`s, 0 instances, 0 `sorry`, so the `#check @name` list is empty. The scratch file holds only `import Mathlib`; it elaborated once with exit 0. No elaborated type changed. |
| Dependency direction | Exit 0. Output below. No UPWARD, CYCLE or `moved:` line. |
| `roadmaps resolve` on the README | "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None." |
| Plan boundary | Only `gaps[4].needs` and `gaps[5].needs` changed. A parsed comparison of every other key against HEAD is equal. All six slugs, suppliers and needs sentences match the README character for character. |
| Sources | No new source was fetched and no text is missing, so `needs-references.toml` was not written. The bhls manifest locator and its README reference now add Definition 4.1, Corollary 4.33 and Theorem 6.2. |
| Form | `git diff --check` exit 0. No machine path. The edits add no process wording. |
| Gate failures listed in the brief | None were listed. |

```text
depcheck: 55 roadmaps, 616 edges, 0 problem(s)
```

The clean gate does not exclude the cycle described under pass b F01.

## Adversarial mathematics pass (changed statements)

| Statement | Instances | Computed values | Result |
| --- | --- | --- | --- |
| §4.1 Check at n=1 | K(1) at p=2; constant towers Hℚ⊗X, S[1/p]⊗X | π₀K(1)=𝔽₂ and p acts by 0, so Hℚ⊗K(1)=0 and K(1)[1/p]=0; K(1) is local for Hℚ∨T(1) and S[1/p]∨T(1) because ⟨K(1)⟩≤⟨T(1)⟩, so both towers give K(1) | Discriminates |
| §3.1 relative condition, now on §2.5 | id on BS₃; BS₃×K(C_q,2)→BS₃ with q=p and q≠p | Fiber groups for k≥2 are 0; π₂ fiber[1/p] is 0 for q=p and ℤ/q for q≠p; π₁ fiber is 0 | Unchanged truth, correct supplier |
| §13.2 and §13.3 fibers via §2.5 | (S³)_p^∧→K(ℤ_p,3); S³→K(ℤ_p,3); J₁S²→K(ℤ,2) | π₃: id, so π₃=π₂=0; uncompleted source gives π₂=ℤ_p/ℤ; π₂ iso gives fiber π₁=π₂=0 | Matches the existing Checks |
| §6.4 with §2.5 | id; Hℤ→0 | Fibers 0, and Hℤ (π₀=ℤ, not (n+1)-connective) | Unchanged |
| L_(T(n−1)∨T(n))C=L_T(n−1)C for T(n)-acyclic E₁ C | Hℤ_p, n=2; E₂, n=2 | Hℤ_p: 0=0 and L_T(2)K(ℤ_p)=0. E₂: left side E₂, right side has π₀ (W(𝔽_(p²))((u₁)))_p^∧≠W[[u₁]] | Hypothesis needed and kept |
| Restated purity gap | A=0; A=Hℤ_p with trivial action, h=1; A=BP⟨1⟩, p=2, k=0; h=0 | 0→0. ℤ_p^(hℤ) is an Hℤ-algebra, so K and TC are both T(2)-acyclic (Mitchell), giving 0→0. π₋₁=ℤ₂, so the input is not connective. At h=0, Mitchell vanishing fails for T(1) | h≥1 kept, acyclicity dropped, coassembly not claimed |
| fp-type clause | ku_2^∧ with U=cofib(v₁⁴ on S/2); S/2; BP⊗V(1) at odd p | 𝔽₂[v₁]/(v₁⁴) in degrees 0, 2, 4, 6; 𝔽₂[v₁] in every even degree; 𝔽_p[v₂,v₃,…] infinite | Index h is sharp; truncation is essential |
| fp-type ⇒ T(n)-acyclic (§8.3 route) | h=1, p=2 | U⊗B lies in degrees 0–6. Any v₂ self-map has degree divisible by 6 and above 6, so it is null, and the telescope is 0 | Holds |

## Maintainer notes

- No Lean name changed. The two gap slugs are unchanged. The needs sentences of gap:bhls-purity-comparison and gap:bhls-bp-redshift changed, so a gap announcement to GeneralAlgebraicKTheoryPartII should use the new text.
- No ownership was claimed. No new target or construction was added, and ownership searches by object found no other owner of fp-type or of Levy's fixed-point theorem.
- The cycle with GeneralAlgebraicKTheoryPartII still needs a decision. Its `KII.6/optimality` citation of CH.8/telescope-separation would need repointing under the Part II option.
- The non-vanishing clause could probably be derived instead. The route would be: the model's E₁ map to Lubin–Tate theory, then KII.5/purity, then KII.6/yuan-lower. That step goes beyond these findings, so it was not applied.
